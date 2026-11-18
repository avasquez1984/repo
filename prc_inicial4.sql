use Northwind
go
create procedure prc_ventas as
select * from Customers;
go


execute prc_ventas;