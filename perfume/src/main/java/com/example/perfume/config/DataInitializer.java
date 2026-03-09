package com.example.perfume.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.perfume.entity.Admin;
import com.example.perfume.repository.AdminRepository;

@Configuration
public class DataInitializer {
	@Bean
	CommandLineRunner initAdmins(AdminRepository adminRepository) {
		return args -> {
			if (adminRepository.count() == 0) {
				Admin admin = new Admin();
				admin.setUserId("admin");
				admin.setPassword("password123"); // 本来は暗号化すべき
				adminRepository.save(admin);
				System.out.println("管理者アカウントを作成しました。");
			}
		};
	}
}