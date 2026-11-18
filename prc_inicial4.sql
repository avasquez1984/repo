use Northwind
go
create procedure prc_ventas as
select * from Customers;
go


execute prc_ventas;

select * from Customers;

select * from orders;


create procedure prc_proveedores as
select c.CustomerID, c.CompanyName, o.ShipName,o.ShipAddress
from customers as c inner join orders as o on c.customerid = o.customerid;
go

execute prc_proveedores;