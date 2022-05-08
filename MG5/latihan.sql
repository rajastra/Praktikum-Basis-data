-- @BLOCK
USE Bank_ITERA;

-- @BLOCK
-- Soal 1
-- masukan data ke tabel nasabah sesuai data diatas
INSERT INTO nasabah VALUES
(7,248671,'Intra Indra','Kerbang Tinggi I','08136690922'),
(8,356538,'Talia Talio','Jalan Jatisari','08994735421'),
(9,144161,'Putri Natalia','Sumber Sari','08214997801');

-- @BLOCK
-- Soal 2
-- masukan data ke tabel rekening sesuai data diatas
INSERT INTO rekening VALUES
(248671,"GSG52",'007010',5000000),
(356538,"KMK07",'998070',600000),
(144161,"MDN74",'230499',1000000);

-- @BLOCK
-- Soal 3
-- 3. Dengan menggunakan Full Join untuk tabel rekening dan transaksi tampilkan nomor rekening , saldo dan tanggal transaksi, id transaksi.
SELECT rekening.no_rekening, rekening.saldo, transaksi.Tgl_transaksi, transaksi.No_transaksi
FROM rekening
LEFT OUTER JOIN transaksi ON rekening.no_rekening = transaksi.No_rekening
UNION
SELECT rekening.no_rekening, rekening.saldo, transaksi.Tgl_transaksi, transaksi.No_transaksi
FROM rekening
RIGHT OUTER JOIN transaksi ON rekening.no_rekening = transaksi.No_rekening;

-- @BLOCK
-- Soal 4
-- Dengan menggunakan Inner join, tampilkan data dari rekening dan transaksi yang sesuai(sama).
SELECT rekening.no_rekening, rekening.saldo, transaksi.Tgl_transaksi, transaksi.No_transaksi
FROM rekening
INNER JOIN transaksi ON rekening.no_rekening = transaksi.No_rekening;
-- @BLOCK
-- Soal 5
-- Dengan menggunakan salah satu dari Jenis Join, tampilkan data nasabah dan rekening ketika saldo rekening>200.000.
SELECT *
FROM nasabah
LEFT OUTER JOIN rekening ON nasabah.no_rekening = rekening.no_rekening
WHERE rekening.saldo > 200000;
-- @BLOCK
-- Soal 6
-- Dengan menggunakan salah satu dari Jenis Join diatas, tampilkan nomor rekening, saldo, jumlah transaksi, tanggal transaksi ketika nomor rekening sama dengan 114115.
SELECT rekening.no_rekening, rekening.saldo, transaksi.No_transaksi, transaksi.Tgl_transaksi
FROM rekening
LEFT OUTER JOIN transaksi ON rekening.no_rekening = transaksi.No_rekening
WHERE rekening.no_rekening = 114115;

-- @BLOCK
-- Soal 7
-- Dengan menggunakan Left Join untuk tabel rekening dan transaksi tampilkan nomor rekening , saldo dan tanggal transaksi, id transaksi.
SELECT rekening.no_rekening, rekening.saldo, transaksi.Tgl_transaksi, transaksi.No_transaksi
FROM rekening
LEFT OUTER JOIN transaksi ON rekening.no_rekening = transaksi.No_rekening;
	

-- @BLOCK
-- Soal 8
-- Dengan menggunakan Right Join untuk tabel nasabah dan rekening tampilkan nomor rekening, nama nasabah , kode cabang dan saldo nasabah.
SELECT nasabah.no_rekening, nasabah.nama_nasabah, rekening.kode_cabang, rekening.saldo
FROM nasabah
RIGHT OUTER JOIN rekening ON nasabah.no_rekening = rekening.no_rekening;

-- @BLOCK
-- Soal 9
-- Dengan menggunakan salah satu dari Jenis Join, tampilkan data rekening dan transaksi ketika nomor rekening diawali “2” dan jenis transaksi menggunakan ATM.
SELECT *
FROM rekening
INNER  JOIN transaksi ON rekening.no_rekening = transaksi.No_rekening
WHERE rekening.no_rekening LIKE '2%' AND transaksi.Jenis_transaksi = 'ATM';

-- @BLOCK
-- Soal 10
-- Dengan menggunakan salah satu dari Jenis Join, tampilkan nama nasabah, alamat, nomor telepon, nomor rekening dan kode cabang ketika nomor rekening kode cabang “KKM” dan nomor telepon“0813”.
SELECT nasabah.nama_nasabah, nasabah.alamat, nasabah.no_telepon, rekening.no_rekening, rekening.kode_cabang
FROM nasabah
INNER JOIN rekening ON nasabah.no_rekening = rekening.no_rekening
WHERE rekening.kode_cabang LIKE 'KKM%' AND nasabah.no_telepon LIKE '813%';			