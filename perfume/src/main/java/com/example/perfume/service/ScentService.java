package com.example.perfume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.perfume.entity.Scent;
import com.example.perfume.repository.ScentRepository;

@Service
public class ScentService {

	@Autowired
	private ScentRepository scentRepository;

	/**
	 * 全ての香りを取得する
	 */
	public List<Scent> findAll() {
		return scentRepository.findAll();
	}
}