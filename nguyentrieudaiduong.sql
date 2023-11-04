USE MASTER ;
GO 

DROP DATABASE IF EXISTS CSDL2
CREATE DATABASE CSDL2
GO

USE CSDL2
GO
CREATE TABLE Student
(
	ID INT IDENTITY(1,1) NOT NULL,
	FULLNAME NVARCHAR(50) NOT NULL,
	GENDER BIT NOT NULL,
	DOB DATE NOT NULL,
	EMAIL NVARCHAR(50) NOT NULL,
	AGE INT ,
	PRIMARY KEY(ID)
)
CREATE PROCEDURE proc_update_student
    @id int,
    @fullname varchar(255),
    @gender bit,
    @dob date,
    @email varchar(255),
	@age int 
AS
BEGIN
    UPDATE Student
    SET FULLNAME = @fullname,
        GENDER = @gender,
        DOB = @dob,
        email = @email,
		age = @age
    WHERE ID = @id;
END

CREATE PROCEDURE getstudentover21(
	@id int,
    @fullname varchar(255),
    @gender bit,
    @dob date,
    @email varchar(255),
	@age int 
)
AS
BEGIN
    SELECT *
    FROM Student
    WHERE AGE > 21;
END


SELECT *
FROM Student
ORDER BY ID DESC;
