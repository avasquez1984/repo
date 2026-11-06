use Northwind
go
create procedure proc_ventas
as
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderID
from Customers as c inner join orders as o on c.CustomerID = o.CustomerID
go