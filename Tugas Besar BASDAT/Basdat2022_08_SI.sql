CREATE DATABASE Kantin

CREATE TABLE Informasi_penghubung_Mahasiswa (
    NIM varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM),
    Jalan varchar (30),
    kode_pos varchar (5) FOREIGN KEY REFERENCES KODE_POS_MAHASISWA(KODE_POS),
    No_Telp varchar (15)
)

Select * from Informasi_penghubung_Mahasiswa

CREATE TABLE KODE_POS_MAHASISWA (
    KODE_POS varchar (5) PRIMARY KEY NOT NULL,
    Kabupaten varchar (30)
)

SELECT * FROM KODE_POS_MAHASISWA


CREATE TABLE TELP_KEASRAMAAN (
    ID_keasramaan varchar (8) FOREIGN KEY REFERENCES Identitas_Nama_keasrmaan(ID_keasramaan),
    NO_Telp varchar (15)
)
SELECT * FROM TELP_KEASRAMAAN

CREATE TABLE Identitas_Nama_keasrmaan (
    ID_keasramaan varchar (8) PRIMARY KEY NOT NULL,
    Nama_Depan varchar (15),
    Nama_Belakang varchar (15)
)
SELECT * FROM Identitas_Nama_keasrmaan

CREATE TABLE Identitas_Email_Keasramaan (
    ID_Keasrmaan varchar (8) FOREIGN KEY REFERENCES Identitas_Nama_Keasrmaan(ID_keasramaan),
    Email_Keasramaan varchar (30)
)
SELECT * FROM Identitas_Email_Keasramaan

CREATE TABLE ASRAMA (
    ID_Keasramaan varchar (8) FOREIGN KEY REFERENCES Identitas_Nama_Keasrmaan(ID_Keasramaan),
    NIM_Mahasiswa varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM)
)
SELECT * FROM ASRAMA

CREATE TABLE Identitas_Mahasiswa (
    NIM varchar (8) PRIMARY KEY NOT NULL,
    Email_akademik varchar (30),
    Nama_Depan VARCHAR (15),
    Nama_Belakang varchar (15),
    Tahun_angkatan varchar (4)
)

select * from Identitas_Mahasiswa

CREATE TABLE Tempat_Makan_Mahasiswa (
    NIM varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM),
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin),
    Nama_Depan varchar (15),
    Nama_Belakang varchar (15)
)

ALTER TABLE Tempat_Makan_Mahasiswa
ADD No_Telpon varchar (15) ;

select * from Tempat_Makan_Mahasiswa

CREATE TABLE Kantin_Mahasiswa (
    Kode_kantin varchar (4) PRIMARY KEY NOT NULL,
    Nama_lantai varchar (9) 
)

select * from Kantin_Mahasiswa

CREATE TABLE Kelompok_Piket_Kantin (
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin),
    No_Kelompok varchar (2) PRIMARY KEY NOT NULL
)

select * from Kelompok_Piket_Kantin

CREATE TABLE Jadwal_Piket (
    No_Kelompok varchar (2) FOREIGN KEY REFERENCES Kelompok_Piket_Kantin(No_Kelompok),
    NIM varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM),
    Nama_depan varchar (15),
    Nama_belakang varchar (15),
    jam_piket varchar (10),
)
SELECT * FROM Jadwal_Piket

CREATE TABLE Kordinator_kantin (
    ID_koordinator varchar (8) PRIMARY KEY NOT NULL,
    Nama_depan varchar (15),
    Nama_belakang varchar (15)
)

select * from Kordinator_kantin


CREATE TABLE NO_Telp_Koordinator (
    NO_Telpon_Koordinator varchar (15),
    ID_koordinator varchar (8) FOREIGN KEY REFERENCES Kordinator_kantin(ID_koordinator)
)


SELECT * FROM NO_Telp_Koordinator

CREATE TABLE Daftar_Menu_Makan (
    Kode_Menu varchar (2) PRIMARY KEY NOT NULL,
    Lauk varchar (30),
    Buah varchar (20),
    Sayur varchar (25)
)

EXEC sp_rename Daftar_Menu_Makan, Menu_makan_mahasiswa
select * from Menu_makan_mahasiswa

CREATE TABLE Pengesahan_Menu_Makan (
    Kode_Menu varchar (2) FOREIGN KEY REFERENCES Daftar_Menu_Makan(Kode_Menu),
    ID_Koordinator varchar (8) FOREIGN KEY REFERENCES Kordinator_kantin(ID_koordinator)
)
SELECT * FROM Pengesahan_Menu_Makan

CREATE TABLE Uang_Makan (
    NIM varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM),
    Kode_Pembayaran varchar (9) PRIMARY KEY NOT NULL,
    Tanggal_Mulai DATETIME,
    Tanggal_berakhir DATETIME
)
SELECT * FROM Uang_Makan

