-- @BLOCK
DROP DATABASE Galeri_ITERA;
-- @BLOCK
-- Soal 1
CREATE DATABASE Galeri_ITERA;
-- @BLOCK
-- Soal 1
DROP TABLE Produk;
-- @BLOCK
-- Soal 1
USE Galeri_ITERA;
-- @BLOCK
-- Soal 2 produk
CREATE TABLE Produk(
   Produk_id VARCHAR(4) PRIMARY KEY NOT NULL,
   Produk_nama VARCHAR(15) NOT NULL,
   Jumlah_stok INT(11) NOT NULL,
   Supplies_id VARCHAR(4) NOT NULL
) ENGINE = InnoDB;
-- @BLOCK
-- Alter table
ALTER TABLE Produk ADD CONSTRAINT  FOREIGN KEY (Supplies_id) REFERENCES Suppliers(Suppliers_id);
-- @BLOCK
-- Soal 2 produk
INSERT INTO Produk(Produk_id, Produk_nama, Jumlah_stok, Supplies_id)
VALUES ("P114", "Milo 100 ml", 100, "S001"),
   ("P235", "Aqua 250 ml", 300, "S001"),
   ("P311", "Grand 320 ml", 400, "S003"),
   ("P115", "Milo 150 ml", 50, "S003"),
   ("P441", "Rojo Lele 5 kg", 60, "S002");
-- @BLOCK
-- Soal 2 Suppliers
CREATE TABLE Suppliers(
   Suppliers_id VARCHAR(4) PRIMARY KEY NOT NULL,
   Company_nama VARCHAR(15) NOT NULL,
   Nama_kontak VARCHAR(15) NOT NULL
) ENGINE = InnoDB;
-- @BLOCK
-- Soal 2 Suppliers
INSERT INTO Suppliers(Suppliers_id, Company_nama, Nama_kontak)
VALUES ("S001", "Semua Terang", "Sugiono"),
   ("S002", "Suka Maju", "Rahmat"),
   ("S003", "Maju Terus", "Dayono");
-- @BLOCK
-- Soal 2 Pegawai
CREATE TABLE Pegawai(
   Id_pegawai VARCHAR(6) PRIMARY KEY NOT NULL,
   Pegawai_nama VARCHAR(15) NOT NULL,
   Jabatan VARCHAR(15) NOT NULL
) ENGINE = InnoDB;
-- @BLOCK
-- Soal 2 Pegawai
INSERT INTO Pegawai(Id_pegawai, Pegawai_nama, Jabatan)
VALUES ("pg_001", "Santi", "Cashier"),
   ("pg_011", "Sinta", "Manager"),
   ("pg_201", "Santo", "Satpam");
-- @BLOCK
-- Soal 2 Pembeli
CREATE TABLE Pembeli(
   Id_pembeli VARCHAR(5) PRIMARY KEY NOT NULL,
   Pembeli_nama VARCHAR(15) NOT NULL,
   Pembeli_kontak VARCHAR(15) NOT NULL
) ENGINE = InnoDB;
-- @BLOCK
-- Soal 2 Pembeli
INSERT INTO Pembeli(Id_pembeli, Pembeli_nama, Pembeli_kontak)
VALUES ("C_901", "Rudi", "081231511"),
   ("C_991", "Andi", "085212021111"),
   ("C_800", "Egi", "0812521221"),
   ("C_810", "Ardi", "0862145121");

-- @BLOCK
-- Soal 2 DML
UPDATE Pembeli
SET Id_pembeli = 'C_890' 
WHERE Pembeli_nama =  'Egi';

-- @BLOCK
-- Soal 2 DML
SELECT * FROM Pembeli;

-- @BLOCK
-- Soal 3 DML
SELECT Produk_nama FROM produk 
WHERE jumlah_stok < 700;

-- @BLOCK
-- Soal 4 DML
DELETE FROM Pembeli
WHERE Id_pembeli = 'C_810';

-- @BLOCK
-- Soal 5 DML
SELECT * FROM Pembeli;
-- @BLOCK
-- Soal 6 DML
SELECT * FROM Suppliers
INNER JOIN Produk
ON Produk.Supplies_id = Suppliers.Suppliers_id
WHERE Suppliers.Company_nama = 'suka maju';
-- @BLOCK
-- Soal 7 DML
UPDATE Produk
SET Jumlah_stok = 800 
WHERE Produk_nama =  'Milo 100 ml';

-- @BLOCK
-- Soal 8 DML
UPDATE suppliers
SET Company_nama = 'Ali' 
WHERE Company_nama =  'semua terang';
-- @BLOCK
-- Soal 9 DML
SELECT * FROM pembeli
WHERE Id_pembeli LIKE 'C_9%';

-- @BLOCK
-- Soal 10 DML
SELECT * FROM produk;

-- @BLOCK
-- Soal 11 DML
SELECT * FROM produk
WHERE Supplies_id = 'S001' or Supplies_id = 'S003';
-- @BLOCK
-- Soal 12 DML
UPDATE Pegawai
SET Jabatan = 'Cashier' 
WHERE Pegawai_nama =  'Santo';

-- @BLOCK
-- Soal 13 DML
UPDATE Pembeli
SET Pembeli_nama = 'prassetya',
Pembeli_kontak = '08521116464' 
WHERE Id_pembeli =  'C_890';

-- @BLOCK
-- Soal 14 DML

-- @BLOCK
-- Soal 15 DML
UPDATE Pegawai
SET Pegawai_nama = 'yaya' 
WHERE Id_pegawai =  'pg_300';
