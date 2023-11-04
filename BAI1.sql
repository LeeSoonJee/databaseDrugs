use master 
go 
 
create database duong
go 

drop database if exists duong
create database duong
go

use duong
go 

create table khachhang 
(
 makh nvarchar(5) primary key ,
 tenkh nvarchar(30),
 diachi nvarchar(50),
 dt nvarchar(15),
 email nvarchar(30)
)
go
DROP TABLE khachhang;

create table vattu 
(
	mavt nvarchar(5) primary key , 
	tenvt nvarchar(30),
	dvt nvarchar(30),
	giamua float,
	slton float 
)
go
create table hoadon 
(
	mahd nvarchar(5) primary key ,
	ngay date,
	makh nvarchar(5),
	tongtg float
)
go
drop table hoadon;
create table chitiethoadon
(
	mahd nvarchar(5),
	mavt nvarchar(5),
	sl int , 
	khuyenmai float ,
	giaban float ,
	primary key (mahd,mavt)
)
go

drop table chitiethoadon;

alter table hoadon
add
constraint fk_hoadon_khachhang
foreign key (makh)
references khachhang(makh)
go
alter table chitiethoadon 
add 
constraint fk_chitiethoadon_hoadon
foreign key (mahd)
references hoadon(mahd)
go
alter table chitiethoadon
add
constraint fk_chitiethoadon_vattu 
foreign key (mavt)
references vattu(mavt)
go 

insert vattu(mavt,tenvt,dvt,giamua,slton)
values 
	('VT01','XI MANG','BAO',50000,5000),
	('VT02','CAT','KHOI',45000,5000),
	('VT03','GACH ONG','VIEN',120,800000),
	('VT04','GACH THE','VIEN',110,800000),
	('VT05','DA LON','KHOI',25000,100000),
	('VT06','DA NHO','KHOI',33000,100000),
	('VT07','LAM GIO','CAI',150000,50000)

insert into khachhang(makh,tenkh,diachi,dt,email)
values 
	(N'kh01',N'nguyen thi be',N'tan binh',N'8932989',N'bmt@yahoo.com')
insert into khachhang(makh,tenkh,diachi,dt,email)
values
	(N'kh02',N'le hoang nam',N'binh chanh',N'893989',N'namckhoang@abc.com.vn')
insert into khachhang(makh,tenkh,diachi,dt,email)
values
	(N'kh03',N'tran thi chieu',N'tan binh',N'787283',null)
insert into khachhang(makh,tenkh,diachi,dt,email)
values
	(N'kh04',N'mai thi que anh',N'binh chanh',null,null)
insert into khachhang(makh,tenkh,diachi,dt,email)
values
	(N'kh05',N'le van sang',N'quan10',null,N'sanglv@hcm.vnn.vn')
insert into khachhang(makh,tenkh,diachi,dt,email)
values
	(N'kh06',N'tran hoang khai',N'tan binh',N'8923829',null)

insert into hoadon(mahd,ngay,makh)
values
	('hd01','2000/05/12','kh01'),
	('hd02','2000/05/25','kh02'),
	('hd03','2000/05/25','kh01'),
	('hd04','2000/05/25','kh04'),
	('hd05','2000/05/26','kh04'),
	('hd06','2000/06/02','kh03'),
	('hd07','2000/06/2','kh04'),
	('hd08','2000/06/25','kh03'),
	('hd09','2000/08/15','kh04'),
	('hd010','2000/09/30','kh01'),
	('hd011','2000/12/27','kh06'),
	('hd012','2000/12/27','kh01')
insert chitiethoadon(mahd,mavt,sl,giaban)
values 
	(N'hd01',N'VT01',5,5200),
	(N'hd01',N'VT05',10,52000),
	(N'hd02',N'VT03',10000,2000),
	(N'hd03',N'VT02',20,20000),
	(N'hd04',N'VT03',5000,90000),
	(N'hd04',N'VT04',50,80000),
	(N'hd05',N'VT05',25,10000),
	(N'hd05',N'VT06',5000,100000),
	(N'hd05',N'VT07',45,80000),
	(N'hd06',N'VT04',15,80000),
	(N'hd07',N'VT04',500,500000),
	(N'hd08',N'VT01',50000,150000),
	(N'hd08',N'VT02',500,250000),
	(N'hd09',N'VT02',20,520000),
	(N'hd010',N'VT01',10,5000),
	(N'hd011',N'VT01',20,10000),
	(N'hd011',N'VT02',20,50000),
	(N'hd012',N'VT01',50,10000)
update vattu
set mavt='VT01'
where mavt='VT001'
go

	