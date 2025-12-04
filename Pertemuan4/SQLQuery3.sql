USE KampusDB;

-- Cross join
-- Menampilkan semua kombinasi Mahasiswa dan Matakuliah 
SELECT NamaMahasiswa FROM Mahasiswa 
SELECT NamaMk FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMk
FROM Mahasiswa AS M
CROSS Join MataKuliah AS MK;

-- Menampilkan semuah kombinasi dosen dan ruangan
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
CROSS Join Ruangan R;

-- LEFT JOIN 
-- Menampilkan semua mahasiswa termasuk yang belum mengambil KRS
SELECT M.NamaMahasiswa, K.matakuliahID
FROM Mahasiswa M
LEFT Join KRS K ON M.MahasiswaID = K.MahasiswaID;

-- Menampilkan Semua mata kuliah, termasuk yang belum punya jadwal
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
LEFT Join JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

-- RIGHT Join
-- Menampilkan semuah jadwal, walaupun tidak ada matakuliah
SELECT MK.NamaMK, J.Hari
FROM Matakuliah MK
RIGHT Join JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

-- Menampilkan semuah ruangan, apakah dipakai di jadwal atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
RIGHT Join Ruangan R ON J.RuanganID = R.RuanganID;

-- INNER JOIN 
-- Menampilkan nama mahasiswa dan matakuliahnya, tapi melalui tabel KRS
SELECT*FROM Mahasiswa
SELECT*FROM KRS 
SELECT*FROM MataKuliah 

SELECT M.NamaMahasiswa, MK.NamaMk
FROM KRS K
INNER Join Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER Join MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID

-- Menampilkan mata kuliah dan pengampunya
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK 
Join Dosen D ON MK.DosenID = D.DosenID;

-- Menampilkan jadwal lengkap 
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J 
INNER Join MataKuliah MK ON J.MataKuliahID = Mk.MataKuliahID
INNER Join Dosen D ON J.DosenID = D.DosenID
INNER Join Ruangan R ON J.RuanganID = R.RuanganID;

-- Menampilkan nama mahasiswa, matkul,dan nilai akhirnya 
SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
FROM Nilai N 
INNER Join Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER Join Matakuliah MK ON N.MataKuliahID = MK.MataKuliahID;

-- Menampilkan dosen dan matakuliah yang dia ajar 
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER Join MataKuliah Mk ON D.DosenID = MK.DosenID;

-- Menampilkan nama mahasiswa dan nilai akhirnya 
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M 
INNER Join Nilai N ON M.MahasiswaID = N.MahasiswaID;

-- SELF Join 
-- Mencari pasangan mahasiswa dari prodi yang sama 
SELECT A.NamaMahasiswa AS Mahasiswa1, 
       B.NamaMahasiswa AS Mahasiswa2,
       A.Prodi 
FROM Mahasiswa A
INNER Join Mahasiswa B ON A.Prodi = B.Prodi 
WHERE A.MahasiswaID < B.MahasiswaID; -- AGAR gaada pasangan yang sama  dan jika tidak menggunakan WHERE Akan Menampilkan semuahnya

-- Latihan 
--1.Tampilkan nama mahasiswa (NamaMahasiswa) beserta prodi-nya (Prodi) dari tabel Mahasiswa,tetapi hanya mahasiswa yang memiliki nilai di tabel Nilai.
SELECT M.NamaMahasiswa, M.Prodi
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--2.Tampilkan nama dosen(NamaDosen) dan ruangan(KodeRuangan) tempat dosen tersebut mengajar
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
INNER JOIN JadwalKuliah J ON D.DosenID = J.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--3.Tampilkan daftar mahasiswa (NamaMahasiswa) yang mengambil suatu mata kuliah(NamaMK) beserta nama mata kuliah dan dosen pengampu-nya(NamaDosen)
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

--4.Tampilkan jadwal kuliah berisi nama mata kuliah(NamaMK), nama dosen(NamaDosen), dan hari kuliah(Hari) tetapi tidak perlu menampilkan ruangan.
SELECT MK.NamaMK, D.NamaDosen, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID;

--5. Tampilkan nilai mahasiswa(NilaiAkhir) lengkap dengan nama mahasiswa(NamaMahasiswa) nama mata kuliah (NamaMK) , nama dosen pengampu(NamaDosen) dan nilai akhirnya(NilaiAkhir)
SELECT 
    M.NamaMahasiswa,
    MK.NamaMK,
    D.NamaDosen,
    N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;



 