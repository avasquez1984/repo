use Northwind
go
--create view--
create view contactcatalog
as
select CompanyName, ContactName, City, Country
from Customers
union all
select companyname, contactname, city, country
from Suppliers
go

select * from contactcatalog;
go

--except--

select customerid from Customers
except
select customerid from orders