﻿--với mỗi phòng ban cho biết tên phòng và địa điểm phòng 
create proc tenphong
as
begin
Select PHONGBAN.TENPHG,DIADIEM_PHG.DIADIEM
FROM PHONGBAN,DIADIEM_PHG
WHERE PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG
end
GO
--tìm tên của những người trưởng phòng trong ban 
create proc tentruongphong
as
begin
select HONV+' '+TENLOT+' '+TENNV  AS 'họ tên trưởng phòng'
From PHONGBAN,NHANVIEN
WHERE PHONGBAN.TRPHG=NHANVIEN.MANV
end
GO
--tìm TENDA,MADA,DDIEM_DA,PHONG,TENPHG,MAPHG,TRPHG,NG_NHANHUC
create proc TimDEAN
as
begin
select DEAN.TENDA,DEAN.MADA,DEAN.DDIEM_DA,DEAN.PHONG,PHONGBAN.TENPHG,PHONGBAN.MAPHG,PHONGBAN.TRPHG,PHONGBAN.NG_NHANCHUC
FROM DEAN,PHONGBAN
WHERE PHONGBAN.MAPHG = DEAN.PHONG 
end
GO
--tìm tên và địa chỉ của tất cả nhân viên củ phaòng nghiên cứu
CREATE PROC DCHINVPHONGNGHIENCUU
AS
BEGIN
select NHANVIEN.HONV+' '+NHANVIEN.TENLOT+' '+NHANVIEN.TENNV Tên,NHANVIEN.DCHI địa_chỉ
from NHANVIEN,PHONGBAN
WHERE	NHANVIEN.PHG = PHONGBAN.MAPHG AND PHONGBAN.TENPHG =N'Nghiên cứu'
END
GO
--tìm từng tên nữ nhân viên và tên người thân của họ 
CREATE PROC NGTHANNVNU
AS
BEGIN
Select TENNV,TENTN
	FROM NHANVIEN,THANNHAN
	WHERE NHANVIEN.MANV=THANNHAN.MA_NVIEN AND NHANVIEN.PHAI = N'NỮ'
	END
	GO
-- Với mọi đề án ở "Ha Noi", liệt kê các mã số đề án (MADA), mã số phòng ban chủ trì đề án
--(PHONG), họ tên trưởng phòng (HONV, TENLOT, TENNV) cũng như địa chỉ (DCHI) và
--ngày sinh (NGSINH) của người ấy.
CREATE PROC DEANHN
AS 
BEGIN
SELECT DEAN.MADA,PHONGBAN.TENPHG,(NHANVIEN.HONV + ' ' +NHANVIEN.TENLOT +' '+ NHANVIEN.TENNV) HỌ_TÊN_TRƯỞNG_PHÒNG,
		NHANVIEN.DCHI,
		NHANVIEN.NGAYSINH
		FROM NHANVIEN,PHONGBAN,DEAN
		WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND PHONGBAN.MAPHG = DEAN.PHONG 
		AND DEAN.DDIEM_DA = N'HÀ NỘI'
		END
		GO
--với mỗi nhân viên tìm tên nhân viên và tên của người quản lý nhân viên đó 
CREATE PROC TENNGUOIQUANLINV
AS
BEGIN
SELECT NV.HONV + ' '+NV.TENLOT+ ' ' +NV.TENNV HỌ_TÊN_NV,
		QL.HONV+' '+QL.TENLOT+' '+QL.TENNV HỌ_TÊN_QL
FROM  NHANVIEN AS QL,NHANVIEN AS NV
WHERE QL.MANV = NV.MA_NQL
END
GO
--  Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân
--viên đó làm việc 
CREATE PROC TRGPHONGNVLAMVIEC
AS
BEGIN
SELECT NV.HONV + ' '+NV.TENLOT+ ' ' +NV.TENNV HỌ_TÊN_NV,
		TP.HONV+' '+TP.TENLOT+' '+TP.TENNV HỌ_TÊN_TP
FROM  NHANVIEN AS TP,NHANVIEN AS NV,PHONGBAN
WHERE TP.MANV = PHONGBAN.TRPHG AND NV.PHG = PHONGBAN.MAPHG
END
GO
--TÊN NHÂN VIÊN PHÒNG SỐ 5 THAM GIA VÀO ĐỀ ÁN SẢN PHẨM X VÀ NHÂN VIÊN NÀY DO NGUYỄN THANH TÙNG QLTT
CREATE PROC NVPS5NTT
AS
BEGIN
SELECT NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT+' '+NHANVIEN.TENNV AS 'Tên của nhân viên phòng số 5 do nguyễn thanh tùng quản lý '

FROM NHANVIEN ,DEAN
where NHANVIEN.PHG =DEAN.PHONG 
	and NHANVIEN.PHG = 5 
	AND DEAN.TENDA = N'SAN PHAM X '
	AND NHANVIEN.MA_NQL = (
							SELECT NHANVIEN.MANV
							FROM NHANVIEN 
							WHERE NHANVIEN.HONV = N'Nguyễn' and NHANVIEN.TENLOT = N'Thanh'
								and NHANVIEN.TENNV = N'Tùng'
							)
							END 
							GO
