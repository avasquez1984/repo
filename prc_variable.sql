use Northwind
go
declare @variable varchar(200)
set @variable='customers'
execute ('select * from ' + @variable );