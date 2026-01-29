package com.example.samuraitrabel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.samuraitrabel.entity.House;

public interface HouseRepository {
	public interface HouseRepository extends JpaRepository<House, Integer> {
		
	}
}