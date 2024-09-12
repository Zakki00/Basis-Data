
--Untuk memebuat databsae
CREATE DATABASE PERUSAHAAN;

CREATE DATABASE Rumah;


--Untuk membuat tabel karyawan
CREATE TABLE karyawan (
    nama VARCHAR (30) NOT NULL,
    id_dep INT (5) NOT NULL
);
--Untuk membuat table Ddepartemen
CREATE TABLE Departemen(
    id_dep INT (5) NOT NULL,
    nama_dep VARCHAR (30) NOT NULL,
    PRIMARY KEY (id_dep)
     );

--Untuk memasukan data ke tabel karyawan     
INSERT INTO karyawan (nama, id_dep) VALUES 
("AGUS",10),("BUDI",16),("CIRA",12),("DANI",17)
;

--Untuk memasukan data ke tabel departemen
INSERT INTO Departemen  (id_dep,nama_dep) VALUES
(10,"Penelitian"),(11,"Pemasaran"),(12,"SDM"),(13,"Keuangan");

--Untuk menampilkan data yang sama dari departemen dan karayawan berdasarkan id_dep menggunakan metode inner join
SELECT * FROM karyawan 
INNER JOIN Departemen ON karyawan.id_dep = Departemen.id_dep;

--bentuk implisit
SELECT * FROM karyawan,Departemen
WHERE karyawan.id_dep = Departemen.id_dep;


--Menggunakan inner join unutk menseleksi nama kolom yang hanya ingin di tampilkan nilainya
SELECT  karyawan.nama, Departemen.nama_dep FROM karyawan
INNER JOIN Departemen ON karyawan.id_dep = Departemen.id_dep;


--metode iner join menggunakan alias pada setiap nama tabel
SELECT k.nama, d.nama_dep FROM karyawan k 
INNER JOIN Departemen d ON k.id_dep = d.id_dep;

--menggunakan left outer join unutk mendapatakan data yang tidak sama dengan table yang di join
SELECT * FROM karyawan k 
LEFT OUTER JOIN Departemen d ON k.id_dep = d.id_dep;

--menggunakan left outer join unutk mendapatakan data yang tidak sama dengan table yang di join dengan kondisi where
SELECT * FROM karyawan k 
LEFT OUTER JOIN Departemen d ON k.id_dep = d.id_dep
WHERE d.id_dep IS NULL ;


--menggunakan right outer join unutk mendapatakan data yang tidak sama dengan table yang di join

SELECT * FROM karyawan k 
RIGHT OUTER JOIN Departemen d ON k.id_dep = d.id_dep;
WHERE d.id_dep IS NULL ;
--join Menggunakan left dan right outer join
SELECT * FROM karyawan k 
LEFT OUTER JOIN Departemen d ON k.id_dep = d.id_dep
UNION
SELECT * FROM karyawan k 
RIGHT OUTER JOIN Departemen d ON k.id_dep = d.id_dep;


--menggunakn cross join
SELECT * FROM karyawan CROSS JOIN Departemen;


---Praktikum
CREATE TABLE PROVINSI (
    KODE_PROV INT (5) NOT NULL,
    NAMA_PROV VARCHAR (50) NOT NULL,
    PRIMARY KEY (KODE_PROV)
);
CREATE TABLE KOTA (
    KODE_PROV INT (5) NOT NULL,
    KODE_KOTA INT (5) NOT NULL,
    NAMA_KOTA VARCHAR (50) NOT NULL
);

    CREATE TABLE KECAMATAN (
        KODE_PROV INT (5) NOT NULL,
        KODE_KOTA INT (5) NOT NULL,
        KODE_KEC INT (5) NOT NULL,
        NAMA_KEC VARCHAR (50) NOT NULL
    );


ALTER TABLE mahasiswa  CHANGE COLUMN gender  Jenis_KELAMIN varchar(50);


ALTER TABLE KOTA  change column KO_KOTA  KODE_KOTA varchar(50);

