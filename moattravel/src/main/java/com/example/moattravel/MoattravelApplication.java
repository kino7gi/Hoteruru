package com.example.moattravel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

import jakarta.annotation.PostConstruct;

@SpringBootApplication
public class MoattravelApplication {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public static void main(String[] args) {
		SpringApplication.run(MoattravelApplication.class, args);
	}

	@PostConstruct
	public void checkDb() {
		String dbName = jdbcTemplate.queryForObject(
				"SELECT DATABASE()", String.class);
		System.out.println("現在接続しているDB: " + dbName);
	}
}
