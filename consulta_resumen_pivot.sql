use Northwind
go
select *
from
(
select c.categoryname, datepart(yyyy,o.OrderDate) as ano, ( d.UnitPrice * d.Quantity) as total
from categories as c inner join products as p  on c.categoryid = p.CategoryID
                      inner join [Order Details] as d on d.ProductID = p.productid
                      inner join orders as o on o.orderid = d.OrderID
                      ) as t
pivot (sum(total) for  ano in ([1996],[1997],[1998])) as pvt

select categoryname, ano, venta from
(
select categoryname, [1996],[1997],[1998] from tablapivote
) as p
unpivot (venta for ano in ([1996],[1997],[1998])) as unpvt