CREATE TABLE Staff_Kantin (
    Id_Staff varchar (8) PRIMARY KEY NOT NULL,
    TTL varchar (12),
    Nama_Depan varchar (15),
    Nama_Belakang varchar (15),
    Gender varchar (12)
)
SELECT * FROM Staff_Kantin

CREATE TABLE Juru_masak (
    ID_Staff varchar (8) FOREIGN KEY REFERENCES Staff_kantin(Id_Staff),
    Tamatan varchar (3),
    Bidang_Kerja varchar (12),
    TTL varchar (12),
    Nama_depan varchar (15),
    Nama_belakang varchar (15),
    Gender varchar (12)
)

ALTER TABLE Juru_masak
ALTER COLUMN Bidang_Kerja varchar(25)
SELECT * FROM Juru_masak

CREATE TABLE Ahli_Gizi (
    ID_Staff varchar (8) FOREIGN KEY REFERENCES Staff_kantin(Id_Staff),
    Tamatan_Institusi varchar (3),
    Bidang_Kerja varchar (12),
    TTL varchar (12),
    Nama_depan varchar (15),
    Nama_belakang varchar (15),
    Gender varchar (12)
)

ALTER TABLE Ahli_Gizi
ALTER COLUMN Tamatan_Institusi varchar(30)

ALTER TABLE Ahli_Gizi
ALTER COLUMN Bidang_Kerja varchar(60)
SELECT * FROM Ahli_Gizi


CREATE TABLE Chef (
    ID_Staff varchar (8) FOREIGN KEY REFERENCES Staff_kantin(Id_Staff),
    Gelar varchar (10),
    Lama_Pengalaman_Kerja varchar (12),
    TTL varchar (12),
    Nama_depan varchar (15),
    Nama_belakang varchar (15),
    Gender varchar (12)
)
SELECT * FROM Chef

CREATE TABLE Denah_duduk (
    NO_Duduk varchar (2) PRIMARY KEY NOT NULL,
    Nama_Depan varchar (15),
    Nama_Belakang varchar (15),
    NIM varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM),
    Gender varchar (12),
    Prodi varchar (8)
)
SELECT * FROM Denah_duduk

CREATE TABLE Jadwal_tugas_ketertiban (
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin),
    tempat_bertugas varchar (20),
    Waktu_bertugas varchar (40),
    NIM_Ketertiban varchar(15),
    Nama_Lantai varchar (20)
)

ALTER TABLE Jadwal_tugas_ketertiban
ALTER COLUMN tempat_bertugas varchar(50)

ALTER TABLE Jadwal_tugas_ketertiban
ALTER COLUMN Waktu_bertugas varchar(20)
SELECT * FROM Jadwal_tugas_ketertiban


CREATE TABLE Roster_makan (
    Kode_jadwal varchar (2) PRIMARY KEY NOT NULL,
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin)
)
SELECT * FROM Roster_makan

CREATE TABLE Jadwal_Makan(
    Kode_Jadwal_Makan varchar (2) FOREIGN KEY REFERENCES Roster_makan(Kode_jadwal),
    Hari varchar (10),
    Jam_Mulai Varchar (25),
    Jam_Berakhir Varchar (25)
)
SELECT * FROM Jadwal_Makan


CREATE TABLE Supplier (
    Kode_supplier varchar (7) PRIMARY KEY NOT NULL,
    Nama_depan varchar (15),
    Nama_Belakang varchar (15),
    Alamat varchar (25),
    Tanggal_input varchar (12)
)
SELECT * FROM Supplier

CREATE TABLE Bahan_Baku (
    Kode_supplier varchar (7) FOREIGN KEY REFERENCES Supplier(Kode_supplier),
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin)
)
SELECT * FROM Bahan_Baku

CREATE TABLE Roster_Menu (
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin),
    Kode_Menu varchar (2) FOREIGN KEY REFERENCES Daftar_Menu_Makan(Kode_menu)
)
SELECT * FROM Roster_Menu

CREATE TABLE Pengelolaan (
    Kode_menu varchar (2) FOREIGN KEY REFERENCES Daftar_Menu_Makan(Kode_menu),
    ID_Staff varchar (8) FOREIGN KEY REFERENCES Staff_Kantin(Id_Staff)
)
SELECT * FROM Pengelolaan

CREATE TABLE Pihak_Ketertiban (
    NIM varchar (8) FOREIGN KEY REFERENCES Identitas_Mahasiswa(NIM),
    Nama_depan varchar (15),
    Nama_belakang varchar (15),
    Prodi varchar (25),
    Angkatan varchar (4)
)

SELECT * FROM Pihak_Ketertiban

CREATE TABLE Kantin_Baru (
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin),
    Warna_Kantin varchar (10),
    Nama_Lantai varchar (10)
)
SELECT * FROM Kantin_Baru

CREATE TABLE Kantin_Lama (
    Kode_kantin varchar (4) FOREIGN KEY REFERENCES Kantin_Mahasiswa(Kode_kantin),
    Ukuran_kantin varchar (6),
    Nama_Lantai varchar (10)
)
SELECT * FROM Kantin_Lama

