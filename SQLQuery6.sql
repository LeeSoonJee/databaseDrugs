﻿USE master
GO


CREATE DATABASE BA1
GO
DROP DATABASE IF EXISTS BA1
CREATE DATABASE BA1
GO


CREATE TABLE KHACHHANG
(
	MAKH NVARCHAR(5) PRIMARY KEY,
	TENKH NVARCHAR(30),
	DIACHI NVARCHAR(50),
	DT NVARCHAR(15),
	EMAIL NVARCHAR(30)
)
GO
CREATE TABLE VATTU
(
	MAVT NVARCHAR(5) PRIMARY KEY,
	TENVT NVARCHAR(30),
	DVT NVARCHAR(20),
	GIAMUA	FLOAT(20),
	SLTON FLOAT(20)
)
GO
CREATE TABLE HOADON
(
	MAHD NVARCHAR(5) PRIMARY KEY,
	NGAY DATE,
	MAKH NVARCHAR(5),
	TONGTG INT
)
GO
CREATE TABLE HOADONCHITIET
(
	MAHD NVARCHAR(5) ,
	MAVT NVARCHAR(5),
	SL FLOAT(20),
	KHUYENMAI FLOAT(20),
	GIABAN FLOAT(20),
	PRIMARY KEY (MAHD,MAVT)
)
GO
ALTER TABLE HOADON
ADD
CONSTRAINT FK_HOADON_KHACHHANG
FOREIGN KEY (MAKH)
REFERENCES KHACHHANG(MAKH)
GO

ALTER TABLE HOADONCHITIET
ADD
CONSTRAINT FK_HOADONCHITIET_HOADON
FOREIGN KEY (MAHD)
REFERENCES HOADON(MAHD)
GO

ALTER TABLE HOADONCHITIET
ADD
CONSTRAINT FK_HOADONCHITIET_VATTU
FOREIGN KEY (MAVT)
REFERENCES VATTU(MAVT)
GO