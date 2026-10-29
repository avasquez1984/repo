use Northwind
go
select c.CustomerID, c.CompanyName, c.Country, o.orderid, o.OrderDate
from customers as c inner join Orders as o on c.CustomerID = o.CustomerID
go
select c.CustomerID, c.CompanyName, c.Country, o.OrderID, o.OrderDate
from customers as c left outer join Orders as o on c.CustomerID = o.CustomerID
where orderid is null
go

---funcion de tabla en linea---
create function fn_cliente_ordenes (@codigocliente varchar(5))
returns table
as 
return(
select orderid , orderdate
from  Orders
where customerid= @codigocliente)
go

--revisar funcion--
select * from fn_cliente_ordenes('ANTON')


--UNION ENTRE LA TABLA CUSTOMERS Y LA FUNCION FN_CLIENTE_ORDENES--
select c.customerid, c.companyname, c.country, o.orderid, o.orderdate
from customers as c outer apply fn_cliente_ordenes(c.customerid) as o
where o.OrderID is null
order by c.CustomerID
go


select * from products;