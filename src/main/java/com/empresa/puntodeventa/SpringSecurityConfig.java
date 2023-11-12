package com.empresa.puntodeventa;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
public class SpringSecurityConfig {

    @Bean
    public static BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService() throws Exception {

        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(User
                .withUsername("user")
                .password(passwordEncoder().encode("user"))
                .roles("USER")
                .build());
        manager.createUser(User
                .withUsername("admin")
                .password(passwordEncoder().encode("admin"))
                .roles("ADMIN", "USER")
                .build());

        return manager;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http

                .authorizeHttpRequests((authz) -> authz
                        .requestMatchers("/", "/css/**", "/js/**", "/imagenes/**").permitAll()
                        .requestMatchers("/admin/crear/**").hasRole("ADMIN")
                        .requestMatchers("/ver/**", "/admin/listar/**").permitAll()
                        .requestMatchers("/factura/**").hasRole("USER")
                        .requestMatchers("/admin/eliminar/**").permitAll()
                        .anyRequest().authenticated()

                ).headers(headers -> headers
                        .frameOptions(frameOptions -> frameOptions.sameOrigin()));
        return http.build();

    }


}