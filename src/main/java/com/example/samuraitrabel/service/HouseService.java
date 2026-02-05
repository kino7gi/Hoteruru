package com.example.samuraitrabel.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.samuraitrabel.entity.House;
import com.example.samuraitrabel.form.HouseEditForm;
import com.example.samuraitrabel.form.HouseRegisterForm;
import com.example.samuraitrabel.repository.HouseRepository;

@Service

public class HouseService {
	private final HouseRepository houseRepository;

	public HouseService(HouseRepository houseRepository) {
		this.houseRepository = houseRepository;
	}

	@Transactional
	public void create(HouseRegisterForm houseRegisterForm) {
		House house = new House();
		MultipartFile imageFile = houseRegisterForm.getImageFile();

		if (!imageFile.isEmpty()) {
			String imageName = imageFile.getOriginalFilename();
			String hashedImageName = generateNewFileName(imageName);
			java.nio.file.Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);

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

	// UUIDを使ってファイル名を生成する(画像に番号をふる機能)

	public String generateNewFileName(String fileName) {
		String[] fileNames = fileName.split("\\.");//ファイル名をドットで分解する
		for (int i = 0; i < fileNames.length - 1; i++) {//UUIDに置き換える。最後のjpgだけ残すという指示
			fileNames[i] = UUID.randomUUID().toString();
		}
		String hashedFileName = String.join(".", fileNames);//ドットで区切る
		return hashedFileName;
	}

	// 画像ファイルを指定したパスにコピーする
	public void copyImageFile(MultipartFile imageFile, Path filePath) {
		try {
			Files.copy(imageFile.getInputStream(), filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void update(HouseEditForm houseEditForm) {

	}
}