INSERT INTO KOTA (KODE_PROV, KODE_KOTA, NAMA_KOTA) VALUES 
    (12, 1, "MEDAN"),
    (21,1,"BANDUNG"),
    (21, 2, "BOGOR"),
    (22,1,"SEMARANG"),
    (23,2,"KUDUS"),
    (23,1,"YOGYA"),
    (23, 2, "SLEMAN"),
    (24,1,"SURABAYA"),
    (31,1,"BANJARMASIN");

INSERT INTO PROVINSI VALUES 
(20,"DKI Jakarta"),
(21,"Jawa Barat"),
(22,"Jawa Tengah"),
(23,"DI Yogyakarta"),
(24,"Jawa Timur");


INSERT INTO KECAMATAN (KODE_PROV, KODE_KOTA, KODE_KEC, NAMA_KEC) VALUES
(22,2,1,"KUDUS KOTA"),
(22,2,2,"JATI"),
(23,1,1,"GONDOKUSUMAN"),
(23,1,2,"UMBULHARJO");

SELECT  KOTA.NAMA_KOTA, PROVINSI.NAMA_PROV FROM KOTA 
INNER JOIN PROVINSI ON KOTA.KODE_PROV = PROVINSI.KODE_PROV;

SELECT * FROM karyawan k 
RIGHT OUTER JOIN Departemen d ON k.id_dep = d.id_dep;

SELECT 
LEFT OUTER JOIN Departemen d ON k.id_dep = d.id_dep
WHERE d.id_dep IS NULL ;



SELECT P.KODE_PROV, NAMA_PROV, K.KODE_PROV, NAMA_KOTA_PROV
RIGHT OUTER JOIN KOTA K ON P.KODE_PROV = K.KODE_PROV;



SELECT karyawan k 
RIGHT OUTER JOIN Departemen d ON k.id_dep = d.id_dep;
WHERE d.id_dep IS NULL ;

SELECT P.KODE_PROV, P.NAMA_PROV, K.KODE_PROV, K.NAMA_KOTA
FROM KOTA K
RIGHT JOIN PROVINSI P ON P.KODE_PROV = K.KODE_PROV;

SELECT K.KODE_PROV, K.KODE_PROV, K.KODE_KOTA, K.NAMA_KOTA
FROM KOTA K
LEFT JOIN PROVINSI P ON K.KODE_PROV = P.KODE_PROV
WHERE P.KODE_PROV , NAMA_PROVIS NULL;

SELECT K.KODE_PROV, K.NAMA_KOTA FROM KOTA K
LEFT JOIN PROVINSI P ON K.KODE_PROV = P.KODE_PROV
WHERE P.KODE_PROV IS NULL

SELECT  P.KODE_PROV, NAMA_PROV, K.KODE_PROV, KODE_KOTA,NAMA_KOTA
LEFT JOIN PROVINSI P ON P.KODE_PROV = K.KODE_PROV
WHERE P.KODE_PROV, NAMA_PROV IS NULL;


    SELECT P.KODE_PROV, P.NAMA_PROV,K.KODE_PROV, K.KODE_KOTA, K.NAMA_KOTA
    FROM KOTA K
    LEFT JOIN PROVINSI P ON K.KODE_PROV = P.KODE_PROV
    WHERE P.KODE_PROV IS NULL;


    --------------------------------------------------MATERI DATABASE KELAS XII ACP ----------------------------------------------------------------


CREATE DATABASE kuliah;

DELIMITER //
CREATE PROCEDURE getMahasiswa() BEGIN
/* Ini baris komentar */
SELECT * FROM mahasiswa; END //
DELIMITER ;

    
use kuliah;

CALL getMahasiswa();

CREATE Table mahasiswa(
    Nomer INT(10) NOT NULL,
    NIM INT (7) AUTO_INCREMENT PRIMARY KEY,
    Nama_Lengkap VARCHAR(50) NOT NULL,
    Jenis_Kelamin VARCHAR(50) NOT NULL,
    Fakultas VARCHAR(50) NOT NULL,
    Jurusan VARCHAR(50) NOT NULL
);
 INSERT INTO mahasiswa (Nomer, Nim, Nama_Lengkap, Jenis_Kelamin, Fakultas, Jurusan) VALUES