Insert into KODE_POS_MAHASISWA(KODE_POS, Kabupaten) 
VALUES ('22475', 'Tapanuli Selatan'),
        ('42251', 'Simalungun'),
        ('57810', ' Toba' ),
        ('73212', 'Deliserdang'),
        ('61789', 'Asahan')
Insert into KODE_POS_MAHASISWA(KODE_POS, Kabupaten) 
VALUES ('21214', 'Batu Bara'),
        ('52353', 'Dairi'),
        ('86435', 'Nias')

INSERT INTO Identitas_Mahasiswa (NIM, Email_akademik, Nama_Depan, Nama_Belakang, Tahun_angkatan)
VALUES ('13321001', 'alexandro@gmail.com', 'Alexandro', 'Hutabarat', '2021'),
        ('13321002', 'Thaliasa1@gmail.com','Thalia', 'Saragih', '2021'),
        ('13321003', 'SintaSimbolon@gmail.com', 'Sinta', 'Simbolon', '2021'),
        ('13321004', 'Abelina12@gmail.com', 'Abelina', 'Sitorus', '2021'),
        ('13321005', 'FrengkyMa45@gmail.com', 'Frenky', 'Manihuruk', '2021'),
        ('13321006', 'JeftaManurung2@gmail.com', 'Jefta', 'Manurung', '2021'),
        ('13321007', 'albert@gmail.com', 'Albert', 'Panggabean', '2021'),
        ('13321008', 'Dion111@gmail.com', 'Dion', 'Sagala', '2021')

INSERT INTO Identitas_Mahasiswa (NIM, Email_akademik, Nama_Depan, Nama_Belakang, Tahun_angkatan)
VALUES ('12S21018', 'Wilman@gmail.com', 'William','Manik', '2020'),
        ('11S21008', 'Bobbysgn@gmail.com','Boby','Siagian', '2020'),
        ('13321021', 'Samhtg@gmail.com', 'Samuel','Sihotang', '2020'),
        ('21S21004', 'Shelman@gmail.com','Sheila','Panggabean', '2020'),
        ('11321065', 'Agnessbr@gmail.com','Agnes','Siburian', '2020'),
        ('31S87364', 'kartikadapdap@gmail.com','Kartika','Nadapdap', '2020'),
        ('87463928', 'syahrinicantik@gmail.com','Syahrini','Simangunsong', '2020'),
        ('29482H37', 'Aisyahkhol@gmail.com','Aisya','Manik', '2020')


INSERT INTO Informasi_penghubung_Mahasiswa(NIM,Jalan,kode_pos,No_Telp)
VALUES ('13321001', 'Cuk Yak dien.No1', '22475', '+6283264527280'),
        ('13321001', 'Cuk Yak dien.No1', '22475','+6286543017365'),
        ('13321002', 'Gg.Merpati', '42251', '+6281263922729'),
        ('13321003', 'Sisimangaraja', '57810', '+6281288436291'),
        ('13321003', 'Sisimangaraja', '57810', '+6285384716384'),
        ('13321004', 'subang', '73212', '+6285267898922'),
        ('13321005', 'Edy raya', '61789', '+6282182912792'),
        ('13321006', 'salak', '21214', '+6283184252830'),
        ('13321006', 'salak', '21214', '+6286492749264'),
        ('13321007', 'Madiun', '52353', '+6282100876312'),
        ('13321008', 'salatiga', '86435', '+6281276559933'),
        ('13321008', 'salatiga', '86435', '+6284726401847')

INSERT INTO Identitas_Nama_keasrmaan (ID_keasramaan, Nama_Depan, Nama_Belakang)
VALUES ('3217318', 'Timur', 'Hutagalung'),
        ('8687213', 'Elsa', 'Panggabean'),
        ('5637630', 'Febby', 'Sirait'),
        ('8363791', 'Triana', 'Sitorus'),
        ('6349809', 'Yosua', 'Hutagaol')

INSERT INTO Identitas_Email_Keasramaan 
VALUES ('3217318', 'Timur08@gmail.com'),
        ('8687213', 'Elsa06@gmail.com'),
        ('5637630', 'Febby864@gmail.com'),
        ('8363791', 'Trianahgd56@gmail.com'),
        ('6349809', 'Yosuaa64@gmail.com')

INSERT INTO TELP_KEASRAMAAN 
VALUES ('3217318', '+6282145673245'),
        ('3217318', '+6283648736296'),
        ('8687213', '+6281289025632'),
        ('5637630', '+6285265328759'),
        ('5637630', '+6282648163540'),
        ('8363791', '+6282175921242'),
        ('6349809', '+621256729085'),
        ('6349809', '+626482647392')

INSERT INTO ASRAMA 
VALUES ('3217318', '13321001'),
        ('8687213','13321002'),
        ('5637630', '13321003'),
        ('5637630', '13321004'),
        ('6349809', '13321005'),
        ('6349809', '13321006'),
        ('6349809', '13321007'),
        ('3217318', '13321008')

