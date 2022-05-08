-- @BLOCK
-- soal 1
-- tambahakan data ke tabel produk data diatas
INSERT INTO PRODUK VALUES
      ('P150','Kretendeng',80,'S002'),
      ('P792','Miesadap',30,'S005'),
      ('P204','Somos',50,'S005'),
      ('P561','Marijan',40,'S004');

-- @BLOCK
-- soal 2
-- tambahkan kolom alamat(varchar 50),jenis_kelamin(varchar 15) di tabel pegawai
ALTER TABLE pegawai ADD COLUMN alamat VARCHAR(50);
-- @BLOCK
ALTER TABLE pegawai ADD COLUMN jenis_kelamin VARCHAR(15);
-- @BLOCK
-- masukan data ke tabel pegawai dengan data diatas
INSERT INTO pegawai VALUES
      ('pg_007','Dani','Staff','Laki-laki','Jl. Suka Maju'),
      ('pg_008','Doni','Staff','Laki-laki','Jl. Suka Mundur'),
      ('pg_009','Dian','Staff','Perempuan','Jl. Ryacudu');

-- @BLOCK
-- soal 3
-- tambahkan kolom kota(varchar 25) di tabel pembeli
ALTER TABLE pembeli ADD COLUMN kota VARCHAR(25);
-- @BLOCK
-- update data di tabel pembeli untuk kolom kota
UPDATE pembeli SET kota = 'Jakarta' WHERE pembeli_nama = 'Egi';
UPDATE pembeli SET kota = 'Bandung' WHERE pembeli_nama = 'Ardi';
UPDATE pembeli SET kota = 'Yogyakarta' WHERE pembeli_nama = 'Rudi';
UPDATE pembeli SET kota = 'Bandar lampung' WHERE pembeli_nama = 'Andi';

-- @BLOCK
-- soal 4
-- tambahkan kolom kota pada tabel suppliers
ALTER TABLE SUPPLIERS ADD COLUMN kota VARCHAR(25);
-- @BLOCK
-- update data kota pada tabel suppliers
UPDATE suppliers SET kota = 'Jakarta' WHERE Suppliers_id = 'S001';
UPDATE suppliers SET kota = 'Bandung' WHERE Suppliers_id = 'S002';
UPDATE suppliers SET kota = 'Surabaya' WHERE Suppliers_id = 'S003';
UPDATE suppliers SET kota = 'Yogyakarta' WHERE Suppliers_id = 'S004';
UPDATE suppliers SET kota = 'Bandar lampung' WHERE Suppliers_id = 'S005';
UPDATE suppliers SET kota = 'Bandar lampung' WHERE Suppliers_id = 'S006';
-- @BLOCK
-- urutkan data di tabel suppliers berdasarkan kota
SELECT * FROM suppliers ORDER BY kota;

-- @BLOCK
-- soal 5
-- Tampilkan nilai maksimal pada kolom jumlah stoke di tabel produk
SELECT max(jumlah_stok) FROM produk;

-- @BLOCK
-- soal 6
-- Tampilkan nilai rataan dari table produk pada kolom jumlah stok
SELECT avg(jumlah_stok) FROM produk;