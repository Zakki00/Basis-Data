-- use pembayaran_spp;


-- CREATE TABLE Siswa (
--     nisn INT PRIMARY KEY,
--     nis VARCHAR(500) NOT NULL,
--     nama VARCHAR(500) NOT NULL,
--     id_kelas INT NOT NULL,
--     alamat VARCHAR(500) NOT NULL,
--     no_telp INT NOT NULL
-- )

-- create table pembayran (
--     id_pembayran INT PRIMARY KEY,
--     id_petugas INT NOT NULL,
--     id_spp INT NOT NULL,
--     nisn INT NOT NULL,
--     tgl_bayar DATE NOT NULL,
--     bulan_bayar VARCHAR(500) NOT NULL,
--     tahun_bayar VARCHAR(500) NOT NULL,
--     jumlah_bayar INT NOT NULL
    
-- )

-- create TABLE petugas (
--     id_petugas INT PRIMARY KEY,
--     username VARCHAR(500) NOT NULL,
--     password VARCHAR(500) NOT NULL,
--     nama_petugas VARCHAR(500) NOT NULL,
--     level VARCHAR(500) NOT NULL

-- )

CREATE TABLE spp(
    id_spp INT PRIMARY KEY,
    tahun INT NOT NULL,
    nominal INT NOT NULL
)


CREATE TABLE kelas (
    id_kelas INT PRIMARY KEY,
    nama_kelas VARCHAR(50),
    kompetensi_keahlian VARCHAR (50)
)