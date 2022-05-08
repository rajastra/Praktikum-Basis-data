USE univ_mino;

show TABLES;

CREATE TABLE mahasiswa(
   nim INT(11) PRIMARY KEY NOT NULL,
   nama char(20) NOT NULL,
   angkatan INT(4) NOT NULL,
   semester int(2) NOT NULL
);

DROP DATABASE univ_mino;
DESC mahasiswa;
DROP TABLE IF EXISTS mahasiswa;