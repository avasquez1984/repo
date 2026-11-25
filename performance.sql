use Northwind
go
select * from Customers

select customerid, companyname, contactname
into clientes
from customers;


select customerid, count(companyname) from clientes group by customerid order by CustomerID;

create clustered index cl_cliente on clientes(customerid)

create index cl_companyname on clientes(companyname);