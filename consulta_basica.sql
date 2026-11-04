use Northwind
go
select * from Suppliers;
go 
 


 create function fn_desc_cliente(@codigo_cliente int)
 returns table
 as
 return (
 select companyname, contactname
 from Suppliers
 where SupplierID = @codigo_cliente)
 go

 select * from fn_desc_cliente(1);