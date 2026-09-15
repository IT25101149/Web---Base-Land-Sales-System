package com.landsales.config;

import com.landsales.admin.entity.User;
import com.landsales.admin.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // We find by username. Since UserRepository doesn't have findByUsername, we can find in a stream or add findByUsername to UserRepository.
        // Let's add findByUsername to UserRepository or just query all. Actually, adding it to UserRepository is better, but let's check.
        // Let's use userRepository.findAll().stream().filter(u -> u.getUsername().equals(username)).findFirst()... to be safe and avoid modifying interface,
        // or we can add it to UserRepository. Let's add findByUsername to UserRepository. It's cleaner.
        User user = userRepository.findAll().stream()
                .filter(u -> u.getUsername().equalsIgnoreCase(username))
                .findFirst()
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));

        return new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole()))
        );
    }
}
