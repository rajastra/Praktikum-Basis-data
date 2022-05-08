-- @BLOCK
-- a
-- tampilkan nama produk dan jumlah stock yang di supply oleh perusahaan Suka Maju
SELECT Produk_nama, jumlah_stok FROM produk WHERE Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Company_nama = "Suka Maju");


-- @BLOCK
-- b
-- tampilkan seluruh data produk yang nama kontak supplier nya Rahmat
SELECT * FROM produk WHERE Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Nama_kontak = "Rahmat");

-- @BLOCK
-- c
-- tampilkan Transaksi yang dilakukan diatas tanggal 15 september dilayani oleh Siska dan di supply oleh Surya Kun
SELECT * FROM transaksi WHERE Tgl_transaksi > "15-09-2020" AND Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Siska") and Produk_id = ANY(SELECT Produk_id FROM produk WHERE Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Company_nama = "Surya"));


-- @BLOCK
-- d
-- tampilkan seluruh nama Perusahaan yang jumlah pembeliannya dalam tabel transaksi dibawah 3pcs
SELECT Company_nama FROM suppliers WHERE Suppliers_id = ANY(SELECT Suppliers_id FROM transaksi WHERE Jumlah_beli < 3);

-- @BLOCK
-- e
-- Tampilkan semua data pembeli yang di layani oleh santi
SELECT * FROM pembeli WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM transaksi WHERE Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Santi"));

-- @BLOCK
-- f
-- tampilkan kontak pembeli yang membeli 3pcs barang dan dilayani oleh Siska
SELECT Pembeli_kontak FROM pembeli WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM transaksi WHERE Jumlah_beli = 3 AND Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Siska"));


-- @BLOCK
-- g
-- tampilkan kontak pembeli yang membeli 3pcs barang, tidak dilayani oleh Siska, dan barangnya di supply oleh Surya
SELECT Pembeli_kontak FROM pembeli WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM transaksi WHERE Jumlah_beli = 3 AND Id_pegawai != ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Siska") AND Produk_id = ANY(SELECT Produk_id FROM produk WHERE Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Company_nama = "Surya")));


-- @BLOCK
-- h
-- tampilkan kontak pembeli yang membeli diatas 3 pcs barang dan transaksi dilakukan tanggal 15 September
SELECT Pembeli_kontak FROM pembeli WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM transaksi WHERE Jumlah_beli > 3 AND Tgl_transaksi = "2022-09-15");

-- @BLOCK
-- i
-- tampilkan pada tanggal berapa saja barang dari perusahaan Ceria Kasih laku terjual
SELECT Tgl_transaksi FROM transaksi WHERE Produk_id = ANY(SELECT Produk_id FROM produk WHERE Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Company_nama = "Ceria"));

-- @BLOCK
-- j
-- tampilkan nama pelanggan yang pernah dilayani oleh Siska dan Nuri
SELECT Pembeli_nama FROM pembeli WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM transaksi WHERE Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Siska") OR Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Nuri"));


-- @BLOCK
-- k
-- tampilkan nama pelanggan yang membeli barang dengan jumlah stock diatas 100 dan di supply oleh Ali
SELECT Pembeli_nama FROM pembeli WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM transaksi WHERE Produk_id = ANY(SELECT Produk_id FROM produk WHERE Jumlah_stok > 100 AND Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Company_nama = "Ali")));


-- @BLOCK
-- l
-- tampilkan data seluruh transaksi yang dilakukan oleh Andi dan dilayani oleh Jamal
SELECT * FROM transaksi WHERE Id_pembeli = ANY(SELECT Id_pembeli FROM pembeli WHERE Pembeli_nama = "Andi") AND Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Jamal");


-- @BLOCK
-- m
-- tampilkan Nama produk dan jumlah stock yang di supply oleh Company Maju Terus
SELECT Produk_nama, jumlah_stok FROM produk WHERE Supplies_id = ANY(SELECT Suppliers_id FROM suppliers WHERE Company_nama = "Maju Terus");

-- @BLOCK
-- n
-- tampilkan Nama Perusahaan dan kontaknya yang transaksi barang-barangnya dilayani oleh Yaya
SELECT Company_nama, Nama_kontak FROM suppliers WHERE Suppliers_id = ANY(SELECT Suppliers_id FROM transaksi WHERE Id_pegawai = ANY(SELECT Id_pegawai FROM Pegawai WHERE Pegawai_nama = "Yaya"));


-- @BLOCK
-- o
-- tampilkan nama pegawai yang berhasil menjual lebih dari 5 pcs barang dalam satu transaksi
SELECT Pegawai_nama FROM pegawai WHERE Id_pegawai = ANY(SELECT Id_pegawai FROM transaksi WHERE Jumlah_beli > 5);