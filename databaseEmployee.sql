use master
go

drop database if exists Employee
create database Employee
go

use Employee 
go

create table employee 
(
	manv int primary key identity,
	tennv nvarchar(50),
	tinhtrangdocthan bit,
	ngaysinh date,
	diachi nvarchar(250)
)
go
insert into employee(tennv,tinhtrangdocthan,ngaysinh,diachi)
values (N'Thinh',0,'2008-10-29','conghoa')
go 

create proc selectEmployee
as
begin
	select * from employee
end 
go
create procedure updateEmploye
@tennv nvarchar(50), @tinhtrangdocthan bit,
@ngaysinh date,@diachi nvarchar(250),
@manv int
as
begin
	Update employee
	set tennv = @tennv , tinhtrangdocthan = @tinhtrangdocthan,
	ngaysinh= @ngaysinh, diachi = @diachi
	where manv = @manv
end
go
CREATE PROCEDURE deleteEmploye
	@Manv int
AS
BEGIN
	DELETE FROM employee
	WHERE Manv = @Manv;
END;
CREATE PROCEDURE insertEmploye
	@Tennv nvarchar(50),
	@Tinhtrangdocthan bit,
	@Ngaysinh date,
	@Diachi nvarchar(255)
AS
BEGIN
	INSERT INTO Employee(Tennv, Tinhtrangdocthan, Ngaysinh, Diachi)
	VALUES (@Tennv, @Tinhtrangdocthan, @Ngaysinh, @Diachi);
END;
CREATE PROCEDURE searchEmploye
	@Tennv nvarchar(50)
AS
BEGIN
	SELECT * FROM Employee
	WHERE Tennv LIKE '%' + @Tennv + '%';
END;
