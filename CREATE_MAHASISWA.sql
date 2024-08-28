CREATE TABLE mahasiswa(
    nim INT (12) NOT NULL,
    nama VARCHAR (60) NOT NULL,
    gender CHAR(1)NOT NULL,
    alamat VARCHAR(120),
    PRIMARY KEY (nim)
);

INSERT INTO mahasiswa (nim, nama, gender, alamat) VALUES
(101, "arif", "L", "Jl.kenangan"),
(102, "budi", "L", "Jl.Jombang"),
(103, "Wati", "P", "Jl.surabaya"),
(104, "Ika", "P", "JL.Jombang"),
(105, "Tono", "L", "Jl.Jakarta"),
(106, "Iwan", "l", "Jl.Bandung"),
(107, "Sari", "P", "Jl.malang");


SHOW TABLES;

SELECT * FROM mahasiswa WHERE jenis_kelamin = (SELECT jenis_kelamin FROM mahasiswa WHERE nama = 'Arif')
AND nama <> 'Arif';


SELECT * FROM matakuliah m LEFT JOIN ambil_mk a ON m.kode_mk = a.kode_mk WHERE a.kode_mk IS NULL;

DELIMITER //
CREATE PROCEDURE getMahasiswa() BEGIN
/* Ini baris komentar */
SELECT * FROM mahasiswa; END //
DELIMITER ;
