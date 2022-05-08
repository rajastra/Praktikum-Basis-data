-- @BLOCK
-- buat database akademik
CREATE DATABASE akademik;

-- @BLOCK
-- buat tabel mahasiswa
CREATE TABLE mahasiswa(
    nim char(3) NOT NULL,
    kodemk varchar(5) NOT NULL,
    thnakademik char(9) NOT NULL,
    nilai char(1),
    bobot int(2) NOT NULL
);
-- @BLOCK
-- Hapus tabel mahasiswa
DROP TABLE mahasiswa;

-- @BLOCK
-- mauskan data ke tabel mahaiswa data diatas
INSERT INTO MAHASISWA VALUES
    ('123','SMBD2','2020/2021','C',4),
    ('123','SMBD2','2021/2022','A',4),
    ('123','SIBW','2021/2022','A',4),
    ('123','DMEP','2021/2022','B',2),
    ('456','DMEP','2021/2022','A',2),
    ('456','SIBW','2019/2020','C',4),
    ('456','SIBW','2020/2021','C',4),
    ('456','SIBW','2021/2022','A',4),
    ('789','SMBD2','2017/2018','D',4), 
    ('789','SMBD2','2018/2019','C',4),
    ('789','SMBD2','2019/2020','C',4),
    ('789','SMBD2','2020/2021','A',4);

-- @BLOCK
-- 4.Tampilkan nilai terbaik yang didapatkan oleh seorang mahasiswa untuk setiap mata kuliah
SELECT min(nilai) as nilai, kodemk, thnakademik
FROM mahasiswa
GROUP BY kodemk, thnakademik
ORDER BY nilai DESC;

-- @BLOCK
-- 5.Tampilkan matakuliah beserta nilai yang terburuk yang pernah didapatkan oleh mahasiswa dengan nim 123
SELECT kodemk, nilai FROM mahasiswa WHERE nim = '123' GROUP BY kodemk ORDER BY nilai DESC;

-- @BLOCK
-- 6.Tampilkan jumlah cacah nilai yang pernah diberikan untuk matakuliah tertentu
SELECT kodemk, count(nilai) as jumlah FROM mahasiswa GROUP BY kodemk;


-- @BLOCK
-- 7.Tampilkan seluruh mahasiswa yang pernah mengulang sebuah matakuliah.
SELECT nim, kodemk, thnakademik FROM mahasiswa GROUP BY nim, kodemk HAVING count(kodemk) > 1;

-- @BLOCK
-- 8.Tampilkan semua tabel dimana fieldnya terdiri dari nim, kodemk, thnakademik, nilai dimana nilai lebih kecil dari C
SELECT nim, kodemk, thnakademik, nilai FROM mahasiswa GROUP BY nilai HAVING(nilai) > 'C';