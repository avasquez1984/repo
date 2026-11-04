use Northwind
go
select * from Employees
go

create function fn_detalle_empleados ( @codigo integer)
returns table
as
return
(select firstname+' '+lastname as descripcion, city as ciudad, country as pais, extension
from employees
where employeeid = @codigo)
go

select *  from fn_detalle_empleados(9);