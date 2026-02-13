package com.example.moattravel.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;//ほぼ重複しないIDのこと。例）学籍番号

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.moattravel.entity.House;
import com.example.moattravel.form.HouseRegisterForm;
import com.example.moattravel.repository.HouseRepository;

@Service
public class HouseService {

	private final HouseRepository houseRepository;

	public HouseService(HouseRepository houseRepository) {
		this.houseRepository = houseRepository;
	}

	//データの登録処理メソッド
	@Transactional//データベースの操作をひとまとまりにするもの
	public void create(HouseRegisterForm houseRegisterForm) {

		House house = new House();
		MultipartFile imageFile = houseRegisterForm.getImageFile();

		if (!imageFile.isEmpty()) {
			String imageName = imageFile.getOriginalFilename();
			//ファイル名の変更処理メソッド
			String hashedImageName = generateNewFileName(imageName);//UUIDでファイルを別名に変更する動きをする
			Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);

			//別名に変更した後のファイル名をつかってコピーを作成するメソッド
			copyImageFile(imageFile, filePath);
			house.setImageName(hashedImageName);
		}

		house.setName(houseRegisterForm.getName());
		house.setDescription(houseRegisterForm.getDescription());
		house.setPrice(houseRegisterForm.getPrice());
		house.setCapacity(houseRegisterForm.getCapacity());
		house.setPostalCode(houseRegisterForm.getPostalCode());
		house.setAddress(houseRegisterForm.getAddress());
		house.setPhoneNumber(houseRegisterForm.getPhoneNumber());

		houseRepository.save(house);
	}

	// UUIDを使って生成したファイル名を返す
	public String generateNewFileName(String fileName) {
		String[] fileNames = fileName.split("\\.");

		for (int i = 0; i < fileNames.length - 1; i++) {
			fileNames[i] = UUID.randomUUID().toString();
		}

		return String.join(".", fileNames);
	}

	// 画像ファイルを指定したファイルにコピーする
	public void copyImageFile(MultipartFile imageFile, Path filePath) {
		try {
			Files.copy(imageFile.getInputStream(), filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