INSERT INTO Kantin_Mahasiswa
VALUES ('A123', 'Lantai 1'),
        ('A456', 'Lantai 2'),
        ('A789', 'Lantai 1'),
        ('B098', 'Lantai 2'),
        ('B765', 'Lantai 1'),
        ('B432', 'Lantai 2'),
        ('C456', 'Lantai 1'),
        ('B789', 'Lantai 2')

INSERT INTO Tempat_Makan_Mahasiswa
VALUES ('13321001', 'A123', 'Alexandro', 'Hutabarat', '+6283264527280'),
        ('13321001', 'A123', 'Alexandro', 'Hutabarat', '+6286543017365'),
        ('13321002', 'A456', 'Thalia', 'Saragih', '+6281263922729'),
        ('13321003', 'A789', 'Sinta', 'Simbolon', '+6281288436291'),
        ('13321003', 'A789', 'Sinta', 'Simbolon', '+6285384716384'),
        ('13321004', 'B098', 'Abelina', 'Sitorus', '+6285267898922'),
        ('13321005', 'B765', 'Frengky', 'Manihuruk', '+6282182912792'),
        ('13321006', 'B432', 'Jefta', 'Manurung', '+6283184252830'),
        ('13321006', 'B432', 'Jefta', 'Manurung', '+6286492749264'),
        ('13321007', 'C456', 'Albert', 'Panggabean', '+6282100876312'),
        ('13321008', 'B789', 'Dion', 'Sagala', '+6281276559933'),
        ('13321008', 'B789', 'Dion', 'Sagala', '+6284726401847')

INSERT INTO Menu_makan_mahasiswa
VALUES ('67', 'Ikan mas', 'Jeruk', 'Sayur Putih'),
        ('32', 'Ayam', 'Jambu', 'Bayam'),
        ('43', 'Ikan gambus', 'Pisang', 'Toge'),
        ('12', 'Ikan Teri', 'Rambutan', 'Sayur putih'),
        ('90', 'Ikan salam', 'Pepaya', 'Pakcoi'),
        ('45', 'Tahu', 'Apel', 'Kol'),
        ('86', 'Telur', 'Bengkuang', 'Urap'),
        ('98', 'Ikan Lele', 'Pir', 'Kacang Panjang')
        
INSERT INTO Kordinator_kantin 
VALUES ('67192639', 'Naomi', 'Lumbanraja'),
        ('57462133', 'Jaden', 'Siagian'),
        ('82910374', 'Marthin', 'Hutauruk'),
        ('56473291', 'Widya', 'Manurung'),
        ('37381001', 'Elshaday', 'Simamora'),
        ('77288192', 'Estomihi', 'Pangaribuan'),
        ('41241216', 'Endang', 'Siregar'),
        ('24143413', 'Karina', 'Situmorang')

INSERT INTO Pengesahan_Menu_Makan 
VALUES ('67', '67192639'),
        ('32', '57462133'),
        ('43', '82910374'),
        ('12', '56473291'),
        ('90', '37381001'),
        ('45', '77288192'),
        ('86', '41241216'),
        ('98', '24143413')

INSERT INTO Uang_Makan
VALUES ('13321001', '898382392', ' 01 November 2022', '11/11/2022'),
        ('13321002', '723291033', ' 01 November 2022', '11/11/2022'),
        ('13321003', '790532959', ' 01 November 2022', '11/11/2022'),
        ('13321004', '428933322', ' 01 November 2022', '11/11/2022'),
        ('13321005', '291322835', ' 01 November 2022', '11/11/2022'),
        ('13321006', '469184911', ' 01 November 2022', '11/11/2022'),
        ('13321007', '457491401', ' 01 November 2022', '11/11/2022'),
        ('13321008', '684234191', ' 01 November 2022', '11/11/2022')

INSERT INTO Kelompok_Piket_Kantin
VALUES ('A123', '1'),
        ('A456', '2'),
        ('A789', '3'),
        ('B098', '4'),
        ('B765', '5'),
        ('B432', '6'),
        ('C456', '7'),
        ('B789', '8')

INSERT INTO NO_Telp_Koordinator
VALUES ('0821 7638 1232', '67192639'),
        ('0853 8271 8472', '67192639'),
        ('0812 7583 9073', '57462133'),
        ('0852 6743 1242', '82910374'),
        ('0832 1321 7932', '56473291'),
        ('0853 8274 6391', '56473291'),
        ('0812 7211 5546', '37381001'),
        ('0883 7203 8471', '37381001'),
        ('0811 7913 6321', '77288192'),
        ('0854 0211 2344', '41241216'),
        ('0863 5283 7462', '41241216'),
        ('0865 2881 3211', '24143413')