('1', '1300001', 'Ahmad Banyu Rachman', 'Laki-laki', 'FPMIPA', 'Ilmu Komputer'),
('2', '1300002', 'Ilham Muhkarom', 'Laki-laki', 'FPMIPA', 'Pendidikan Ilmu Komputer'),
('3', '1300003', 'Nisa Aldawiyati', 'Perempuan', 'FPMIPA', 'Ilmu Komputer'),
('4', '1300004', 'Nuni Karlina Rohayati', 'Perempuan', 'FPMIPA', 'Pendidikan Ilmu Komputer'),
('5', '1300005', 'Rizki Cahyana', 'Laki-laki', 'FPMIPA', 'Pendidikan Ilmu Komputer'),
('6', '1300006', 'Rizki Egi Purnama', 'Laki-laki', 'FPMIPA', 'Pendidikan Ilmu Komputer'),
('7', '1300007', 'Rooseno Rahman Dewanto', 'Laki-laki', 'FPMIPA', 'Ilmu Komputer'),
('8', '1300008', 'Taufik Rizki Sulaksana', 'Laki-laki', 'FPMIPA', 'Ilmu Komputer');

SELECT * FROM mahasiswa;

CREATE TABLE Dosen(
    Kode_Dosen INT(10)  PRIMARY KEY,
    Nama_Dosen VARCHAR(50) NOT NULL,
    Matakuliah VARCHAR(50) NOT NULL
);

INSERT INTO Dosen (Kode_Dosen, Nama_Dosen, Matakuliah) VALUES
('2586', 'Jajang Kusnendar, S.T., M.T.', 'Algoritma dan Pemrograman'),
('2668', 'Novi Sofia Fitriasari, S.Si., M.T.', 'Arsitektur dan Organisasi Komputer'),
('2556', 'Eddy Prasetyo Nugroho, M.T.', 'Basis Data'),
('0640', 'Prof. Dr. H. Abdul Majid, M.A.', 'Pendidikan Agama Islam'),
('0938', 'Drs. Tatang Syaripudin, M.Pd.', 'Landasan Pendidikan'),
('2481', 'Dr. Cepi Riyana, M.Pd.', 'Kurikulum dan Pembelajaran'),
('1883', 'Dra. Hj. Ehan, M.Pd.', 'Bimbingan dan Konseling'),
('1321', 'Dra. Hj. Heni Rusnayati, M.Si.', 'Bahasa Inggris'),
('1718', 'Dr. Wawan Setiawan', 'Rangkaian Elektronika');

SELECT * FROM Dosen;


CREATE TABLE Mata_Kuliah(
    Kode_MK VARCHAR (7)PRIMARY KEY,
    Mata_Kuliah VARCHAR (50) NOT NULL,
    SKS VARCHAR (50) NOT NULL
);

INSERT INTO Mata_Kuliah (Kode_MK, Mata_Kuliah, SKS) VALUES
('IK310', 'Algoritma dan Pemrograman', '2'),
('IK420', 'Arsitektur dan Organisasi Komputer', '3'),
('IK330', 'Basis Data', '2'),
('KU100', 'Pendidikan Agama Islam', '2'),
('KD300', 'Landasan Pendidikan', '2'),
('KD303', 'Kurikulum dan Pembelajaran', '2'),
('KD302', 'Bimbingan dan Konseling', '2'),
('IK302', 'Bahasa Inggris', '2'),
('IK320', 'Rangkaian Elektronika', '2');

SELECT * FROM Mata_Kuliah;



SELECT Nama_Lengkap NIM, Jenis_Kelamin FROM mahasiswa WHERE Jurusan = 'Pendidikan Ilmu Komputer';

UPDATE mahasiswa SET Jurusan = 'Sistem Informasi' WHERE NIIM = '1300001';

DELETE FROM mahasiswa WHERE NIM = '1300003';

SELECT Nama_Lengkap FROM mahasiswa WHERE Nama_Lengkap LIKE 'R%';

