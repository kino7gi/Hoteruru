package com.example.perfume.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.perfume.entity.Bottle;

@Repository
public interface BottleRepository extends JpaRepository<Bottle, Long> {
}