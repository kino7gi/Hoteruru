package com.example.perfume.repository;
//保存、管理、検索が自動敵にできるようになる

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.perfume.entity.Scent;

@Repository
public interface ScentRepository extends JpaRepository<Scent, Long> {
}