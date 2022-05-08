-- @BLOCK
DROP DATABASE Bank_ITERA;
-- @BLOCK
-- Soal 1
CREATE DATABASE Bank_ITERA;
-- @BLOCK
-- Soal 1
USE Bank_ITERA;
-- @BLOCK
-- Soal 1
CREATE TABLE nasabah(
   Id_Nasabah INT(10) PRIMARY KEY NOT NULL,
   no_rekening INT(11) NOT NULL,
   Nama_Nasabah VARCHAR(20) NOT NULL,
   alamat VARCHAR(50) NOT NULL,
   No_Telepon VARCHAR(15) NOT NULL,
   FOREIGN KEY(No_rekening) REFERENCES rekening(No_rekening)
)ENGINE = InnoDB;
-- @BLOCK
-- Soal 1 
INSERT INTO nasabah(Id_Nasabah,no_rekening,Nama_Nasabah,alamat,No_Telepon)
VALUES
(1,145678,"Puspa Sari","Sei Batang Kuis",081376809122),
(2,256132,"Sinta Jojo","Iskandar Muda",089987654311),
(3,247182,"Bunga Putri","Jalan Martapura",081249987011),
(4,350067,"Grace Sebayang","Gang Keluarga",085276812453),
(5,114115,"Christine Talia","Sei Kambah",082266778866),
(6,100111,"Rimayka Natalia","Perumahan Puri K",081234567890);

-- @BLOCK
-- Soal 2
CREATE TABLE rekening(
   no_rekening INT(11) PRIMARY KEY NOT NULL,
   Kode_cabang VARCHAR(6) NOT NULL,
   Pin VARCHAR(10) NOT NULL,
   Saldo INT(11) NOT NULL
)ENGINE = InnoDB;
-- @BLOCK
-- Soal 2
INSERT INTO rekening(no_rekening,Kode_cabang,Pin,Saldo) 
VALUES
(145678,"SGS02",	"908723",	1000000),
(256132,	"KKM70",	"340987",	230000),
(247182,	"JKT48",	"091298",   4000000),
(350067,	"RGS02",	"230987",	5500000),
(114115,	"SGS01",	"203010",	500000),
(100111,	"KKM69",	"213671",	998500);
-- @BLOCK
--soal 3 
--buat table transaksi No_transaksi,No_rekening,Jenis_transaksi,Tgl_transaksi,Jumlah
CREATE TABLE transaksi(
   No_transaksi INT(11) PRIMARY KEY NOT NULL,
   No_rekening INT(11) NOT NULL,
   Jenis_transaksi VARCHAR(20) NOT NULL,
   Tgl_transaksi DATETIME NOT NULL,
   Jumlah INT(11) NOT NULL,
   FOREIGN KEY(No_rekening) REFERENCES rekening(No_rekening)
)ENGINE = InnoDB;
-- @BLOCK
--soal 3
INSERT INTO transaksi(No_transaksi,No_rekening,Jenis_transaksi,Tgl_transaksi,Jumlah)
VALUES
(12,114115,"ATM","2022-06-09 11:10:12",200000),
(13,114115,"DEBET","2022-06-09 13:00:30",50000),
(14,256132,"DEBET","2022-06-15 11:20:00",150000),
(15,145678,"ATM","2022-06-18 23:11:22",250000),
(16,145678,"DEBET","2022-06-18 15:30:08",300000),
(17,350067,"ATM","2022-06-18 10:02:45",100000);

-- @BLOCK
--soal 4 
--tampilkan data nasabah dan rekening menggunakan cross join
SELECT nasabah.Id_Nasabah,nasabah.Nama_Nasabah,nasabah.alamat,nasabah.No_Telepon,rekening.no_rekening,rekening.Kode_cabang,rekening.Pin,rekening.Saldo
FROM nasabah
CROSS JOIN rekening;
-- @BLOCK
-- soal 5
-- tampilkan data rekening dan transaksi menggunakan inner join
SELECT *
FROM rekening
INNER JOIN transaksi
ON rekening.no_rekening = transaksi.No_rekening;
-- @BLOCK
-- soal 6
-- natural join nasabah dan rekening
SELECT *
FROM nasabah
NATURAL JOIN rekening;
-- @BLOCK
--soal 7
--natural join rekening dan transaksi jumlah transaksi lebih dari 100000
SELECT *
FROM rekening
NATURAL JOIN transaksi
WHERE transaksi.Jumlah > 100000;
-- @BLOCK
--soal 8
--natural join nasabah dan rekening saldo rekening lebih dari 1500000
SELECT *
FROM nasabah
NATURAL JOIN rekening
WHERE rekening.Saldo>1500000;
-- @BLOCK
--soal 9
--inner join rekening dan nasabah kode cabang like "KKM%" saldo < 1000000
SELECT *
FROM nasabah
INNER JOIN rekening
ON nasabah.no_rekening=rekening.no_rekening
WHERE rekening.Kode_cabang LIKE "KKM%" AND rekening.Saldo<1000000;
-- @BLOCK
-- soal 10
SELECT nasabah.Nama_Nasabah,nasabah.alamat,nasabah.No_Telepon ,rekening.no_rekening,rekening.Pin,rekening.Saldo
FROM nasabah
INNER JOIN rekening
ON nasabah.no_rekening=rekening.no_rekening
WHERE nasabah.alamat LIKE "Se%";
-- @BLOCK
-- soal 11
-- natural join tampilkan nomor rekening,saldo, jumlah transaksi, tanggal transaksi ketika nomor rekening sama dengan 145678.
SELECT rekening.no_rekening,rekening.Saldo,transaksi.Jumlah,transaksi.Tgl_transaksi
FROM rekening
NATURAL JOIN transaksi
WHERE rekening.no_rekening=145678;
-- @BLOCK
-- soal 12
-- inner join tampilkan data rekening dan transaksi ketika cast nomor_rekening(char) like "1" dan jenis transaksi menggunakan "DEBET"
SELECT *
FROM rekening
INNER JOIN transaksi
ON rekening.no_rekening = transaksi.No_rekening
WHERE CAST(rekening.no_rekening AS CHAR) LIKE "1%" AND transaksi.Jenis_transaksi = "DEBET";
-- @BLOCK
-- soal 13
-- inner join tampilkan nama nasabah, alamat, nomor telepon, nomor rekening dan kode cabang ketika nomor rekening, kode cabang like "SG%" dan nomor telepon like "0812%"
SELECT nasabah.Nama_Nasabah,nasabah.alamat,nasabah.No_Telepon,rekening.no_rekening,rekening.Kode_cabang
FROM nasabah
INNER JOIN rekening
ON nasabah.no_rekening=rekening.no_rekening
WHERE rekening.Kode_cabang LIKE "SGS%" AND nasabah.No_Telepon LIKE "812%";