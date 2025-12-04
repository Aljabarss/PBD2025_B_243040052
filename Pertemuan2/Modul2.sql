--Buat database TokoRetailDB
CREATE DATABASE TokoRetailDB;

--Gunakan DB TokoRetailDB
USE TokoRetailDB;

--Membuat tabel kategoriProduk
CREATE TABLE kategoriProduk (
kategoriID INT IDENTITY(1,1) PRIMARY KEY,
Namakategori VARCHAR(100) NOT NULL UNIQUE
);

--Membuat tabel produk
CREATE TABLE produk(
produkID INT IDENTITY(1001,1) PRIMARY KEY,
SKU VARCHAR(20) NOT NULL UNIQUE,
Namaproduk VARCHAR(150) NOT NULL,
Harga DECIMAL(10, 2) not null,
Stok INT NOT NULL,
KategoriID INT NULL,

--harganya gaboleh negatif 
CONSTRAINT  CHK_Hargapositif CHECK (Harga >= 0),
--stoknya gaboleh negatif
CONSTRAINT CHK_stokpositif CHECK (Stok >= 0), 
--relasikan dengan tabel kategoriproduk melalui kategoriID
CONSTRAINT FK_produk_kategori
	FOREIGN KEY (kategoriID)
	REFERENCES kategoriproduk(kategoriID)
);

 --Memasukan Data Ke Tabel KategoriProduk
 INSERT INTO kategoriProduk (Namakategori)
 VALUES 
 ('Elektronik'),
 
 INSERT INTO kategoriProduk (Namakategori)
 VALUES 
 ('Pakain'),
 ('Buku');

 --Menampilkan Tabel Kategori
 SELECT *
 FROM kategoriProduk

  --Hanya Menampilkan NamaKategori
 SELECT Namakategori
 FROM kategoriProduk;

 --Menambahkan Data Ke Tabel Produk
 INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
 VALUES
 ('ELEC-001', 'Laptop Gaming', 15000000.00, 50,2);

 INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
 VALUES
 ('ELEC-002', 'Hp Gaming', 50000000.00, 50,1);

 --Menampuilkan Tabel Produk
 SELECT * 
 FROM Produk;

 --Mengubah data stok laptop gaming menjadi 30
 UPDATE Produk
 SET Stok = 30
 WHERE produkID = 1001;

 --Menghapus data HP Gaming
 BEGIN TRANSACTION;

 DELETE FROM Produk 
 WHERE produkID = 1002;

 --Cek apakah sudah terhapus atau belum
 SELECT *
 FROM Produk;

 COMMIT TRANSACTION;

  --Menambahkan Data Ke Tabel Produk
 INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
 VALUES
('BAJU-001', 'Kaos Putih', 50000.00,30, 2);

 INSERT INTO Produk (SKU, Namaproduk, Harga, Stok, KategoriID)
 VALUES
('BAJU-002', 'Kaos Putih', 50000.00,30, 2);

SELECT * FROM Produk;

--Menghapus & Mengembalikan 
BEGIN TRAN;

DELETE FROM Produk 
WHERE produkID = 1004

ROLLBACK TRANSACTION;






