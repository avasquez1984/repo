use Northwind
go

select categoryname, [France],[Germany],[Brazil],[Mexico],[Argentina]  from
(select c.categoryname, cu.country as pais,
       d.unitprice * d.Quantity as parcial
from orders as o inner join [Order Details] as d on o.orderid = d.orderid
                 inner join products as p on d.ProductID= p.ProductID
                 inner join categories as c on c.CategoryID  = p.CategoryID
                 inner join customers as cu on o.customerid = cu.CustomerID) as T
pivot(sum(parcial) for pais in ([France],[Germany],[Brazil],[Mexico],[Argentina])) as pvt
go


--vista
create view view_detalleventa
as
select c.categoryname, year(o.orderdate) as anio,
       d.unitprice * d.Quantity as parcial
from orders as o inner join [Order Details] as d on o.orderid = d.orderid
                 inner join products as p on d.ProductID= p.ProductID
                 inner join categories as c on c.CategoryID  = p.CategoryID
go

--pivot
select *
into tblpivot
from view_detalleventa
pivot (sum(parcial) for anio in ([1996],[1997],[1998])) as pvt
go


select * from tblpivot;

--unpivot

select categoryname, anio, parcial from tblpivot
unpivot (parcial for anio in ([1996],[1997],[1998])) as upvt

