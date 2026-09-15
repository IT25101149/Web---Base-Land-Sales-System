package com.landsales;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class LandSalesApplication {
    public static void main(String[] args) { 
        SpringApplication.run(LandSalesApplication.class, args); 
    }
}
