-- @BLOCK
DROP DATABASE Galeri_ITERA;
-- @BLOCK
-- Soal 1
CREATE DATABASE Galeri_ITERA;
-- @BLOCK
-- Soal 1
USE galeri_itera;
-- @BLOCK
-- Soal 1 produk
--buat table Produk Produk_id string,Produk_nama,Jumlah_Stok,Supplier_id ref Supplier
CREATE TABLE produk(
   Produk_id VARCHAR(10) PRIMARY KEY NOT NULL,
   Produk_nama VARCHAR(20) NOT NULL,
   Jumlah_Stok INT(11) NOT NULL,
   Supplier_id VARCHAR(4) NOT NULL,
   FOREIGN KEY(Supplier_id) REFERENCES supplier(Supplier_id)
)ENGINE = InnoDB;
-- @BLOCK
-- Soal 1 produk
--masukan data tabel produk nilainya diatas
INSERT INTO produk(Produk_id,Produk_nama,Jumlah_Stok,Supplies_id)
VALUES
("P552","Aqua 1 L",300,"S001"),
("P882","Indomilk 25 ml",200,"S004"),
("P333","Sari Roti 100 gram",30,"S005"),
("P123","Gulaku 1 Kg",100,"S005"),
("P453","Garam 30 gram",20,"S006"),
("P109","The Kotak 300 ml",40,"S002");
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
VALUES("S004", "Pelita", "Baru Puspa"),
   ("S005", "Surya", "Kun Siti"),
   ("S006", "Ceria", "Kasih Topan");
-- @BLOCK
-- Soal 3 Pegawai
CREATE TABLE Pegawai(
   Id_pegawai VARCHAR(6) PRIMARY KEY NOT NULL,
   Pegawai_nama VARCHAR(15) NOT NULL,
   Jabatan VARCHAR(15) NOT NULL
) ENGINE = InnoDB;
-- @BLOCK
-- Soal 3 Pegawai
INSERT INTO Pegawai(Id_pegawai, Pegawai_nama, Jabatan)
VALUES("pg_002", "Siska", "Cashier"),
   ("pg_003", "Nuri", "Cashier"),
   ("pg_004", "Jamal", "Cashier");
-- @BLOCK
-- @BLOCK
-- Soal 4 Pembeli
CREATE TABLE Pembeli(
   Id_pembeli VARCHAR(5) PRIMARY KEY NOT NULL,
   Pembeli_nama VARCHAR(15) NOT NULL,
   Pembeli_kontak VARCHAR(15) NOT NULL
) ENGINE = InnoDB;
-- @BLOCK
-- Soal 4 Pembeli
INSERT INTO Pembeli(Id_pembeli, Pembeli_nama, Pembeli_kontak)
VALUES ("C_901", "Rudi", "081231511"),
   ("C_991", "Andi", "085212021111"),
   ("C_800", "Egi", "0812521221"),
   ("C_810", "Ardi", "0862145121");