INSERT INTO Jadwal_Piket
VALUES ('1', '13321001','Alexandro', 'Hutabarat','06.30 WIB'),
        ('2', '13321002','Thalia', 'Saragih','06.30 WIB'),
        ('3', '13321003','Sinta', 'Simbolon','06.30 WIB'),
        ('4', '13321004','Abelina', 'Sitorus','06.30 WIB'),
        ('5', '13321005','Frengky', 'Manihuruk','06.30 WIB'),
        ('6', '13321006','Jefta', 'Manurung','06.30 WIB'),
        ('7', '13321007','Albert', 'Panggabean','06.30 WIB'),
        ('8', '13321008','Dion', 'Sagala','06.30 WIB')

INSERT INTO Staff_Kantin
VALUES ('56677122', '21/04/1989', 'Aldi', 'Simamora', 'Laki-laki'),
        ('54328192', '06/01/1985', 'Mutiara', 'Simanjuntak', 'Perempuan'),
        ('72312821', '21/04/1989', 'Kaleb', 'Panjaitan', 'Laki-laki'),
        ('90855432', '04/04/1983', 'Samuel', 'Siagian', 'Laki-laki'),
        ('82924432', '19/11/1991', 'Nessy', 'Pangaribuan', 'Perempuan'),
        ('65322342', '25/10/1991', 'Junita', 'Silaban', 'Perempuan'),
        ('74923041', '15/11/1982', 'Horas', 'Hutagalung', 'Laki-laki'),
        ('64706335', '26/08/1987', 'Jesica', 'Zalukku', 'Perempuan')

INSERT INTO Juru_masak
VALUES ('56677122', 'SMA', 'Penyapu', '10/12/1974','Suti','Nadapdap','Perempuan'),
        ('56677122', 'SMA', 'Pengepel', '10/12/1974','Suti','Nadapdap','Perempuan'),
        ('72312821', 'SMP', 'Lap meja', '30/05/1953','Rizal','Sipahutar','Laki-Laki'),
        ('54328192', 'SMP', 'Pembersih kaca', '18/08/1990','Basri','Gultom','Laki-Laki'),
        ('54328192', 'SMP', 'Penyapu', '18/08/1990','Basri','Gultom','Laki-Laki'),
        ('90855432', 'SD', 'Lap meja', '20/01/2000','Nada','Harianja','Laki-Laki'),
        ('90855432', 'SD', 'Pengepel', '20/01/2000','Nada','Harianja','Laki-Laki'),
        ('82924432', 'SMA', 'Penyapu', '10/12/1974','Iren','Siallagan','Perempuan'),
        ('82924432', 'SMA', 'Lap Kaca', '10/12/1974','Iren','Siallagan','Perempuan'),
        ('65322342', 'SMA', 'Pencuci Ompreng', '19/02/1997','Sri','Siburian','Perempuan'),
        ('65322342', 'SMA', 'Pencuci Kain Lap', '19/02/1997','Sri','Siburian','Perempuan'),
        ('74923041', 'SD', 'Pembersih Asbes', '09/06/1945','Vanesa','Pasaribu','Perempuan'),
        ('74923041', 'SD', 'Pencuci Ompreng', '09/06/1945','Vanesa','Pasaribu','Perempuan'),
        ('64706335', 'SMP', 'Pencuci Kain Lap', '31/01/1994','Rska','Ambarita','Laki-Laki'),
        ('64706335', 'SMP', 'Lap Meja', '31/01/1994','Rska','Ambarita','Laki-Laki')

INSERT INTO Ahli_Gizi
VALUES ('56677122', 'IKTBN', 'Memberikan pelayanan konsultasi gizi', '10/12/1974', 'Suti', 'Nadapdap', 'Perempuan'),
        ('56677122', 'IKTBN', 'Pemastian tingkat protein', '10/12/1974', 'Suti', 'Nadapdap', 'Perempuan'),
        ('56677122', 'MFA', 'Pemastian tingkat protein', '10/12/1974', 'Suti', 'Nadapdap', 'Perempuan'),
        ('56677122', 'MFA', 'Memberikan pelayanan konsultasi gizi', '10/12/1974', 'Suti', 'Nadapdap', 'Perempuan'),
        ('72312821', 'KYPJ', 'edukasi gizi', '30/05/1953', 'Rizal', 'Sipahutar', 'Laki-Laki'),
        ('72312821', 'KYPJ', 'tata cara diet', '30/05/1953', 'Rizal', 'Sipahutar', 'Laki-Laki'),
        ('72312821', 'FIM', 'edukasi gizi', '30/05/1953', 'Rizal', 'Sipahutar', 'Laki-Laki'),
        ('72312821', 'FIM', 'tata cara diet', '30/05/1953', 'Rizal', 'Sipahutar', 'Laki-Laki'),
        ('54328192', 'GIATMARA HULU LANGAT', 'Merubah dan merancang susunan diet', '18/08/1990', 'Basri', 'Gultom', 'Laki-Laki'),
        ('90855432', 'SG ACADEMY', 'Menentukan status gizi kesehatan', '20/01/2000', 'Nada', 'Harianja','Laki-Laki'),
        ('82924432', 'ACCELSKILL ACADEMY', 'Mengkaji kebutuhan nutrisi', '27/03/1991', 'Iren', 'Siallagan', 'Perempuan'),
        ('65322342', 'KAGUMAS CULINARY ACADEMY', 'Memberi informasi mengenai prinsip gizi', '19/02/1997', 'Sri', 'Siburian', 'Perempuan'),
        ('74923041', 'UNIVERSITY TAYLOR’S', 'pemantauan gizi', '09/06/1945', 'Vanesa', 'Pasaribu', 'Perempuan'),
        ('64706335', 'MSU', 'status gizi', '31/01/1994','Riska','Ambarita', 'Laki-Laki'),
        ('64706335', 'MSU', 'persiapan dan pilihan makanan', '31/01/1994','Riska','Ambarita', 'Laki-Laki'),
        ('64706335', 'UHAMKA', 'status gizi', '31/01/1994','Riska','Ambarita', 'Laki-Laki'),
        ('64706335', 'UHAMKA', 'persiapan dan pilihan makanan', '31/01/1994','Riska','Ambarita', 'Laki-Laki')

