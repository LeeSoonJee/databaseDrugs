use master
go

drop database if exists C2209I1JAVA1
create  database C2209I1JAVA1
go 

USE C2209I1JAVA1
GO
CREATE PROC selStuByIdorGender 1,true
@id INT, @gender bit 
as
begin
 SELECT * FROM Student
 Where id = @id or gender = @gender
 end 
 go

 CREATE PROC abc 
@fullname NVARCHAR(50), @gender bit
AS
BEGIN
	INSERT INTO Student(fullname,gender)
	values(@fullname,@gender)
	SELECT * FROM Student
END
GO
CREATE PROC ManySelect 
as
begin 
	Select * from Student
	Select fullname from student

end
go
ALTER PROC StoredCombine
@id int,
@fullname nvarchar(50), @gender bit
With encryption 
as
begin
	insert into Student(id,fullname,gender)
	values (@id,@fullname , @gender)
	select * from Student
	Select fullname from Student
end
go
