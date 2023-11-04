--trigger tự động khi có sự thay đổi dữ liệu trên 1 bảng nào đó(insert,delete,update)
--1 bảng có thể có nhiều hơn 1 trigger 
--1 trigger thì chỉ gắn được trên 1 bảng 
CREATE TRIGGER [ten_tu_dat]
ON [ten_bang_can_gan_trigger]
FOR [insert/delete/update]
AS 
BEGIN
	--Do something
END 
GO
--TAO 1 TRIGGER ngăn người dùng nhập cái cusage lớn hơn 100 
CREATE TRIGGER validCusAge
ON Customer
for insert 
as 
begin 
	declare @CusAge TINYINT, @CusID int 
	SELECT @CusID=inserted.CusID, @CusAge = CusAge From inserted
	if @CusAge > 100 
	begin 
		print'cusage must be lasser than 100' 
		--rollback transaction
		delete from Customer where CusID=@CusID
	end
end 
go 
--1 người cố tình nhập liệu
--trigger gội câu này là inserted
insert into Customer(CusID,CusName,CusAge)
Values (7,'duong',120)

--dem so dong va hien thi so dong bi xoa trong customer
DELETE FROM Customer where CusAge = 50
--
Create trigger showdelete 
on Customer
after delete
as 
begin 
	declare @count int 
	select @count = count(CusID) from deleted

	select N'có' + CONVERT(nvarchar,@count)+'dòng bị xóa' + info
	
	select * from deleted
	--
	insert into bang_bat_ky
	select * from bang_nao_do 

	select * into bang_a from deleted
end 
go

--tao trigger xem lai khi cap nhat 
update Customer 
SET CusName='phu'
where cusID = 5

CREATE TRIGGER ShowUpdate
on Customer
after update
as
begin 
	if UPDATE(CusName)
	begin
		Select * from deleted
		Select * from inserted
	end
end
go

delete from Product where ProID = 4

create trigger detail 
on product 
instead of delete
as 
begin 
	declare @ProId int 
	select @ProId = ProID From deleted
	
	delete from OrderDetails where ProID=@ProId
	delete from product where ProID = @ProId
end 
go 

