package com.example.moattravel.security;

//誰にとのページのアクセスを許可するか
//ログインページ等URL
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration //設定用クラス。@Beanが付けられるようになる
@EnableWebSecurity //認証認可のルール、ログインログアウト処理ができるようになる
@EnableMethodSecurity //メソッドレベルでのセキュリティ機能を有効にする
public class WebSecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

		http
				.authorizeHttpRequests((requests) -> requests
						// すべてのユーザーにアクセスを許可するURL
						.requestMatchers("/css/**", "/images/**", "/js/**", "/storage/**", "/", "/signup/**",
								"/houses/**")
						.permitAll()

						// 管理者にのみアクセスを許可するURL
						.requestMatchers("/admin/**").hasRole(
								"ADMIN")

						// 上記以外のURLはログインが必要（会員または管理者）
						.anyRequest().authenticated())
				.formLogin((form) -> form
						.loginPage("/login") // ログインページのURL
						.loginProcessingUrl("/login") // ログインフォームの送信先URL
						.defaultSuccessUrl("/?loggedIn") // ログイン成功時のリダイレクト先URL
						.failureUrl("/login?error") // ログイン失敗時のリダイレクト先URL
						.permitAll())
				.logout((logout) -> logout
						.logoutSuccessUrl("/?loggedOut") // ログアウト時のリダイレクト先URL
						.permitAll());

		return http.build();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
