drop database if exists drugSalesManagement
create database drugSalesManagement
go

use drugSalesManagement
go
create table patient
(
	IDpatient int primary key identity not null,
	PatientName nvarchar(250) not null,
	PatientAge int not null,
	PatientAddress nvarchar(500) not null,
	PatientPhone nvarchar(50) not null
)
go
create table InvoiceDetailsEntered
(
	IDInDeE int primary key identity not null,
	IDInDe int not null,
	IDmedicine int not null,
	quantity int not null,
	price int not null,
	tax float not null,
	unit nvarchar(50) not null
)
go
create table exportInvoiceDetails
(
	IDExInD int primary key identity not null,
	IDExIn int not null,
	IDmedicine int not null,
	quantity int not null,
	price int not null,
	tax float not null,
	unit nvarchar(50) not null
)
go
create table importInvoice
(
	IDInDe int primary key identity not null,
	IDdistributor int not null,
	deliver nvarchar(50) not null,
	receiver nvarchar(50) not null,
	totalDrugCost int not null,
	totaltax int not null,
	dateAdded datetime not null,
	dateOfWriting datetime not null
)
go