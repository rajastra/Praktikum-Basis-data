--no1
CREATE DATABASE univ_mino;
--no2
CREATE TABLE mahasiswa(
   nim INT(11) PRIMARY KEY NOT NULL,
   nama char(20) NOT NULL,
   angkatan INT(4) NOT NULL,
   semester int(2) NOT NULL
)ENGINE = InnoDB;
--no3
ALTER TABLE mahasiswa ADD COLUMN tanggal_lahir varchar(6) NOT NULL AFTER nama;
ALTER TABLE mahasiswa ADD COLUMN keterangan char(3) NOT NULL;
ALTER TABLE mahasiswa CHANGE COLUMN nama nama_lengkap char(20) NOT NULL;
ALTER TABLE mahasiswa DROP COLUMN keterangan;

--no4
DROP TABLE IF EXISTS mata_kuliah;
CREATE TABLE mata_kuliah(
   id_mk INT(11) PRIMARY KEY NOT NULL,
   nim int(11) NOT NULL,
   nama_matkul char(20) NOT NULL,
   sks int(11) NOT NULL,
   FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
)ENGINE = InnoDB;

--no5
ALTER TABLE mata_kuliah ADD COLUMN dosen varchar(20) AFTER nama_matkul;
ALTER TABLE mata_kuliah CHANGE COLUMN dosen dosen_pengampu varchar(20);