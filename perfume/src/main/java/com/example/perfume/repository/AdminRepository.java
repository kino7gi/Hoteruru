package com.example.perfume.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.perfume.entity.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {

	// ログイン時にユーザーIDで検索するために追加
	Optional<Admin> findByUserId(String userId);
}