SELECT Nama_Lengkap FROM mahasiswa WHERE Nama_Lengkap LIKE '%A';

SELECT Nama_Lengkap FROM mahasiswa WHERE Nama_Lengkap LIKE '%R%';



-----query untuk kompoment table
SHOW TABLES; ------untuk menampilkan tabel
SHOW DATABASES; ----untuk menampilkan    database
DROP TABLE mahasiswa; ----menghapus tabel
TRUNCATE TABLE mahasiswa; ----mengosongkan tabel
USE kuliah; ---------menggunakan table
SHOW TABLES ; ------menmampilkan tabel dari database
DROP DATABASE kuliah; ----menghapus database
ALTER TABLE mahasiswa ADD alamat VARCHAR(50) NOT NULL; -----menambahkan kolom
ALTER TABLE mahasiswa DROP alamat; ----menghapus kolom
ALTER TABLE mahasiswa CHANGE alamat nama_alamat VARCHAR(50) NOT NULL; ----mengubah kolom, setelah syintax chnage harus ada kolom lama dan kolom baru
RENAME TABLE nama_table TO nama_baru; ----mengganti nama table

ALTER DATABASE kuliah CHANGE TO SEKOLAH;



    


    --------------------------------------------------------------------------Tugas 1 Module 2------------------------------------------------------------------------
    

CREATE DATABASE SEKOLAH;

USE SEKOLAH;


---Membuat Table Siswa
CREATE TABLE Siswa (
    nip INT (50) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    kota VARCHAR(50) NOT NULL,
    tgl_lahir VARCHAR(50) NOT NULL,
    jenis_kelamin VARCHAR(50) NOT NULL
);

INSERT INTO Siswa (nip, nama, kota, tgl_lahir, jenis_kelamin) VALUES
    (12348, 'Dita Nurafni', 'Klaten', '1 September 1988', 'P'),
    (12349, 'Dhani Akbar', 'Yogyakarta', '13 Mei 1986', 'L'),
    (12350, 'Raul Sitompul', 'Yogyakarta', '5 April 1989', 'L'),
    (12351, 'Rahmanda Niken', 'Bantul', '16 Oktober 1986', 'P'),
    (12352, 'Niken', 'Klaten', '30 Desember 1988', 'P'),
    (12353, 'Inneke Safitri', 'Bantul', '27 Agustus 1989', 'P');



    ---tambahkan nama file no_telp dan isi table tersebut
ALTER TABLE Siswa ADD no_tlp VARCHAR (50) NOT NULL;


UPDATE Siswa SET no_tlp = '081736176831' WHERE nip = 12348;
UPDATE Siswa SET no_tlp = '085731631121' WHERE nip = 12349;
UPDATE Siswa SET no_tlp = '085731631122' WHERE nip = 12350;
UPDATE Siswa SET no_tlp = '085731631123' WHERE nip = 12351;
UPDATE Siswa SET no_tlp = '085731631124' WHERE nip = 12352;
UPDATE Siswa SET no_tlp = '085731631125' WHERE nip = 12353;
 


-----3.UBAH (UPDATE) DITA NURAFNI DAN RAUL SITOMPUL DENGAN MALANG

UPDATE Siswa SET kota = 'Malang' WHERE nip = 12348;
UPDATE Siswa SET kota = 'Malang' WHERE nip = 12350;



CREATE DATABASE b;

use b;




---------------------------------------------------------------------------LATIHAN MODULE 03-------------------------------------------------------------------------- 
CREATE DATABASE Module_03;
USE Module_03;



CREATE TABLE Dosen (
    kode_dosen VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100) NOT NULL,
    alamat_dosen VARCHAR(100) NOT NULL
);
INSERT INTO Dosen (kode_dosen, nama_dosen, alamat_dosen) VALUES
('10', 'Suharto', 'Jl. Jombang'),
('11', 'Martono', 'Jl. Kalpataru'),
('12', 'Rahmawati', 'Jl. Jakarta'),
('13', 'Bambang', 'Jl. Bandung'),
('14', 'Nurul', 'Jl. Raya Tidar');

