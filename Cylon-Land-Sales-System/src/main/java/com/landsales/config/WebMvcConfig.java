package com.landsales.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;
import java.nio.file.Paths;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String uploadDir = "uploads";
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File propDir = new File(uploadDir + "/properties");
        if (!propDir.exists()) {
            propDir.mkdirs();
        }

        String uploadPath = Paths.get(uploadDir).toAbsolutePath().toUri().toString();
        if (!uploadPath.endsWith("/")) {
            uploadPath += "/";
        }

        registry.addResourceHandler("/uploads/**")
                .addResourceLocations(uploadPath, "file:uploads/", "file:" + dir.getAbsolutePath() + "/");

        registry.addResourceHandler("/images/**")
                .addResourceLocations("classpath:/static/images/", "file:uploads/images/", "file:uploads/");
    }
}
