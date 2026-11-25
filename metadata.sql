use Northwind
go
select * from sys.tables
go

select * from sys.views
go


sp_helptext invoices;


select * from INFORMATION_SCHEMA.tables;

select @@version as sql_version

select serverproperty('ProductVersion') as version

exec sys.sp_databases;

sp_helpdb northwind;
go

sp_help customers;
go

sp_who 61

sp_who2


sp_lock


begin transaction
insert into customers (CustomerID, companyname) values ('abc23','dlkjfds')

rollback transaction


select * from sys.dm_exec_session;