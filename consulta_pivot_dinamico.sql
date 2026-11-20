use Northwind
go
create view ventascategoria
as
select c.categoryname, datepart(yyyy,o.orderdate) as ano,
       d.unitprice * d.quantity as total
from categories as c inner join products as p on c.CategoryID = p.CategoryID
                     inner join [Order Details] as d on d.ProductID = p.ProductID
                     inner join orders as o on o.OrderID =  d.OrderID
go

select *  from ventascategoria 
pivot (sum(total) for ano in ([1996],[1997],[1998])) as pvt