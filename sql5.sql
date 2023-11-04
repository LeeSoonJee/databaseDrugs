--index là chỉ mục / mục lục
-- mục đích của index là tăng tốc độ truy vấn cho câu lệnh select, hoặc delete, update
--một bảng mà có khóa chính thì đã mặc định được đánh index và có tên gọi là clustered index
--muốn tăng tốc truy vấn dữ liệu trên các cột thường thì dùng nonclustered index 
sp_helpindex nhanvien

SELECT *
FROM NHANVIEN
WHERE TENNV =N'HÙNG'

CREATE NONCLUSTERED INDEX IX_NHANVIEN_TENNV
ON NHANVIEN(TENNV)
GO

DROP INDEX IX_NHANVIEN_TENNV
ON NHANVIEN
GO
--STORED PROCEDURE(HÀM LƯU TRỮ CÁC CÂU LỆNH CẦN THỰC THI)

CREATE PROC Ten
AS
BEGIN
	--DO SOMETHING
	SELECT * FROM NHANVIEN 
END
GO

SELECT * FROM NHANVIEN 
GO