USE MASTER 
GO
 

CREATE DATABASE KHOHANG
GO

DROP DATABASE IF EXISTS KHOHANG
CREATE DATABASE KHOHANG 
GO

USE KHOHANG 
GO 

CREATE TABLE XUATHANG
(
	MA_HANG NCHAR(3),
	MA_NHA_CUNG_CAP NCHAR(3),
	PRIMARY KEY (MA_HANG,MA_NHA_CUNG_CAP)
)

GO
DROP TABLE XUATHANG

CREATE TABLE NHACUNGCAP
(
	MA_NHA_CUNG_CAP NCHAR(3) PRIMARY KEY,
	TEN_NHA_CUNG_CAP NVARCHAR(25),
	DIA_CHI NVARCHAR(25)
)
GO
DROP TABLE NHACUNGCAP
CREATE TABLE HANGHOA
(
	MA_HANG NCHAR(3) PRIMARY KEY,
	TEN_HANG	NVARCHAR(25) NULL,
	MAU  NVARCHAR(25) NULL,
	TRONG_LUONG INT NULL,
	NUOC_SAN_XUAT NVARCHAR(50) NULL
)
GO
DROP TABLE HANGHOA

ALTER TABLE XUATHANG
ADD
CONSTRAINT FK_XUATHANG_NHACUNGCAP
FOREIGN KEY (MA_NHA_CUNG_CAP)
REFERENCES NHACUNGCAP(MA_NHA_CUNG_CAP)
GO

ALTER TABLE XUATHANG
ADD
CONSTRAINT FK_XUATHANG_HANGHOA
FOREIGN KEY (MA_HANG)
REFERENCES HANGHOA(MA_HANG)
GO
DROP TABLE XUATHANG
DROP TABLE NHACUNGCAP


INSERT INTO NHACUNGCAP(MA_NHA_CUNG_CAP,TEN_NHA_CUNG_CAP,DIA_CHI)
VALUES
	('C01',N'Nh� cung c?p 1',N'Vi?t Nam'),
	('C02',N'Nh� Cung C?p 2',N'Trung Qu?c'),
	('C03',N'Nh� Cung C?p 3',N'Nh?t'),
	('C04',N'Nh� Cung C?p 4',N'Th�i Lan')
INSERT INTO HANGHOA(MA_HANG,TEN_HANG,MAU,TRONG_LUONG,NUOC_SAN_XUAT)
VALUES 
	('H01',N'h�ng 1',N'??',500,N'Vi?t Nam'),
	('H02',N'h�ng 2',N'Xanh',50,N'Trung qu?c'),
	('H03',N'h�ng 1',N'V�ng',90,N'Nh?t'),
	('H04',N'h�ng 3',N'T�a',100,N'Th�i Lan'),
	('H05',N'h�ng 4',N'??',200,N'Nga')
INSERT INTO XUATHANG(MA_HANG,MA_NHA_CUNG_CAP)
VALUES 
	('H01','C01'),
	('H02','C02'),
	('H03','C03'),
	('H04','C04')
--t? b?ng HANGHOA hi?n th? t?t c? d? li?u 
SELECT *
FROM HANGHOA
GO
--T? b?ng HANGHOA hi?n th? TRONG_LUONG l?n h?n 100
SELECT *
FROM HANGHOA
WHERE HANGHOA.TRONG_LUONG > 100
GO
--T? B?ng HANGHOA hi?n th? t?t c? d? li?u c� trong b?ng , nh?ng Ten_Hang ph?i c� ch? cu?i c�ng l� 1
SELECT TEN_HANG
FROM HANGHOA
WHERE TEN_HANG LIKE N'%1'
GO
--Hi?n th? t�n nh� cung c?p v� t�n h�ng h�a c?a nh� cung c?p ?�
SELECT NHACUNGCAP.TEN_NHA_CUNG_CAP,HANGHOA.TEN_HANG
FROM HANGHOA INNER JOIN XUATHANG
	ON HANGHOA.MA_HANG = XUATHANG.MA_HANG
		INNER JOIN NHACUNGCAP
		ON XUATHANG.MA_NHA_CUNG_CAP = NHACUNGCAP.MA_NHA_CUNG_CAP
	GO
--Hi?n th? t�n nh� cung c?p ,??a ch? ,t�n h�ng ,tr?ng l??ng c?a nh� cung c?p ?� .h�y s?p x?p c?t TRONG_LUONG theo th? t? gi?m d?n

SELECT NHACUNGCAP.TEN_NHA_CUNG_CAP,NHACUNGCAP.DIA_CHI,HANGHOA.TEN_HANG,HANGHOA.TRONG_LUONG
FROM HANGHOA INNER JOIN XUATHANG
	ON HANGHOA.MA_HANG = XUATHANG.MA_HANG
		INNER JOIN NHACUNGCAP
		ON XUATHANG.MA_NHA_CUNG_CAP = NHACUNGCAP.MA_NHA_CUNG_CAP
		ORDER BY TRONG_LUONG DESC
	GO	
--Hi?n th? t�n nh� cung c?p, t�nh t?ng s? h�ng h�a m� nh� cung c?p c� v� t?ng tr?ng l??ng c?a h�ng h�a
SELECT NHACUNGCAP.TEN_NHA_CUNG_CAP,COUNT(HANGHOA.MA_HANG) TONGHANG,SUM (HANGHOA.TRONG_LUONG) TONGTRONGLUONG
FROM HANGHOA INNER JOIN XUATHANG
	ON HANGHOA.MA_HANG = XUATHANG.MA_HANG
		INNER JOIN NHACUNGCAP
		ON XUATHANG.MA_NHA_CUNG_CAP = NHACUNGCAP.MA_NHA_CUNG_CAP
		GROUP BY NHACUNGCAP.TEN_NHA_CUNG_CAP
	GO	
--Li?t k� nh?ng nh� cung c?p n�o c� t?ng tr?ng l??ng h�ng h�a l?n h?n ho?c b?ng 150
SELECT NHACUNGCAP.TEN_NHA_CUNG_CAP, COUNT (HANGHOA.MA_HANG) TONGHANG,SUM (HANGHOA.TRONG_LUONG)TONGTRONGLUONG
FROM HANGHOA INNER JOIN XUATHANG
	ON HANGHOA.MA_HANG = XUATHANG.MA_HANG
		INNER JOIN NHACUNGCAP
		ON XUATHANG.MA_NHA_CUNG_CAP = NHACUNGCAP.MA_NHA_CUNG_CAP
		GROUP BY NHACUNGCAP.TEN_NHA_CUNG_CAP
		HAVING SUM (HANGHOA.TRONG_LUONG) >= 150
		GO
-- H�y bi?t m� nh� cung c?p c�ng v?i t�n nh� cung c?p v� ??a ch? c?a nh� cung c?p ch?a xu?t h�ng l?n nao
SELECT NHACUNGCAP.MA_NHA_CUNG_CAP, NHACUNGCAP.TEN_NHA_CUNG_CAP, NHACUNGCAP.DIA_CHI
FROM		NHACUNGCAP LEFT JOIN XUATHANG
					ON NHACUNGCAP.MA_NHA_CUNG_CAP = XUATHANG.MA_NHA_CUNG_CAP
					WHERE XUATHANG.MA_NHA_CUNG_CAP IS NULL
	
--LIET KE TEN BANG BI TRUNG 
SELECT TEN_HANG , COUNT(*) SOLANBITRUNG
FROM HANGHOA
GROUP BY TEN_HANG
HAVING COUNT(*) > 1