SELECT * FROM Dosen;

CREATE TABLE Jurusan (
    kode_jurusan VARCHAR(10) PRIMARY KEY,
    nama_jurusan VARCHAR(100) NOT NULL,
    kode_dosen VARCHAR(10) NOT NULL
);

INSERT INTO Jurusan (kode_jurusan, nama_jurusan, kode_dosen) VALUES
('TE', 'Teknik Elektro', '10'),
('TM', 'Teknik Mesin', '13'),
('TS', 'Teknik Sipil', '23');


CREATE TABLE Mahasiswa (
    NIM VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jenis_kelamin CHAR(1) NOT NULL,
    alamat VARCHAR(100) NOT NULL
);
INSERT INTO Mahasiswa (NIM, nama, jenis_kelamin, alamat) VALUES
(101, 'Arif', 'L', 'Jl. Kenangan'),
(102, 'Budi', 'L', 'Jl. Jombang'),
(103, 'Wati', 'P', 'Jl. Surabaya'),
(104, 'Ika', 'P', 'Jl. Jombang'),
(105, 'Tono', 'L', 'Jl. Jakarta'),
(106, 'Iwan', 'L', 'Jl. Bandung'),
(107, 'Sari', 'P', 'Jl. Malang');

CREATE TABLE Ambil_MK (
    NIM VARCHAR(10) NOT NULL,
    Kode_MK VARCHAR(10) NOT NULL
    
);
INSERT INTO Ambil_MK (NIM, Kode_MK) VALUES
(101, 'PTI447'),
(103, 'TIK333'),
(104, 'PTI333'),
(104, 'PTI777'),
(111, 'PTI123'),
(123, 'PTI999');

CREATE TABLE Mata_Kuliah (
    Kode_MK VARCHAR(10) PRIMARY KEY,
    Nama_MK VARCHAR(100) NOT NULL,
    SKS INT NOT NULL,
    Semester INT NOT NULL,
    Kode_Dosen VARCHAR(10) NOT NULL
);  
INSERT INTO Mata_Kuliah (Kode_MK, Nama_MK, SKS, Semester, Kode_Dosen) VALUES
('PTI447', 'Praktikum Basis Data', 1, 3, 11),
('TIK342', 'Praktikum Basis Data', 1, 3, 11),
('PTI333', 'Basis Data Terdistribusi', 3, 5, 10),
('TIK123', 'Jaringan Komputer', 2, 5, 33),
('TIK333', 'Sistem Operasi', 3, 5, 10),
('PTI123', 'Grafika Multimedia', 3, 5, 12),
('PTI777', 'Sistem Informasi', 2, 3, 99);



---------------------sclar subquery
SELECT * FROM Mahasiswa WHERE Alamat = (SELECT Alamat FROM Mahasiswa WHERE NIM = 104);

-------------------Multiple subquery
SELECT m.NIM, m.nama FROM Mahasiswa m WHERE m.NIM IN (SELECT NIM FROM Ambil_MK ); ----------------operator IN
SELECT * FROM Mata_kuliah WHERE SKS < ANY (SELECT SKS FROM Mata_kuliah WHERE Semester = 5);-------------operator ANY
SELECT * FROM Mata_kuliah WHERE SKS < ALL (SELECT SKS FROM Mata_kuliah WHERE Semester = 5);-------------operator ALL

--------------Multiple-Column Subquery
SELECT * FROM Mata_kuliah WHERE (Semester,SKS) IN (SELECT Semester, SKS FROM Mata_kuliah WHERE Kode_MK = 'PTI333');


---------------operetor EXISTS dan NOT EXISTS
SELECT * FROM Mahasiswa WHERE NOT EXISTS (SELECT * FROM Ambil_MK WHERE Mahasiswa.NIM = Ambil_MK.NIM);

SELECT * FROM Mahasiswa WHERE NOT EXISTS (SELECT * FROM Ambil_MK WHERE Mahasiswa.NIM = Ambil_MK.NIM);

