CREATE DATABASE siswa;
USE siswa;

CREATE TABLE tb_anggota (
    anggota_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR (50),
    email VARCHAR (100),
    alamat VARCHAR (100),
    propinsi VARCHAR (100),
    umur INT (10)
);

RENAME TABLE tbl_anggota TO tb_anggota;


INSERT INTO tb_anggota (anggota_id, nama, email, alamat, propinsi, umur) VALUES
(1, 'wayan', 'wayan@email.com', 'Badung', 'Bali', 21),
(2, 'made', 'made@email.com', 'Gianyur', 'Bali', 19),
(3, 'Nyoman', 'Nyoman@email.com', 'Klungkung', 'Bali', 30),
(4, 'Ketut', 'Ketut@email.com', 'Tabanan', 'Bali', 23),
(5, 'Gede', 'Gede@email.com', 'Karangsem', 'Bali', 27),
(6,'Putu','Putu@email.com','Gianyar','Bali',24),
(7, 'kadek', 'kadek@email.com', 'Denpasar', 'Bali', 31),
(8, 'Komang', 'Komang@email.com', 'Bangli', 'Bali', 19),
(9, 'Ivan', 'Ivan@email.com', 'Badung', 'Bali', 22),
(10, 'Toni', 'Toni@email.com', 'Bandung', 'jawa Barat', 35),
(11, 'Adep', 'Adep@email.com', 'Bandung', 'jawa Barat', 18),
(12, 'Ucok', 'Ucok@email.com', 'Medan', 'Sumatra Utara', 23);

CREATE TABLE tb_absensi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    anggota_id INT,
    tanggal DATE
);

DROP Table tb_absensi;

INSERT INTO tb_absensi (id, anggota_id, tanggal) VALUES
(1, 1, '2019-07-26'),
(2, 2, '2019-07-26'),
(3, 3, '2019-07-26'),
(4, 4, '2019-07-26'),
(5, 5, '2019-07-27'),
(6, 6, '2019-07-27');



ALTER TABLE tb_anggota CHANGE propinsi provinsi VARCHAR (100);

-----2


SELECT * FROM tb_anggota  JOIN tb_absensi ON tb_anggota.anggota_id = tb_absensi.anggota_id WHERE tb_absensi.anggota_id IS NUll;

SELECT * 
FROM tb_anggota
LEFT JOIN tb_absensi ON tb_anggota.anggota_id = tb_absensi.anggota_id
WHERE tb_absensi.anggota_id IS NULL;


SELECT * FROM tb_anggota WHERE umur =  (SELECT MAX(umur) FROM tb_anggota);

