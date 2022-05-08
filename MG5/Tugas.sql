-- @BLOCK
-- soal 1
-- Dengan melakukan salah satu dari jenis Join tabel, tampilkan Jabatan pegawai, id pegawai, tanggal transaksi untuk pegawai dengan id “Pg_001”.
SELECT pegawai.jabatan, pegawai.id_pegawai, transaksi.tgl_transaksi
FROM pegawai
INNER JOIN transaksi ON pegawai.id_pegawai = transaksi.id_pegawai
WHERE pegawai.id_pegawai = 'Pg_001';

-- @BLOCK
-- soal 2
-- Lakukan Left Outer join pada tabel Pegawai dan Transaksi.
SELECT *
FROM pegawai
LEFT OUTER JOIN transaksi ON pegawai.id_pegawai = transaksi.id_pegawai;

-- @BLOCK
-- soal 3
-- Dengan melakukan salah satu dari jenis Join tabel gabung tabel produk dan suppliers, tampilkan Produk_id, supplier_id, Produk_nama, Nama kontak supplier ketika Produk_nama “S”.
SELECT produk.Produk_id, produk.supplies_id, produk.Produk_nama, suppliers.Nama_kontak
FROM produk
LEFT OUTER JOIN suppliers ON produk.supplies_id = suppliers.suppliers_id
WHERE produk.Produk_nama LIKE 'S%';

-- @BLOCK
-- soal 4
-- Dengan melakukan salah satu dari jenis Join tabel, tampilkan Produk_id, Produk_nama, id_transaksi, jumlah stok, tanggal transaksi untuk Produk_id “P3”.
SELECT produk.Produk_id, produk.Produk_nama, transaksi.id_transaksi, produk.jumlah_stok, transaksi.tgl_transaksi
FROM produk
INNER JOIN transaksi ON produk.Produk_id = transaksi.Produk_id
WHERE produk.Produk_id LIKE 'P3%';


-- @BLOCK
-- soal 5
-- Lakukan LEFT Join pada tabel Pembeli dan Transaksi.
SELECT *
FROM pembeli
LEFT OUTER JOIN transaksi ON pembeli.id_pembeli = transaksi.id_pembeli
UNION
SELECT *
FROM pembeli
RIGHT OUTER JOIN transaksi ON pembeli.id_pembeli = transaksi.id_pembeli;


-- @BLOCK
-- soal 6
-- Lakukan Left Outer join pada tabel Produk dan Transaksi.
SELECT *
FROM produk
LEFT OUTER JOIN transaksi ON produk.Produk_id = transaksi.Produk_id;

-- @BLOCK
-- soal 7
-- Lakukan Right Outer Join pada tabel Produk dan Transaksi.
SELECT *
FROM produk
RIGHT OUTER JOIN transaksi ON produk.Produk_id = transaksi.Produk_id;

-- @BLOCK
-- soal 8
-- Tampilkan hasil gabungan tabel Pembeli dan Transaksi yang sesuai(sama).
SELECT *
FROM pembeli
INNER JOIN transaksi ON pembeli.id_pembeli = transaksi.id_pembeli;

-- @BLOCK
-- soal 9
-- Tampilkan hasil Left Outer Join pada tabel Pembeli dan Transaksi yang hanya mempunyai relasi antara table Pembeli dan Transaksi.
SELECT *
FROM pembeli
LEFT OUTER JOIN transaksi ON pembeli.id_pembeli = transaksi.id_pembeli;




-- @BLOCK
-- soal 10
-- Tampilkan hasil Right Outer Join pada tabel Pembeli dan Transaksi yang hanya mempunyai relasi antara table Pembeli dan Transaksi.
SELECT *
FROM pembeli
RIGHT OUTER JOIN transaksi ON pembeli.id_pembeli = transaksi.id_pembeli;

-- @BLOCK
-- soal 11
-- Tampilkan data transaksi dan Produk yang sesuai(sama) menggunakan Join.
SELECT *
FROM transaksi
INNER JOIN produk ON transaksi.Produk_id = produk.Produk_id;