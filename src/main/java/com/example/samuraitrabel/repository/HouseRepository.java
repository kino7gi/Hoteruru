package com.example.samuraitrabel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.samuraitrabel.entity.House;

public interface HouseRepository extends JpaRepository<House, Integer> {
	public Page<House>findByNameLike(String keyword,org.springframework.data.domain.Pageable pageable);
	
}