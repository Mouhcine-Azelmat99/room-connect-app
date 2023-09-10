package com.lqt.security;

import com.lqt.service.serviceImpl.CustomAuthentificationService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
//@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomAuthentificationService();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider authenticationProvider=new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService());
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .csrf(csrf -> csrf.disable())
                .authorizeRequests(auth -> auth
                        .requestMatchers(new AntPathRequestMatcher("/public/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/app/admin/**")).hasRole("ADMIN")
                        .requestMatchers(new AntPathRequestMatcher("/app/landlord/**")).hasRole("LANDLORD")
                        .requestMatchers(new AntPathRequestMatcher("/app/tenant/**")).hasRole("TENANT")
                        .requestMatchers(new AntPathRequestMatcher("/app/**")).authenticated()
                        .requestMatchers(new AntPathRequestMatcher("/")).authenticated()
                        .requestMatchers(new AntPathRequestMatcher("login")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("register")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/webapp/resources/**")).permitAll()
                )
                .formLogin(f -> f.loginPage("/login").defaultSuccessUrl("/home"))
                .logout(l -> l.logoutUrl("/logout").logoutSuccessUrl("/login").permitAll())
                .exceptionHandling(ex -> ex.accessDeniedPage("/accessDenied"))
                .httpBasic(Customizer.withDefaults())
                .build();
    }
}