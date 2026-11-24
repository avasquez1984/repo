use Northwind
go

select c.categoryname, datepart(yyyy,o.OrderDate) as ano, 
sum( d.UnitPrice * d.Quantity) as total
from categories as c inner join products as p  on c.categoryid = p.CategoryID
                      inner join [Order Details] as d on d.ProductID = p.productid
                      inner join orders as o on o.orderid = d.OrderID
group by c.CategoryName, datepart(yyyy,o.OrderDate) with rollup                     
order by c.CategoryName, datepart(yyyy,o.OrderDate) 


use Northwind
go

select c.categoryname, datepart(yyyy,o.OrderDate) as ano, 
sum( d.UnitPrice * d.Quantity) as total
from categories as c inner join products as p  on c.categoryid = p.CategoryID
                      inner join [Order Details] as d on d.ProductID = p.productid
                      inner join orders as o on o.orderid = d.OrderID
group by c.CategoryName, datepart(yyyy,o.OrderDate) with cube 
--having c.CategoryName is null
order by c.CategoryName, datepart(yyyy,o.OrderDate)


use Northwind
go

select c.categoryname, datepart(yyyy,o.OrderDate) as ano, 
sum( d.UnitPrice * d.Quantity) as total
from categories as c inner join products as p  on c.categoryid = p.CategoryID
                      inner join [Order Details] as d on d.ProductID = p.productid
                      inner join orders as o on o.orderid = d.OrderID
group by grouping sets (c.CategoryName, datepart(yyyy,o.OrderDate),())
order by c.CategoryName, datepart(yyyy,o.OrderDate)