INSERT INTO CHEF
VALUES ('56677122', 'A.Md.A.B.', '6 tahun', '10/12/1974', 'Suti', 'Nadapdap', 'Perempuan'),
        ('72312821', 'S.Tr.A.B.', '3 tahun', '30/05/1953', 'Rizal','Sipahutar', 'Laki-Laki'),
        ('54328192', 'M.A.B.', '8 tahun', '18/08/1990', 'Basri', 'Gultom', 'Laki-Laki'),
        ('90855432', 'S.A.B', '10 tahun', '20/01/2000', 'Nada', 'Harianja', 'Laki-Laki'),
        ('82924432', 'S.Tr.Bns.', '15 tahun', '27/03/1991', 'Iren', 'Siallagan', 'Perempuan'),
        ('65322342', 'A.Md.Bns.', '9 tahun', '19/02/1997', 'Sri', 'Siburian', 'Perempuan'),
        ('74923041', 'S.Bns.', '12 tahun', '09/06/1945', 'Vanesa', 'Pasaribu', 'Perempuan'),
        ('64706335', 'A.Md.A.B.', '20 tahun', '31/01/1994', 'Riska', 'Ambarita', 'Laki-Laki')


INSERT INTO Denah_duduk
VALUES ('1A', 'Alexandro','Hutabarat', '13321001', 'Laki-Laki', 'D3 TI'),
        ('1B', 'Thalia', 'Saragih', '13321002', 'Perempuan', 'S1 SI'),
        ('1C', 'Sinta', 'Simbolon', '13321003', 'Perempuan', 'S1 IF'),
        ('2A', 'Abelina', 'Sitours' ,'13321004', 'Perempuan', 'S1 MR'),
        ('2B', 'Frengky', 'Manihuruk' ,'13321005', 'Laki-Laki', 'S1 TE'),
        ('2C', 'Jefta', 'Manurung', '13321006', 'Perempuan', 'D3 TK'),
        ('3A', 'Albert', 'Panggabean' ,'13321007', 'Laki-Laki', 'D4 TRPL'),
        ('3B','Dion','Sagala','13321008','Laki-Laki','S1 TB')

INSERT INTO Jadwal_tugas_ketertiban 
VALUES ('A123', 'Kantin 1 Lantai 1', '06.45 WIB','12S21018', 'Lantai Bawah'),
        ('A456', 'Kantin 1 Lantai 2', '12.00 WIB', '11S21008', 'Lantai Atas'),
        ('A789', 'Kantin 2 Lantai 1', '18.45 WIB', '13321021', 'Lantai Bawah'),
        ('B098', 'Kantin 2 Lantai 2', '07.00 WIB', '21S21004', 'Lantai Atas'),
        ('B765', 'Kantin Tengah Lantai 1', '12.15 WIB', '11321065', 'Lantai Bawah'),
         ('B432', 'Kantin Belakang Lantai 2', '19.00 WIB', '31S87364', 'Lantai Atas'),
         ('C456', 'Kantin Lama Lantai 1', '07.05 WIB', '87463928', 'LantaiAtas'),
         ('B789', 'Kantin Lama Lantai 2', '12.05 WIB', '29482H37', 'Lantai Bawah')

INSERT INTO Roster_makan
VALUES ('A1', 'A123'),
        ('A2', 'A456'),
        ('B1', 'A789'),
        ('B2', 'B098'),
        ('C1', 'B765'),
        ('C2', 'B432'),
        ('D1', 'C456'),
        ('D2', 'B789')

INSERT INTO Jadwal_Makan
VALUES ('A1', 'Senin', '07.00', '07.30'),
        ('A2', 'Selasa', '07.15', '07.45'),
        ('B1', 'Rabu', '07.00', '07.30'),
        ('B2', 'Kamis', '07.00', '07.30'),
        ('C1', 'Jumat', '07.15', '07.45'),
        ('C2', 'Senin', '07.00', '07.30'),
        ('D1', 'Selasa', '07.15', '07.45'),
        ('D2', 'Rabu', '07.00', '07.30')

