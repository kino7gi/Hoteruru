package com.example.demo.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class WebSecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

		http
				.authorizeHttpRequests((requests) -> requests
						// すべてのユーザーにアクセスを許可するURL
						.requestMatchers(
								"/css/**",
								"/images/**",
								"/js/**",
								"/storage/**",
								"/",
								"/signup/**",
								"/houses",
								"/houses/{id}",
								"/stripe/webhook")
						.permitAll()
						// 管理者のみ
						.requestMatchers("/admin/**").hasRole("ADMIN")
						// それ以外はログイン必須
						.anyRequest().authenticated())
				.formLogin((form) -> form
						.loginPage("/login")
						.loginProcessingUrl("/login")
						.defaultSuccessUrl("/?loggedIn")
						.failureUrl("/login?error")
						.permitAll())
				.logout((logout) -> logout
						.logoutSuccessUrl("/?loggedOut")
						.permitAll())
				// Stripe WebhookはCSRF除外
				.csrf(csrf -> csrf
						.ignoringRequestMatchers("/stripe/webhook"));

		return http.build();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}