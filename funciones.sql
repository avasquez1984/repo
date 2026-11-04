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