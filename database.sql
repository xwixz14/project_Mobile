CREATE DATABASE perpustakaan

CREATE TABLE peminjaman (
NimMahasiswa INT (20),
NamaMahasiswa VARCHAR (255),
NamaBuku VARCHAR (255),
TanggalPeminjaman VARCHAR (255),
TanggalPengembalian VARCHAR (255),
PRIMARY KEY (NimMahasiswa));

DROP TABLE peminjaman
INSERT INTO peminjaman VALUE 
('22312119','DwiCahyoKuncoro','Pengetahuan Alam','14-01-2024','20-01-2024');
SELECT *FROM peminjaman ;

CREATE TABLE buku (
NamaBuku VARCHAR (255),
Penerbit VARCHAR (255),
TahunPenerbit INT (255),
UploadGambar VARCHAR (255),
PRIMARY KEY (NamaBuku));

DROP TABLE buku;
INSERT INTO buku VALUE 
SELECT *FROM buku;

CREATE TABLE USER (
  id_user INT(11) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(50) DEFAULT NULL,
  username VARCHAR(50) DEFAULT NULL,
  pass VARCHAR(255) DEFAULT NULL,
  ROLE VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id_user)
) ENGINE=INNODB AUTO_INCREMENT=6 ;
/*Data for the table user */

INSERT  INTO USER(id_user,NAME,username,pass,ROLE) VALUES (1,'admin','tes','28b662d883b6d76fd96e4ddc5e9ba780','Admin');
SELECT * FROM USER;
