use northwind
go
alter function fn_empleado (@codigoempleado integer)
returns table
as
return (
select firstname+ ' ' + lastname as nombre, city as ciudad, country as pais
from employees
where employeeid = @codigoempleado)
go


select * from employees;

select * from fn_empleado(2);
go


create function fn_productos ( @codigo integer )
returns table
as return
(
select productname+' '+ convert( varchar(10), unitprice) as detalle
from products 
where productid = @codigo
)
go


select * from fn_productos(4)
go


create function fn_cliente ( @codigo varchar(10))
returns table
as
return(
select companyname+ ' - '+ contactname as detalle, 
       city as ciudad, 
       country as pais
from customers
where customerid = @codigo)
go

select * from Customers;

select * from fn_cliente('ANTON');
go

create function fn_envio ( @codigo VARCHAR(10) )
returns table 
as
return
(select distinct c.CompanyName as compania, 
                 o.ShipName as direccion_envio, 
                 o.ShipCountry as pais_envio
from customers as c inner join orders as o on c.CustomerID = o.CustomerID
where C.CustomerID = @codigo)
go

select * from fn_envio('ANTON');

select * from customers;