--------------------SUBQUERY dan fungsi AGGREGATE
SELECT * FROM Mata_kuliah WHERE SKS = (SELECT MAX(SKS) FROM Mata_kuliah);

-------------------Subquery dan Join
SELECT M.NIM, M.Nama FROM Mahasiswa M LEFT OUTER JOIN Ambil_MK A ON M.NIM = A.NIM WHERE A.NIM IS NULL; ---------> Pendekatan Join
SELECT M.NIM, M.Nama FROM Mahasiswa M WHERE M.NIM NOT IN (SELECT NIM FROM Ambil_MK); -------------> Pendekatan subquery

SELECT mahasiswa.NIM, mahasiswa.Nama FROM mahasiswa
INNER JOIN ambil_mk ON ambil_mk.NIM = mahasiswa.NIM;



SELECT * FROM ambil_mk;

SELECT * from mahasiswa;




----------------------------------------------------------------------TUGAS PRAKTIKUM module 03-----    --------------------------------    ------------------

--1.	Dapatkan data mahasiswa yang jenis kelaminnya sama dengan “Arif” tidak termasuk “Arif”. (Point 10)
SELECT * FROM Mahasiswa WHERE jenis_kelamin = (SELECT jenis_kelamin FROM Mahasiswa WHERE nama = 'Arif')
AND nama <> 'Arif';

