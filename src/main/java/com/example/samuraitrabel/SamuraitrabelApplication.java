package com.example.samuraitrabel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan("com.example.samuraitrabel.entity")              // Entityの場所を明示
@EnableJpaRepositories("com.example.samuraitrabel.repository") // Repositoryの場所を明示
public class SamuraitrabelApplication {

    public static void main(String[] args) {
        SpringApplication.run(SamuraitrabelApplication.class, args);
    }

}