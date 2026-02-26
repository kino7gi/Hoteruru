package com.example.demo.repository;

//CRUDを行う操作
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.House;

public interface HouseRepository extends JpaRepository<House, Integer> {

	public Page<House> findByNameLike(String keyword, Pageable pageable);

}