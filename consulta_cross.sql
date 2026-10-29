use Northwind
go
select c.CustomerID, c.CompanyName, c.Country, o.orderid, o.OrderDate
from customers as c inner join Orders as o on c.CustomerID = o.CustomerID
go
select c.CustomerID, c.CompanyName, c.Country, o.OrderID, o.OrderDate
from customers as c left outer join Orders as o on c.CustomerID = o.CustomerID
go

select * from Customers;