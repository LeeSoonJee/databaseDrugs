--Trong sql có 4 cấu trúc lớn
--strored procedure => cho phép trả về 1 giá , hay nhiều giá trị , cho phép trả về null
--trigger => tự động chạy chỉ khi có sự thay đổi dữ liệu 
Create PROC C22O9I1
WITH ENCRYPTION -- khóa
AS
 BEGIN 
	SELECT * FROM NHANVIEN
 END
 GO 
 --View => thật chất là table, nhưng cho phép che dấu vài cột hoặc vài table không cần thiết
 --trong view chỉ có 1 câu lệnh thôi nên tuyệt đối ko có cái begin end 
 --Khi insert , delete ,update trên view cũng sẽ ảnh hưởng đến bảng chính
 Create View viewNV
 AS
	SELECT MANV, HONV,TENLOT,TENNV
	FROM NHANVIEN
GO
update viewNV
set TENNV= N'QQuang'
where MANV='008'
GO

create view showtenNv_PHONGNV
AS
	SELECT TENNV, TENPHG
	FROM NHANVIEN JOIN PHONGBAN
	ON PHONGBAN.MAPHG = NHANVIEN.PHG
GO 
--function => tương tự stored procedure , nhưng nó chỉ cho trả về 1 giá trị duy nhất 
--(1 kiểu bất kỳ ) , 1 table và chỉ gọi 1 lần duy nhất 
create function demsonv() 
RETURNS int--buộc phải có return
as
begin 
	return (select COUNT(*) from NHANVIEN )
end
go 

select count(manv) tongnv
from NHANVIEN
go

select dbo.demsonv() tongnv

--
select * from dbo.selectALLnv()
go
--function trả về bảng thì ko có begin END
create function selectALLnv()
RETURNS TABLE
as	
	return select * from NHANVIEN
	GO

--function tham số truyền vào
select dbo.layTenNV(TENNV) ten
FROM NHANVIEN 
GO 

CREATE FUNCTION layTenNV(@TENNV NVARCHAR(15))
RETURNS NVARCHAR(15)
AS 
BEGIN 

RETURN (SELECT @TENNV)

END
GO