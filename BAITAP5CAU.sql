--Liet ke toan bo thong tin nhan vien phong so 4
SELECT *
FROM NHANVIEN
WHERE PHG = 4
GO
--tim nhung nhan vien co muc luong tren 30000 
SELECT *
FROM NHANVIEN 
WHERE LUONG >30000
GO
--tim nhan vien co muc luong tren 25000 o phong so 4 hoac tren 30000 o phong so 5
SELECT *
FROM NHANVIEN
WHERE LUONG >25000 AND PHG = 4 OR LUONG > 30000 AND PHG = 5 
GO 
--Cho biet ho ten day du cua nhan vien o thanh pho hcm 
SELECT HONV +''+ TENLOT+''+TENNV hoten 
from NHANVIEN
WHERE NHANVIEN.DCHI  COLLATE SQL_Latin1_General_CP1_CI_AI LIKE N'%TP HCM%'
GO
--cho biet ngay sinh dia chi cua nhan vien dinh ba tien 
SELECT NGAYSINH,DCHI
FROM NHANVIEN
WHERE HONV COLLATE SQL_Latin1_General_CP1_CI_AI =N'Đinh'  AND TENLOT COLLATE SQL_Latin1_General_CP1_CI_AI=N'Bá' AND TENNV COLLATE SQL_Latin1_General_CP1_CI_AI=N'tiến'
GO