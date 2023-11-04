use master
go

drop database if exists c2209i1_swing
create database c2209i1_swing
go

use c2209i1_swing
go
insert into person(fullname,gender,picture,dob)
values (N'phu',0,'images/a.png','2023-10-17')
go 20

select top 11* 
from person
order by id desc
go
select  * from person 
where id >= 21
go
select  * from person 
order by id
OFFSET 20 rows
go
select  * from person 
order by id
OFFSET 20 rows
FETCH NEXT 20 ROWS ONLY
go
--VIET STORE PHAN TRANG

CREATE PROCEDURE SELPERSON
@pageNumber int ,@rowOfPage int 
AS 
BEGIN 
	select  * from person 
	order by id
	OFFSET (@pageNumber-1) * @rowOfPage rows
	FETCH NEXT  @rowOfPage ROWS ONLY
END
GO

selperson 2,50

CREATE PROCEDURE countPerson
as 
begin
select count(id) total from person
end 
go

create procedure upPer
@fullname nvarchar(50), @gender bit,
@picture varchar(250),@dob date,
@id int
as
begin
	Update person
	set fullname = @fullname , gender = @gender,
	picture = @picture, dob = @dob
	where id = @id
end
go
drop table account
create table account 
(
	id int primary key identity,
	username varchar(50),
	pass varchar(200),
	expriration_time datetime,
	is_active bit default 0,
)
go
alter proc selectaccount
 @username varchar(50)
as
begin
	Select * from account where
	username = @username
end
go
drop proc insertAcc
create proc insertAcc
@username varchar(50),@pass varchar(250),@expriration_time Datetime
as 
begin 
	insert into account(username,pass,expriration_time,is_active)
	values(@username,@pass,@expriration_time,Default)

end
go

create proc signIn
@username varchar(50), @pass varchar(200)
as 
begin 
	Select * from account
	where username = @username and pass = @pass
end
go
alter proc updateActive
@username varchar(50)
as
begin
	 Update account
	 set is_active = 1
	 where username = @username
end
go

create proc resendPass
@pass varchar(250),@expritation_time datetime,
@username varchar(50)
as
begin
	Update account
	set pass = @pass,expriration_time = @expritation_time
	where username = @username
end 
go