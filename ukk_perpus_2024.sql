CREATE DATABASE perpustakaan;
USE perpustakaan;


CREATE TABLE kategori (
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    kategori VARCHAR(200) NOT NULL
);
CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(200) NOT NULL,
    username VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    alamat VARCHAR(200) NOT NULL,
    level ENUM('admin','petugas','peminjam') NOT NULL
);

CREATE TABLE buku (
    id_buku INT PRIMARY KEY AUTO_INCREMENT,
    id_kategori INT NOT NULL,
    judul VARCHAR(200) NOT NULL,
    penulis VARCHAR(200) NOT NULL,
    penerbit VARCHAR(200) NOT NULL,
    tahun_terbit VARCHAR(200) NOT NULL,
    deskirpsi TEXT NOT NULL,
    constraint fk_kategori foreign key (id_kategori) references kategori(id_kategori)
);

CREATE TABLE ulasan (
    id_ulasan INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_buku INT NOT NULL,
    ulasan TEXT,
    rating INT NOT NULL,
    constraint fk_user foreign key (id_user) references user(id_user),constraint buku foreign key (id_buku) references buku(id_buku)
);

CREATE TABLE peminjaman (
    id_peminjaman INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_buku INT NOT NULL,
    tanggal_peminjaman DATE,
    tanggal_pengembalian DATE,
    status ENUM('dipinjam', 'dikembalikan') NOT NULL,
    CONSTRAINT fk_user_peminjaman FOREIGN KEY (id_user) REFERENCES user(id_user),
    CONSTRAINT fk_buku_peminjaman FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