INSERT INTO Supplier
VALUES ('JK12', 'Jusas','Budiman', 'Tugu Payung', '21/09/2022'),
        ('KP42', 'Sitogab','Jefri', 'Tangga Batu', '18/09/2022'),
        ('GH54', 'Walker','Naibaho', 'Atas barita', '25/09/2022'),
        ('YT42', 'William','Sukijat', 'Siaro', '12/09/2022'),
        ('NM32', 'Tio','Simanjuntak', 'Simpang Arjuna', '04/10/2022'),
        ('XC21', 'Dacci','Zalukku', 'Pintu Bosi', '01/10/2022'),
        ('IY80', 'Rebecca','Yuyun', 'Negeri Lonceng', '15/09/2022'),
        ('PO87', 'Boby','Sukamto', 'Laguboti', '28/09/2022')

INSERT INTO Bahan_Baku
VALUES ('JK12', 'A123'),
        ('KP42', 'A456'),
        ('GH54', 'A789'),
        ('YT42', 'B098'),
        ('NM32', 'B765'),
        ('XC21', 'B432'),
        ('IY80', 'C456'),
        ('PO87', 'B789')

INSERT INTO Roster_Menu
VALUES ('A123', '67'),
        ('A456', '32'),
        ('A789', '43'),
        ('B098', '12'),
        ('B765', '90'),
        ('B432', '45'),
        ('C456', '86'),
        ('B789', '43')

INSERT INTO Pengelolaan 
VALUES ('67', '56677122'),
        ('32', '72312821'),
        ('43', '54328192'),
        ('12', '90855432'),
        ('90', '82924432'),
        ('45', '65322342'),
        ('86', '74923041'),
        ('43', '64706335')

INSERT INTO Pihak_Ketertiban
VALUES ('12S21018', 'William','Manik', 'S1 Sistem informasi', '2020'),
        ('11S21008', 'Boby','Siagian', 'S1 Informatika', '2020'),
        ('13321021', 'Samuel','Sihotang', 'D3 Teknik informasi', '2021'),
        ('21S21004', 'Sheila','Panggabean', 'S1 Manajemen Rekayasa', '2019'),
        ('11321065', 'Agnes','Siburian', 'D3 Teknik Komputer', '2019'),
        ('31S87364', 'Kartika','Nadapdap', 'S1 Bioproses', '2020'),
        ('87463928', 'Syahrini','Simangunsong', 'DIV TRPL', '2021'),
        ('29482H37', 'Aisya','Manik', 'S1 Teknik Elektro', '2019')

INSERT INTO Kantin_Baru
VALUES ('A123', 'Hijau', 'Lantai 1'),
        ('A456', 'Kuning', 'Lantai 2'),
        ('A789', 'Merah', 'Lantai 1'),
        ('B098', 'Ungu', 'Lantai 2'),
        ('B765', 'Biru', 'Lantai 1'),
        ('B432', 'Abu-Abu', 'Lantai 2')

INSERT INTO Kantin_Lama
VALUES ('C456', 'Besar', 'lantai 1'),
        ('B789', 'kecil', 'lantai 2')

                                                            --T U G A S   T A M B A H A N--


                                                                --S E L E C T--
SELECT COUNT(DISTINCT Tahun_angkatan) FROM Identitas_Mahasiswa;

                                                                --U P D A T E-- 
UPDATE Supplier
SET Nama_Belakang = 'Manik'
WHERE Kode_supplier = 'YT42';

Select * from Identitas_Mahasiswa , Pihak_Ketertiban

                                                                -- S E T   O P E R A T O R S-- 
SELECT Nama_depan FROM Supplier
UNION ALL
SELECT nama_depan FROM Kordinator_kantin;

                                                                --A G G R E G A T E   F U N C T I O N--
SELECT 
    COUNT(Nama_depan)
FROM
    Identitas_Mahasiswa;

                                                                --N U L L   V A L U E--
SELECT nama_depan
FROM Supplier
WHERE Kode_supplier IS NOT NULL;


                                        --Q U E R Y I N G   M U L T I P L E   T A B L E S--

--Join
SELECT Identitas_Mahasiswa.NIM, Identitas_Mahasiswa.Nama_depan, Pihak_Ketertiban.Angkatan, Pihak_Ketertiban.Prodi  
FROM Identitas_Mahasiswa JOIN Pihak_Ketertiban ON Identitas_Mahasiswa.NIM = Pihak_Ketertiban.NIM;


SELECT Identitas_Nama_Keasrmaan.ID_keasramaan, Identitas_Nama_keasrmaan.Nama_Depan, Identitas_Email_Keasramaan.Email_Keasramaan
FROM Identitas_Nama_keasrmaan JOIN Identitas_Email_Keasramaan ON Identitas_Nama_keasrmaan.ID_keasramaan = Identitas_Email_Keasramaan.ID_Keasrmaan;

                                                            --N E S T E D   S U B Q U E R I E S--
