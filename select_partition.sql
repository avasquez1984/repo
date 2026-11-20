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
       rank() over (partition by c.categoryname order by p.unitprice desc) as position
from products as p inner join categories as c on c.CategoryID= p.CategoryID
order by c.CategoryName, unitprice desc


select c.categoryname, p.ProductName, p.UnitPrice,
       dense_rank() over (partition by c.categoryname order by p.unitprice desc) as position
from products as p inner join categories as c on c.CategoryID= p.CategoryID
order by c.CategoryName, unitprice desc


--funciones lag y lead--
create table PreciosProducto
(
nombreproduct varchar(100),
fechavaluacion date,
precio money
)

insert into PreciosProducto (nombreproduct,fechavaluacion,precio) values
('Pintura Spray Rojo Fuego','01-01-2026',23.32),
('Pintura Spray Rojo Fuego','01-02-2026',26.11),
('Pintura Spray Rojo Fuego','01-03-2026',25.26),
('Pintura Spray Rojo Fuego','01-04-2026',30.45),
('Pintura Spray Rojo Fuego','01-05-2026',30.20),
('Pintura Spray Rojo Fuego','01-06-2026',31.12),
('Pintura Spray Rojo Fuego','01-07-2026',25.75),
('Pintura Spray Rojo Fuego','01-08-2026',24.21),
('Pintura Spray Rojo Fuego','01-09-2026',25.12),
('Pintura Spray Rojo Fuego','01-10-2026',28.26)
go

select * from PreciosProducto;

--consulta que tome el precio anterior
select actual.nombreproduct, actual.fechavaluacion, actual.precio,
       anterior.precio as precio_anterior
from PreciosProducto as actual left  join PreciosProducto as anterior 
    on actual.fechavaluacion = dateadd(DD,1,anterior.fechavaluacion)

--funcion lag, lead
select nombreproduct, fechavaluacion, precio,
lag(precio) over (order by fechavaluacion) as precioanterior,
lead(precio) over ( order by fechavaluacion) as preciosiguiente
from PreciosProducto
