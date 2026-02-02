package com.example.samuraitrabel.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path; // 修正点1: 適切なPathをインポート
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 修正点2: SpringのTransactionalを推奨
import org.springframework.web.multipart.MultipartFile;

import com.example.samuraitrabel.entity.House;
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

        if (imageFile != null && !imageFile.isEmpty()) {
            String imageName = imageFile.getOriginalFilename();
            String hashedImageName = generateNewFileName(imageName);
            java.nio.file.Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);
            
            copyImageFile(imageFile, filePath);
            house.setImageName(hashedImageName);
        }

        // 修正点4: カッコの外に出して、画像がなくても保存されるように調整
        house.setName(houseRegisterForm.getName());
        house.setDescription(houseRegisterForm.getDescription());
        house.setPrice(houseRegisterForm.getPrice());
        house.setCapacity(houseRegisterForm.getCapacity());
        house.setPostalCode(houseRegisterForm.getPostalCode());
        house.setAddress(houseRegisterForm.getAddress());
        house.setPhoneNumber(houseRegisterForm.getPhoneNumber());
        
        houseRepository.save(house);
    }

    // UUIDを使ってファイル名を生成する
    public String generateNewFileName(String fileName) {
        String[] fileNames = fileName.split("\\.");
        String extension = fileNames[fileNames.length - 1];
        return UUID.randomUUID().toString() + "." + extension;
    }

    // 画像ファイルを指定したパスにコピーする
    public void copyImageFile(MultipartFile imageFile, Path filePath) {
        try {
            // フォルダが存在しない場合に作成する処理を追加しておくと安全です
            if (!java.nio.file.Files.exists(filePath.getParent())) {
                java.nio.file.Files.createDirectories(filePath.getParent());
            }
            Files.copy(imageFile.getInputStream(), filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}