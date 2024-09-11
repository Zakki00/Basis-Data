DELIMITER //

CREATE PROCEDURE getMahasiswa()
BEGIN
    SELECT * FROM mahasiswa;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE up(IN kode_dos INT(10), IN nama_dos VARCHAR(100), IN alamat_dos VARCHAR(100))
BEGIN
        UPDATE Dosen
        SET nama_dosen = nama_dos, alamat_dosen = alamat_dosen
        WHERE kode_dosen = kode_dos;
    END //
DELIMITER ;


Call up(10, 'Suh', 'Jl. Jombang');

SELECT * FROM Dosen;


DELIMITER //

CREATE PROCEDURE upsertDosen(IN kode_dos INT(10), IN nama_dos VARCHAR(100), IN alamat_dos VARCHAR(100))
BEGIN
    -- Memeriksa apakah dosen dengan NIDN tersebut sudah ada di tabel
    IF EXISTS (SELECT 1 FROM dosen WHERE kode_dos = kode_dos) THEN
        -- Jika dosen sudah ada, lakukan update
        UPDATE dosen
        SET nama_dosen = nama_dos, alamat_dosen = alamat_dos
        WHERE kode_dosen = kode_dos;
    ELSE
        -- Jika dosen belum ada, lakukan insert
        INSERT INTO dosen (kode_dosen, nama_dosen, alamat_dosen)
        VALUES (kode_dos, nama_dos, alamat_dos);
    END IF;
END //

DELIMITER ;


CALL `upsertDosen`(11, 'marut', 'Jl. Jombang');

DELIMITER //

CREATE PROCEDURE ups(IN kode_dos INT(10), IN nama_dos VARCHAR(100), IN alamat_dos VARCHAR(100))
BEGIN
        UPDATE dosen
        SET nama_dos = nama_dos, alamat_dos = alamat_dos
        WHERE kode_dos = kode_dos;
    END //
DELIMITER ;

CALL ups(, 'marut', 'Jl. Jombang');