drop DATABASE toko;

CREATE DATABASE toko;
USE toko;
CREATE table pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama_pelanggan VARCHAR (200) NOT NULL,
    alamat VARCHAR (200) NOT NULL,
    nomor_telepon VARCHAR (200) NOT NULL
);

SELECT * FROM pelanggan;        
-- drop table pelanggan;

CREATE TABLE penjualan (
    id_penjualan INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT NOT NULL,
    tanggal_penjualan DATE NOT NULL,
    total_harga INT NOT NULL
);


CREATE TABLE produk (
    id_produk INT PRIMARY KEY  AUTO_INCREMENT,
    nama_produk VARCHAR (200) NOT NULL,
    harga INT NOT NULL,
    stok INT NOT NULL
)

CREATE TABLE detail_penjualan (
    id_detail_penjualan INT PRIMARY KEY  AUTO_INCREMENT,
    id_penjualan INT NOT NULL,
    id_produk INT NOT NULL,
    jumlah_produk INT NOT NULL,
    subtotal INT NOT NULL
);
SELECT * FROM detail_penjualan;

CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nama_user VARCHAR (200) NOT NULL,
    username VARCHAR (200) NOT NULL,
    password VARCHAR (200) NOT NULL,
    level ENUM ('admin','petugas') NOT NULL
    
)

ALTER TABLE penjualan ADD CONSTRAINT id_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan);

ALTER TABLE detail_penjualan ADD CONSTRAINT id_penjualan FOREIGN KEY (id_penjualan) REFERENCES penjualan (id_penjualan);
ALTER TABLE detail_penjualan ADD CONSTRAINT id_produk FOREIGN KEY (id_produk) REFERENCES produk (id_produk);


SELECT * FROM pelanggan INNER JOIN penjualan ON pelanggan.id_pelanggan = penjualan.id_penjualan;


SELECT 
    pelanggan.id_pelanggan,
    pelanggan.nama_pelanggan,
    pelanggan.alamat,
    pelanggan.nomor_telepon,
    penjualan.id_penjualan,
    penjualan.tanggal_penjualan,
    penjualan.total_harga,
    detail_penjualan.id_detail_penjualan,
    detail_penjualan.id_produk,
    detail_penjualan.jumlah_produk,
    detail_penjualan.subtotal,
    produk.id_produk,
    produk.nama_produk,
    produk.harga,
    produk.stok
FROM pelanggan
LEFT JOIN penjualan ON pelanggan.id_pelanggan = penjualan.id_pelanggan
LEFT JOIN detail_penjualan ON penjualan.id_penjualan = detail_penjualan.id_penjualan
LEFT JOIN produk ON produk.id_produk = detail_penjualan.id_produk;

SELECT penjualan.id_penjualan,
    penjualan.tanggal_penjualan,
    penjualan.total_harga,
    pelanggan.id_pelanggan,
    pelanggan.nama_pelanggan,
    pelanggan.alamat
     FROM penjualan INNER JOIN pelanggan ON penjualan.id_pelanggan = pelanggan.id_pelanggan;


SELECT * FROM penjualan INNER JOIN pelanggan ON penjualan.id_pelanggan = pelanggan.id_pelanggan;


SELECT * from penjualan;

SELECT * FROM penjualan WHERE tanggal_penjualan BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE();

SELECT * 
FROM penjualan 
WHERE MONTH(tanggal_penjualan) = MONTH(CURDATE()) 
AND YEAR(tanggal_penjualan) = YEAR(CURDATE())
;
