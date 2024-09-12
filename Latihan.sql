---- BASIC QUERY

CREATE DATABASE starup;

USE starup;

CREATE TABLE Produk (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    harga INT NOT NULL
    );
INSERT INTO Produk (id_produk, nama_produk, harga) VALUES
(1,'laptop',700000),
(2,'mouse',30000),
(3,'keyboard',100000),
(4,'monitor',500000);

SELECT * FROM Produk;

UPDATE PRODUK SET harga = 3500000 WHERE id_produk = 2;

DELETE FROM PRODUK WHERE ID_PRODUK = 3;

SELECT * FROM Produk WHERE HARGA > 500000;


-----SUBQUERY
SELECT NAMA_PRODUK FROM PRODUK WHERE HARGA = (SELECT AVG(HARGA) AS RATA_RATA FROM PRODUK);

SELECT * FROM PRODUK WHERE HARGA < (SELECT HARGA FROM PRODUK WHERE ID_PRODUK = 1);



----JOIN


CREATE TABLE kategori(
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL
);

INSERT INTO Kategori (id_kategori, nama_kategori) VALUES
(1, 'Elektronik'),
(2, 'Fashion'),
(3, 'Peralatan Rumah Tangga');


SELECT Produk.nama_produk, Kategori.nama_kategori
FROM Produk
JOIN Kategori ON Produk.id_kategori = Kategori.id_kategori;



INSERT INTO Produk (id_produk, nama_produk, harga, id_kategori) VALUES
(1, 'Laptop', 7000000, 1), -- Elektronik
(2, 'Smartphone', 3000000, 1), -- Elektronik
(3, 'Kemeja', 150000, 2); -- Fashion

SELECT Kategori.nama_kategori
FROM Kategori
LEFT JOIN Produk ON Kategori.id_kategori = Produk.id_kategori
WHERE Produk.id_kategori IS NULL;
    