--2.	Dapatkan matakuliah yang tidak diambil oleh mahasiswa terdaftar (mahasiswa di tabel mahasiswa). (Point 20
SELECT * FROM Mata_kuliah m LEFT JOIN Ambil_MK a ON m.Kode_MK = a.Kode_MK WHERE a.Kode_MK IS NULL;
SELECT m.Kode_MK, m.Nama_MK, m.SKS, m.Semester, m.Kode_dosen
FROM Mata_kuliah m
JOIN Ambil_MK a ON m.Kode_MK = a.Kode_MK;

SELECT m.kode_mk, m.nama_mk, m.sks, m.semester, m.kode_dosen
FROM Mata_kuliah m
JOIN Ambil_mk a ON m.kode_mk = a.kode_mk;

SELECT m.Kode_MK, m.Nama_MK, m.SKS, m.Semester, m.Kode_dosen
FROM Mata_kuliah m
LEFT JOIN Ambil_MK a ON m.Kode_mk = a.Kode_MK
WHERE a.Kode_MK IS NULL;



--3.	Dapatkan data mahasiswa yang mengambil matakuliah dengan sks lebih kecil dari sembarang sks. (Point 25)
SELECT m.NIM, m.nama, m.jenis_kelamin, m.alamat
FROM Mahasiswa m
JOIN Ambil_MK am ON m.NIM = am.NIM
JOIN Mata_kuliah mk ON am.Kode_MK = mk.Kode_MK
WHERE mk.SKS < ANY(SELECT SKS FROM Mata_kuliah);


--4	Dapatkan data dosen yang mengajar matakuliah di semester yang sama dengan dosen yang sekaligus menjadi ketua jurusan Teknik Elektro tidak termasuk ketua jurusan Teknik Elektro. (Point 30)
     SELECT DISTINCT d.kode_dosen, d.nama_dosen, d.alamat_dosen
FROM Dosen d
JOIN Mata_kuliah mk ON d.kode_dosen = mk.kode_dosen
WHERE mk.semester IN (
    SELECT DISTINCT mk.semester
    FROM Mata_kuliah mk
    JOIN Dosen d ON mk.kode_dosen = d.kode_dosen
    JOIN Jurusan j ON d.kode_dosen = j.kode_dosen
    WHERE j.nama_jurusan = 'Teknik Elektro'
)
AND d.kode_dosen <> (
    SELECT kode_dosen
    FROM Jurusan
    WHERE nama_jurusan = 'Teknik Elektro'
);



--5.	Dapatkan nim, nama, dan alamat mahasiswa yang tempat tinggalnya sama dengan dosen yang mengajar matakuliah dengan sks di atas rata-rata. (Point 35)

SELECT DISTINCT m.NIM, m.nama, m.alamat
FROM Mahasiswa m
JOIN Dosen d ON m.alamat = d.alamat_dosen
JOIN Mata_kuliah mk ON d.kode_dosen = mk.kode_dosen
WHERE mk.SKS > (
    SELECT AVG(SKS)
    FROM Mata_kuliah
);


------------------------------------------------------------------------------tugas
CREATE DATABASE tugas;
use tugas;

drop DATABASE tugas;

CREATE TABLE employee (
    name VARCHAR(50),
    age INT,
    job VARCHAR(50),
    salary INT
);


    

show TABLES;
INSERT INTO employee (name, age, job, salary) VALUES
('Gaby', 25, 'Accountant', 12000),
('Bob', 30, 'Tech Support', 18000),
('Anne', 23, 'Jr. Marketing', 10000),
('Ollie', 40, 'Director', 20000),
('Kevin', 29, 'Product Manager', 16000),
('Josh', 35, 'Tech Support', 20000);


--1 
SELECT name, age 
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

2--

SELECT name, job 
FROM employee 
WHERE manager = 'Sam';



----------------------------------------------------MODUL VII STORED PROCEDURE---------------------------------------------------------------------------------------


SHOW TABLES;
1. 
DELIMITER //

CREATE PROCEDURE getMahasiswa()
BEGIN
    SELECT * FROM mahasiswa;
END //

DELIMITER ;

CALL `getMahasiswa`();

DROP PROCEDURE getMahasiswa; 



----2.Parameter IN

DELIMITER //
CREATE PROCEDURE getMhsBySemester(IN smt INT(2)) BEGIN
SELECT * FROM Mata_kuliah
WHERE semester = smt;
END //
DELIMITER ;

DROP PROCEDURE `getMhsBySemester`;

SHOW PROCEDURE STATUS;

CALL getMhsBySemester (3);

CREATE PROCEDURE getMhsBySemSks(IN smt INT(2), IN s INT(2)) BEGIN
SELECT *
FROM Mata_kuliah WHERE semester = smt AND sks = s;
END // 

DROP Procedure `getMhsBySemSks`;

CALL getMhsBySemSks(3, 2);

SET @smt = 3;

SELECT @smt;

CALL getMhsBySemester(@smt);

CREATE PROCEDURE addJurusan( IN kode VARCHAR(2),
IN nama VARCHAR(30), IN dos INT(3)
)

BEGIN

INSERT INTO Jurusan VALUES(kode, nama, dos);
END // 

DROP PROCEDURE addJurusan;

SELECT * FROM jurusan;

CALL addJurusan('TG', 'Teknik Geodesi', 9); 


--3. Paramter OUT

CREATE PROCEDURE countMK(OUT total INT(2)) BEGIN
SELECT COUNT(kode_mk)
INTO total
FROM Mata_Kuliah;
 END; //

CALL countMK(@total);

SELECT @total AS total_mk;


CREATE PROCEDURE cnt(OUT mk INT, OUT sks INT)
BEGIN
    SELECT COUNT(kode_mk) INTO mk FROM Mata_Kuliah;
    SELECT SUM(SKS) INTO sks FROM Mata_Kuliah;
END;


CALL cnt(@mk, @sks);
SELECT @mk AS total_mk, @sks AS total_sks;

SELECT SUM(sks) FROM Mata_Kuliah;



--4 paramter inout
DELIMITER //
CREATE PROCEDURE countBySex(INOUT arg VARCHAR(5)) BEGIN
SELECT COUNT(NIM)
INTO arg
FROM Mahasiswa
WHERE jenis_kelamin = arg; END //
DELIMITER ;



SET @var = 'L';
CALL countBySex(@var);
SELECT @var;





DELIMITER //

CREATE PROCEDURE countBySex2(IN sx VARCHAR(1), OUT total INT(5)) BEGIN
SELECT COUNT(NIM)
INTO total FROM Mahasiswa
WHERE jenis_kelamin = sx; END //
DELIMITER ;

CALL countBySex2('L', @total); 

SELECT @total;



--5 pencabangan dan pengulangan

DELIMITER //

CREATE PROCEDURE demoIF(IN bil INT(3)) BEGIN
DECLARE str	VARCHAR(30);
IF (bil > 0) THEN
SET str = 'Lebih dari Nol'; 
ELSE
SET str = 'Kurang dari / sama dengan Nol'; 
END IF;
SELECT str; END //
DELIMITER ;

CALL demoIF(5);

DELIMITER //



DELIMITER //

CREATE PROCEDURE demoIF(IN bil INT(3)) BEGIN
-- Deklarasi variabel di dalam stored procedure
DECLARE str	VARCHAR(30);

IF (bil > 0) THEN
SET str = 'Lebih dari Nol'; ELSE
SET str = 'Kurang dari / sama dengan Nol'; END IF;

-- Mencetak output ke layar
SELECT str; END //
DELIMITER ;
 DROP PROCEDURE demoIF

 CALL demoIF(5)













--------------------------------------------praktikum module 04


--1.
 DELIMITER //

CREATE PROCEDURE total(
    OUT totalCourses INT,
    OUT totalSKS INT
)
BEGIN
    -- Menghitung jumlah matakuliah
    SELECT COUNT(kode_mk) INTO totalCourses FROM Mata_kuliah;
    
    -- Menghitung jumlah total SKS
    SELECT SUM(sks) INTO totalSKS FROM Mata_kuliah;
END //

DELIMITER ;

CALL total(@totalCourses, @totalSKS);

-- Untuk melihat hasilnya
SELECT @totalCourses AS JumlahMatakuliah, @totalSKS AS TotalSKS;


--2
        DELIMITER //

        CREATE PROCEDURE TambahAmbilMK(
            IN p_nim VARCHAR(20),
            IN p_kode_mk VARCHAR(20),
            OUT p_status VARCHAR(50)
        )
        BEGIN
            DECLARE nim_exists INT;
            DECLARE kode_mk_exists INT;
            
            -- Cek apakah nim ada di tabel mahasiswa
            SELECT COUNT(*) INTO nim_exists FROM Mahasiswa WHERE nim = p_nim;
            
            -- Cek apakah kode_mk ada di tabel matakuliah
            SELECT COUNT(*) INTO kode_mk_exists FROM Mata_kuliah WHERE kode_mk = p_kode_mk;
            
            -- Jika nim dan kode_mk keduanya ada
            IF nim_exists > 0 AND kode_mk_exists > 0 THEN
                -- Tambahkan data ke tabel ambil_mk
                INSERT INTO Ambil_MK (nim, kode_mk) VALUES (p_nim, p_kode_mk);
                SET p_status = 'OK';
            ELSE
                -- Jika nim atau kode_mk tidak ada, kembalikan pesan gagal
                SET p_status = 'Operasi Gagal';
            END IF;
        END //

        DELIMITER ;

    DROP Procedure TambahAmbilMK;

CALL TambahAmbilMK('101', 'PTI123', @status);
SELECT @status AS StatusOperasi;

---3
DELIMITER //
CREATE PROCEDURE upsertDosen(IN kode_dos INT(10), IN nama_dos VARCHAR(100), IN alamat_dos VARCHAR(100))
BEGIN
    -- Memeriksa apakah dosen dengan NIDN tersebut sudah ada di tabel
    IF EXISTS (SELECT 1 FROM Dosen WHERE kode_dosen = kode_dos) THEN
        -- Jika dosen sudah ada, lakukan update
        UPDATE Dosen
        SET nama_dosen = nama_dos, alamat_dosen = alamat_dos
        WHERE kode_dosen = kode_dos;
    ELSE
        -- Jika dosen belum ada, lakukan insert
        INSERT INTO Dosen (kode_dosen, nama_dosen, alamat_dosen)
        VALUES (kode_dos, nama_dos, alamat_dos);
    END IF;
END //
DELIMITER;

CALL upsertDosen('80', 'dinda', 'montong');
CALL upsertDosen('10', 'zakki', 'tuban');

SELECT * FROM Dosen;

DROP PROCEDURE upsertDosen;

use module_03