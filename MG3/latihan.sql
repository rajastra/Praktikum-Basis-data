-- @BLOCK
DROP DATABASE Bank_ITERA;
-- @BLOCK
-- Soal 1
CREATE DATABASE Bank_ITERA;

-- @BLOCK
-- Soal 1
USE Bank_ITERA;

-- @BLOCK
-- Soal 2 
CREATE TABLE rekening(
   No_rekening VARCHAR(6) PRIMARY KEY NOT NULL,
   Kode_cabang CHAR(5) NOT NULL,
   Pin VARCHAR(6) NOT NULL,
   Saldo INT(11) NOT NULL
)ENGINE = InnoDB;

-- @BLOCK
-- Soal 2 
INSERT INTO rekening(No_rekening,Kode_cabang,Pin,Saldo)
VALUES
   ("120023","JGJ01","837242",500000),
   ("120087","JGJ02","112233",2150000),
   ("140932","JOJ02","024422",1200000),
   ("220983","SMG12","732312",5422000),
   ("332102","JKT48","228883",400500);

-- @BLOCK
-- Soal 3
CREATE TABLE transaksi(
   No_transaksi INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
   No_rekening VARCHAR(6) NOT NULL,
   Jenis_transaksi VARCHAR(10) NOT NULL,
   Tgl_transaksi DATETIME NOT NULL,
   Jumlah INT(11) NOT NULL,
   FOREIGN KEY(No_rekening) REFERENCES rekening(No_rekening)
)ENGINE = InnoDB;

-- @BLOCK
-- Soal 3
INSERT INTO transaksi(No_rekening,Jenis_transaksi,Tgl_transaksi,Jumlah) 
VALUES
   ('220983','DEBET','2022-06-12 12:00:45',500000),
   ('220983','DEBET','2022-06-13 08:20:33',2150000),
   ('140932','ATM','2022-06-14 10:56:52',100000),
   ('140932','ATM','2022-06-14 15:16:23',100000),
   ('120087','DEBET','2022-06-15 15:03:33',1250000),
   ('220983','ATM','2022-06-15 15:32:15',150000),
   ('220983','ATM','2022-06-13 15:40:12',100000),
   ('220983','DEBET','2022-06-16 08:23:23',2500000);

-- @BLOCK
-- 3,1
UPDATE rekening
SET Pin = '450816' 
WHERE no_rekening =  '220983';

-- @BLOCK
-- 3,2
UPDATE transaksi
SET Tgl_transaksi = '2022-06-17 20:34:22'
WHERE No_transaksi =  6;

-- @BLOCK
-- 3,3 
SELECT * FROM transaksi;
-- @BLOCK
-- 3,4
SELECT * FROM transaksi ORDER BY No_transaksi DESC LIMIT 5;

-- @BLOCK
-- 3,5 
SELECT * FROM transaksi 
WHERE Tgl_transaksi BETWEEN '2022-06-15 00:00:00' AND '2022-06-15 23:59:59';
-- @BLOCK
-- 3,6 
SELECT * FROM transaksi 
WHERE Tgl_transaksi BETWEEN '2022-06-14 00:00:00' AND '2022-06-15 23:59:59';

-- @BLOCK
-- 3,7
SELECT * FROM transaksi 
WHERE Tgl_transaksi BETWEEN '2022-06-15 00:00:00' AND '2022-06-15 23:59:59'
ORDER BY Tgl_transaksi DESC
LIMIT 1;

-- @BLOCK
-- 3,8   
SELECT * FROM rekening
WHERE Kode_cabang LIKE 'JGJ%';

-- @BLOCK
-- 3,9   
DELETE FROM rekening
WHERE No_rekening = '120087';

-- @BLOCK
-- 3,10
SELECT * FROM rekening
WHERE Saldo >= 500000 and Saldo <=3000000;

-- @BLOCK
-- 3,11
SELECT COUNT(*) 'total transaksi'
FROM transaksi
WHERE DATE(Tgl_transaksi) = '2022:06:15';

-- @BLOCK
-- 3,12
SELECT jumlah FROM transaksi
WHERE No_rekening = '220983';

-- @BLOCK
-- 3,13
SELECT AVG(jumlah) 'rata-rata dana' FROM transaksi
WHERE Tgl_transaksi BETWEEN '2022-06-13 00:00:00' AND '2022-06-15 23:59:59';

-- @BLOCK
-- 3,14
SELECT No_rekening, count(No_rekening) 'Banyak transaksi'
FROM transaksi
GROUP BY No_rekening;

-- @BLOCK
-- 3,15
SELECT * FROM transaksi
WHERE MONTH(Tgl_transaksi) = 06 AND YEAR(Tgl_transaksi) = 2022;

-- @BLOCK
-- 3,16
SELECT * FROM transaksi
GROUP BY No_rekening;