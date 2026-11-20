use Northwind
go

select o.OrderID, o.OrderDate, d.ProductID, d.Quantity, 
       sum(d.quantity) over (partition by o.orderid) as total,
       avg(d.quantity) over (partition by o.orderid) as promedio,
       count(d.quantity) over (partition by o.orderid) as conteo,
       min(d.quantity) over (partition by o.orderid) as minimo,
       max(d.quantity) over (partition by o.orderid) as maximo
from orders as o inner join [Order Details] as d on  o.OrderID = d.OrderID


select country, companyname, ROW_NUMBER() over (partition by country order by companyname) cantidad
from customers;

--funcion rank
select c.categoryname, p.ProductName, p.UnitPrice,
       rank() over (partition by c.categoryname order by p.unitprice desc)
from products as p inner join categories as c on c.CategoryID= p.CategoryID
order by c.CategoryName, unitprice desc