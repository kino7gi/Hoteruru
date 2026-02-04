package com.example.samuraitrabel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.samuraitrabel.entity.User;


public interface UserRepository extends JpaRepository<User,Integer>{

}
