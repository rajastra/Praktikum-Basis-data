-- @BLOCK
-- a
-- tampilkan no rekening yang memiliki saldo lebih dari saldo yang dimilki no rekening 356538
SELECT no_rekening FROM rekening WHERE Saldo > (SELECT saldo FROM rekening WHERE no_rekening = 356538);

-- @BLOCK
-- b
-- tampilkan nama nasabah yang pernah melakukan transaksi di tahun 2022
SELECT nama_nasabah FROM nasabah WHERE no_rekening IN (SELECT no_rekening FROM transaksi WHERE YEAR(Tgl_transaksi) = "2022");

-- @BLOCK
-- c
-- tampilkan jenis transaksi, tanggal transaksi serta jumlah yang dilakukan oleh nasabah Puspa Sari.
SELECT jenis_transaksi, Tgl_transaksi, jumlah FROM transaksi WHERE no_rekening = ANY(SELECT no_rekening FROM nasabah WHERE nama_nasabah = "Puspa Sari");

-- @BLOCK
-- d
-- tampilkan data nasabah yang memiliki kode cabang KKM.
SELECT * FROM nasabah WHERE no_rekening = ANY(SELECT no_rekening FROM rekening WHERE kode_cabang like "KKM%");

-- @BLOCK
-- e
-- tampilkan data nasabah yang melakukan transaksi melalui ATM dengan jumlah transaksi lebih dari 100.000.
SELECT * FROM nasabah WHERE no_rekening = ANY(SELECT no_rekening FROM transaksi WHERE jenis_transaksi = "ATM" AND jumlah > 100000);