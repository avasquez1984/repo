use Northwind
go
create procedure proc_ventas
as
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderID
from Customers as c inner join orders as o on c.CustomerID = o.CustomerID
go


execute proc_ventas


alter procedure proc_ventas @cliente varchar(5)
as
select c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate
from Customers as c inner join orders as o on c.CustomerID = o.CustomerID
where c.CustomerID = @cliente
go

execute proc_ventas @cliente='AVV18';

drop procedure proc_ventas;


create procedure proc_insert_cliente (@customerid varchar(5), 
                                      @companyname varchar(100), 
                                       @contactname varchar(100), 
                                       @country varchar(100)
                                       )
as
insert into customers (customerid, companyname, contactname, country)
values (@customerid, @companyname, @contactname, @country)
go


execute proc_insert_cliente 'AVV18','ANTONIO VASQUEZ INC','ANTONIO VASQUEZ','REPUBLICA DOM';

select * from customers where CustomerID='AVV19';