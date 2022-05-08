--no1
CREATE DATABASE Westhinghouse;
--no2
CREATE TABLE Buku(
   id_buku INT(11) PRIMARY KEY NOT NULL,
   buku_nama char(20) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Penerbit(
   id_penerbit INT(11) PRIMARY KEY NOT NULL,
   nama_penerbit char(20) NOT NULL,
   kontak_penerbit char(20) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Pegawai(
   id_pegawai INT(11) PRIMARY KEY NOT NULL,
   pegawai_nama char(20) NOT NULL,
   jabatan char(20) NOT NULL,
   umur INT(3) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Pembeli(
   id_pembeli INT(11) PRIMARY KEY NOT NULL,
   nama_pembeli char(20) NOT NULL,
   kontak_pembeli char(20) NOT NULL
)ENGINE = InnoDB;

--no3
ALTER TABLE Pegawai CHANGE COLUMN pegawai_nama nama_pegawai char(20) NOT NULL;
ALTER TABLE Pegawai DROP COLUMN umur;
ALTER TABLE Buku CHANGE COLUMN buku_nama nama_buku char(20);
ALTER TABLE Buku ADD COLUMN jumlah_stok varchar(10) NOT NULL AFTER nama_buku;
ALTER TABLE Buku CHANGE COLUMN id_buku isbn char(20);
--no4
ALTER TABLE Buku ADD COLUMN id_penerbit INT(11) NOT NULL;
ALTER TABLE Buku
  ADD CONSTRAINT id_penerbit FOREIGN KEY (id_penerbit) REFERENCES Penerbit (id_penerbit);
