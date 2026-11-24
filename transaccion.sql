use Northwind
go
--ver los bloqueos sobre objetos de la db
sp_lock;
---
begin transaction
insert into customers (customerid, companyname, contactname, contacttitle, country)
values ('VHC1','visoalGt','victor cardenas','Ing.','Guatemala')
go


select * from customerS where customerid='VHC1';

--deshacer la transaccion
rollback transaction
--confirmar la transaccion
commit transaction