UPDATE Pihak_Ketertiban
   SET Nama_Belakang = 'Manullang'
   WHERE NIM IN (SELECT NIM FROM Identitas_Mahasiswa
      WHERE NIM = '31S87364');

UPDATE NO_Telp_Koordinator
   SET NO_Telpon_Koordinator = '0822 9742 2654'
   WHERE ID_koordinator IN (SELECT ID_koordinator FROM Kordinator_kantin
      WHERE ID_koordinator = '82910374');

DELETE FROM NO_Telp_Koordinator
   WHERE ID_koordinator IN (SELECT ID_koordinator FROM Kordinator_kantin
      WHERE NO_Telp_Koordinator = '0853 8271 8472' );

                                                        --I M P L E M E N T I N G   V I E W S-- 

CREATE VIEW yourview AS
    SELECT Identitas_Mahasiswa.NIM,
    Pihak_Ketertiban.Nama_depan, 
    Pihak_Ketertiban.Prodi
FROM 
Identitas_Mahasiswa, Pihak_Ketertiban 
WHERE Identitas_Mahasiswa.NIM = Pihak_Ketertiban.NIM;

CREATE VIEW Dormview AS
    SELECT Identitas_Nama_keasrmaan.ID_keasramaan,
    Identitas_Nama_keasrmaan.Nama_Depan, 
    Identitas_Email_Keasramaan.Email_Keasramaan
FROM 
Identitas_Nama_keasrmaan, Identitas_Email_Keasramaan 
WHERE Identitas_Nama_keasrmaan.ID_keasramaan = Identitas_Email_Keasramaan.ID_Keasrmaan;

CREATE VIEW Discview AS
    SELECT Pihak_Ketertiban.NIM, Pihak_Ketertiban.Nama_depan,Pihak_Ketertiban.Prodi
FROM 
Pihak_Ketertiban
WHERE Pihak_Ketertiban.Nama_belakang = 'Manullang'

CREATE VIEW Phoneview AS
    SELECT NO_Telp_Koordinator.NO_Telpon_Koordinator, Kordinator_kantin.Nama_depan,Kordinator_kantin.Nama_belakang
FROM NO_Telp_Koordinator, Kordinator_kantin
WHERE Kordinator_kantin.ID_koordinator = '82910374'
DROP VIEW Phoneview

CREATE VIEW Koormview AS
    SELECT Kordinator_kantin.id_koordinator,
    Kordinator_kantin.Nama_Depan, 
    NO_Telp_Koordinator.NO_Telpon_Koordinator
FROM 
Kordinator_kantin, NO_Telp_Koordinator 
WHERE Kordinator_kantin.ID_koordinator = NO_Telp_Koordinator.ID_koordinator;

select * from yourview
SELECT * FROM Dormview
Select * from Discview
select * from Phoneview
select * from Koormview

                                                                        -- F U N C T I O N --

CREATE FUNCTION Yelling (
    @yell varchar (25)
)
RETURNS TABLE
AS
RETURN
        SELECT
            NIM,
            Nama_depan,
            Nama_belakang,
            Prodi,
            Angkatan
        FROM
            Pihak_Ketertiban
        WHERE
            Angkatan = @yell

SELECT * FROM Yelling('2019')
                                                                ---------------------------------------

CREATE FUNCTION Piket (
    @jadwal varchar (25)
)
RETURNS TABLE
AS
RETURN
        SELECT
            No_Kelompok
            NIM,
            Nama_depan,
            Nama_belakang,
            jam_piket
        FROM
            Jadwal_Piket
        WHERE
            No_Kelompok = @jadwal

SELECT * FROM Piket('3')


                                                                -- S T O R E D   P R O C E D U R E S --
                   

CREATE PROCEDURE Get_Name (
    
    @NIM varchar (8)

)

AS

BEGIN

SET NOCOUNT ON

SELECT M.Nama_Depan,M.Nama_Belakang,Kt.Prodi  FROM 

Identitas_Mahasiswa M

INNER JOIN Pihak_Ketertiban Kt ON M.NIM=Kt.NIM

WHERE M.NIM=@NIM

END

EXEC Get_Name '12S21018'

                                                                    ------------------------------------

CREATE PROCEDURE Get_Dorm_Phone (
    
    @ID varchar (8)

)

AS

BEGIN

SET NOCOUNT ON

SELECT Ks.Nama_Depan,Ks.Nama_Belakang,Nt.NO_Telp  FROM 

Identitas_Nama_keasrmaan Ks

INNER JOIN TELP_KEASRAMAAN Nt ON Ks.ID_keasramaan=Nt.ID_keasramaan

WHERE Ks.ID_keasramaan=@ID

END

EXEC Get_Dorm_Phone '3217318'



select * from Identitas_Mahasiswa