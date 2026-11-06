use Northwind
go
create procedure proc_ventas
as
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderID
from Customers as c inner join orders as o on c.CustomerID = o.CustomerID
go


execute proc_ventas


alter procedure proc_ventas @cliente varchar(5)
as
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate
from Customers as c inner join orders as o on c.CustomerID = o.CustomerID
where c.CustomerID = @cliente
go

execute proc_ventas @cliente='ALFKI';

drop procedure proc_ventas;