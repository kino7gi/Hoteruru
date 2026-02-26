CREATE TABLE IF NOT EXISTS houses --housesテーブルが存在してもエラーにならない。なければ作る

(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR (50) NOT NULL,
   image_name VARCHAR (255),
   description VARCHAR (255) NOT NULL,
   price INT NOT NULL,
   capacity INT NOT NULL,
   postal_code VARCHAR (50) NOT NULL,
   address VARCHAR (255) NOT NULL,
   phone_number VARCHAR (50) NOT NULL,
   --新しいレコードをINSERTすると自動で今の時刻が入る
   created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   --更新しても勝手に数字が入ってくれる
   updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS roles
(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR (50) NOT NULL
);