﻿USE MASTER 
GO
CREATE DATABASE BAI2
GO
DROP DATABASE IF EXISTS BAI2
CREATE DATABASE BAI2
GO

USE BAI2 
GO 

CREATE TABLE HOCKY
(
	HK NVARCHAR(10) PRIMARY KEY,
	GHICHU NVARCHAR(50)
)
GO
CREATE TABLE LOP 
(
	MALOP NVARCHAR(10) PRIMARY KEY,
	TENLOP VARCHAR(50)
)
GO
CREATE TABLE MONHOC
(
	MAMON NVARCHAR(10) PRIMARY KEY,
	TENMON NVARCHAR(50),
	SOTIET INT
)
GO
CREATE TABLE HOCSINH 
(
	MAHS NVARCHAR(10) PRIMARY KEY,
	HOHS NVARCHAR(30),
	TENHS NVARCHAR(30),
	NGAYSINH DATE,
	NOISINH NVARCHAR(50),
	MALOP NVARCHAR(10),
	NU BIT 
)
GO
CREATE TABLE DIEMTHI
(
	MAHS NVARCHAR(10) ,
	MAMON NVARCHAR(10),
	HK NVARCHAR(10),
	DIEMLAN1 INT,
	GHICHU NVARCHAR(50),
	DIEMLAN2 INT,
	PRIMARY KEY (MAHS,MAMON,HK)
)
ALTER TABLE DIEMTHI
ADD
CONSTRAINT FK_DIEMTHI_HOCKY
FOREIGN KEY (HK)
REFERENCES HOCKY(HK)
GO
ALTER TABLE DIEMTHI
ADD
CONSTRAINT FK_DIEMTHI_HOCSINH
FOREIGN KEY (MAHS)
REFERENCES HOCSINH(MAHS)
GO
ALTER TABLE DIEMTHI
ADD
CONSTRAINT FK_DIEMTHI_MONHOC
FOREIGN KEY (MAMON)
REFERENCES MONHOC(MAMON)
GO
ALTER TABLE HOCSINH
ADD
CONSTRAINT FK_HOCSINH_LOP
FOREIGN KEY (MALOP)
REFERENCES LOP(MALOP)
GO
