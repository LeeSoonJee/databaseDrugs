USE master
GO

DROP DATABASE IF EXISTS C2209I1JAVA1
CREATE DATABASE C2209I1JAVA1
GO

USE C2209I1JAVA1
GO

CREATE PROCEDURE insertStu
@fullname nvarchar(50),@gender bit
AS
BEGIN
	insert into Student(fullname,gender)
	values (@fullname,@gender)
END
GO