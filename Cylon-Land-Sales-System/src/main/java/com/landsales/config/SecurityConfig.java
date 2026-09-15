package com.landsales.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired(required = false)
    private com.landsales.admin.service.AuditLogService auditLogService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .headers(headers -> headers.frameOptions(frame -> frame.sameOrigin()))
            .authorizeHttpRequests(auth -> auth
                .dispatcherTypeMatchers(jakarta.servlet.DispatcherType.FORWARD, jakarta.servlet.DispatcherType.ERROR).permitAll()
                .requestMatchers("/", "/h2-console/**", "/static/**", "/css/**", "/js/**", "/images/**", "/uploads/**", "/login", "/home", "/properties/**", "/about", "/how-it-works", "/contact", "/contact/**", "/register", "/register/**").permitAll()
                .requestMatchers("/property/add", "/property/create", "/property/edit/**", "/property/delete/**", "/property/save", "/property/update").hasAnyRole("ADMIN", "PROPERTY", "PROPERTY_MANAGER")
                .requestMatchers("/property", "/property/**").hasAnyRole("ADMIN", "PROPERTY", "PROPERTY_MANAGER", "SALES", "SURVEY")
                .requestMatchers("/crm/**").hasRole("ADMIN")
                .requestMatchers("/sales/**").hasAnyRole("ADMIN", "SALES")
                .requestMatchers("/survey", "/survey/**").hasAnyRole("ADMIN", "SURVEY")
                .requestMatchers("/legal/**").hasAnyRole("ADMIN", "LEGAL")
                .requestMatchers("/customer/**", "/api/notifications/**").authenticated()
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .successHandler((request, response, authentication) -> {
                    if (auditLogService != null && authentication != null) {
                        String role = authentication.getAuthorities().stream()
                                .findFirst()
                                .map(Object::toString)
                                .orElse("USER");
                        String ip = request.getRemoteAddr();
                        auditLogService.log(authentication.getName(), role, "USER_LOGIN", "AUTHENTICATION",
                                "User '" + authentication.getName() + "' logged in successfully", ip, "SUCCESS");
                    }

                    boolean isCustomer = authentication.getAuthorities().stream()
                            .anyMatch(r -> r.getAuthority().equals("ROLE_CUSTOMER"));
                    boolean isLegal = authentication.getAuthorities().stream()
                            .anyMatch(r -> r.getAuthority().equals("ROLE_LEGAL"));
                    boolean isSurvey = authentication.getAuthorities().stream()
                            .anyMatch(r -> r.getAuthority().equals("ROLE_SURVEY"));
                    boolean isSales = authentication.getAuthorities().stream()
                            .anyMatch(r -> r.getAuthority().equals("ROLE_SALES"));
                    boolean isProperty = authentication.getAuthorities().stream()
                            .anyMatch(r -> r.getAuthority().equals("ROLE_PROPERTY") || r.getAuthority().equals("ROLE_PROPERTY_MANAGER"));

                    if (isCustomer) {
                        response.sendRedirect(request.getContextPath() + "/home");
                    } else if (isLegal) {
                        response.sendRedirect(request.getContextPath() + "/legal");
                    } else if (isSurvey) {
                        response.sendRedirect(request.getContextPath() + "/survey");
                    } else if (isSales) {
                        response.sendRedirect(request.getContextPath() + "/sales");
                    } else if (isProperty) {
                        response.sendRedirect(request.getContextPath() + "/property");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                    }
                })
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessHandler((request, response, authentication) -> {
                    if (auditLogService != null && authentication != null) {
                        String role = authentication.getAuthorities().stream().findFirst().map(Object::toString).orElse("USER");
                        auditLogService.log(authentication.getName(), role, "USER_LOGOUT", "AUTHENTICATION",
                                "User '" + authentication.getName() + "' logged out", request.getRemoteAddr(), "SUCCESS");
                    }
                    response.sendRedirect(request.getContextPath() + "/home?logout=true");
                })
                .permitAll()
            );
        return http.build();
    }
}