-- @BLOCK
-- Soal 5 Transaksi
-- buat table Transaksi Id_transaksi Id_pembeli Id_pegawai Produk_Id Tgl_transaksi Jumlah_beli
CREATE TABLE transaksi(
   Id_transaksi INT(5) PRIMARY KEY NOT NULL,
   Id_pembeli VARCHAR(5) NOT NULL,
   Id_pegawai VARCHAR(6) NOT NULL,
   Produk_Id VARCHAR(10) NOT NULL,
   Tgl_transaksi DATE NOT NULL,
   Jumlah_beli INT(11) NOT NULL,
   FOREIGN KEY(Id_pembeli) REFERENCES Pembeli(Id_pembeli),
   FOREIGN KEY(Id_pegawai) REFERENCES Pegawai(Id_pegawai),
   FOREIGN KEY(Produk_Id) REFERENCES produk(Produk_id)
)ENGINE = InnoDB;
-- @BLOCK
-- Soal 5 Transaksi
-- masukan data tabel transaksi nilainya diatas
INSERT INTO transaksi(Id_transaksi, Id_pembeli, Id_pegawai, Produk_Id, Tgl_transaksi, Jumlah_beli)
VALUES
(1, "C_901", "Pg_002", "P552", "2022-09-12", 3),
(2, "C_901", "Pg_003", "P109", "2022-09-15", 10),
(3, "C_810", "Pg_001", "P114", "2022-09-15", 2),
(4, "C_991", "Pg_004", "P333", "2022-09-18", 3),
(5, "C_800", "Pg_001", "P552", "2022-09-18", 1),
(6, "C_810", "Pg_002", "P552", "2022-09-20", 10);
-- @BLOCK
-- soal 7
-- Tampilkan data Produk dan suppliers menggunakan Natural Join
SELECT *
FROM produk NATURAL JOIN suppliers;
-- @BLOCK
-- soal 8
-- Tampilkan data Produk dan suppliers yang sesuai (sama) menggunakan Join.
SELECT *
FROM produk JOIN suppliers
ON produk.Supplies_id = suppliers.Suppliers_id;
-- @BLOCK
-- soal 9
-- Join tabel, tampilkan Jabatan pegawai, id pegawai, tanggal transaksi untuk pegawai dengan id "Pg_001".
SELECT Pegawai.Jabatan, Pegawai.Id_pegawai, transaksi.Tgl_transaksi
FROM Pegawai JOIN transaksi ON Pegawai.Id_pegawai = transaksi.Id_pegawai
WHERE Pegawai.Id_pegawai = "Pg_001";
-- @BLOCK
-- soal 10
-- Join tabel, tampilkan Company nama,ProdukId, Supplier id ketika Jumlah stok > 50pcs
SELECT produk.Produk_id, produk.Produk_nama, produk.Jumlah_Stok, suppliers.Suppliers_id, suppliers.Company_nama, suppliers.Nama_kontak
FROM produk JOIN suppliers ON produk.Supplies_id = suppliers.Suppliers_id
WHERE produk.Jumlah_Stok > 50;
-- @BLOCK
-- soal 11
-- Dengan melakukan salah satu dari jenis Join tabel, tampilkan Produk id, id transaksi , jumlah dan tanggal transaksi ketika jumlah yang dibeli > 6pcs
SELECT transaksi.Id_transaksi, transaksi.Produk_id, transaksi.Jumlah_beli, transaksi.Tgl_transaksi
FROM transaksi JOIN produk ON transaksi.Produk_id = produk.Produk_id
WHERE transaksi.Jumlah_beli > 6;
-- @BLOCK
-- soal 12
-- Tampilkan data dari tabel Transaksi dan pegawai yang sesuai(sama).
SELECT *
FROM transaksi JOIN Pegawai ON transaksi.Id_pegawai = Pegawai.Id_pegawai;
-- @BLOCK
-- soal 13
--Tampilkan id_pembeli, Pembeli_nama, tanggal transaksi, Produk_id dan jumlah_beli yang sama (sesuai) dengan melakukan Join pada tabel pembeli dan transaksi.
SELECT transaksi.Id_pembeli, Pembeli.Pembeli_nama, transaksi.Tgl_transaksi, transaksi.Produk_id, transaksi.Jumlah_beli
FROM transaksi JOIN Pembeli ON transaksi.Id_pembeli = Pembeli.Id_pembeli;
-- @BLOCK
-- soal 14
-- Join tabel, tampilkan Produk_id, supplier_id, Produk_nama, Nama kontak ketika Produk_nama "G".
SELECT produk.Produk_id, produk.Supplies_id, produk.Produk_nama, suppliers.Nama_kontak
FROM produk JOIN suppliers ON produk.Supplies_id = suppliers.Suppliers_id
WHERE produk.Produk_nama LIKE "G%";
-- @BLOCK
-- soal 15
-- Join tabel, tampilkan Produk_id,Produk_nama, id_transaksi, jumlah stok, tanggal transaksi untuk Produk_id like "P1" 
SELECT produk.Produk_id, produk.Produk_nama, transaksi.Id_transaksi, transaksi.Jumlah_beli, transaksi.Tgl_transaksi
FROM produk JOIN transaksi ON produk.Produk_id = transaksi.Produk_id
WHERE produk.Produk_id LIKE "P1%";
-- @BLOCK
-- soal 16
-- Tampilkan Produk_id, Produk_nama, tanggal transaksi, id_transaksi ketika Jumlah stok > 60pcs dan < 150pcs inner join
SELECT produk.Produk_id, produk.Produk_nama, transaksi.Tgl_transaksi, transaksi.Id_transaksi
FROM produk INNER JOIN transaksi ON produk.Produk_id = transaksi.Produk_id
WHERE produk.Jumlah_Stok > 60 AND produk.Jumlah_Stok < 150;
-- @BLOCK
-- soal 17
-- Tampilkan id_pegawai, jabatan, id_transaksi untuk transaksi dengan jumlah yang dibeli < 6pcs tanggal transaksi antara "2022-09-15 sampai dengan 2022-09-18".
SELECT Pegawai.Id_pegawai, Pegawai.Jabatan, transaksi.Id_transaksi
FROM Pegawai JOIN transaksi ON Pegawai.Id_pegawai = transaksi.Id_pegawai
WHERE transaksi.Jumlah_beli < 6 AND transaksi.Tgl_transaksi BETWEEN "2022-09-15" AND "2022-09-18";