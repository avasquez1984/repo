use Northwind
go
select * from Customers

select customerid, companyname, contactname
into clientes
from customers;


select customerid from clientes;

create clustered index cl_cliente on clientes(customerid)

create index cl_companyname on clientes(companyname);