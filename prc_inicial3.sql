use Northwind
go
select * from customers;
go
create procedure prc_cambio_pais ( @paisnuevo varchar(15), 
                                   @paisviejo varchar(15), 
                                   @filasafectadas int output)
as
update customers
set country=@paisviejo
where Country=@paisnuevo
set @filasafectadas=@@ROWCOUNT
go

declare @variable int
execute prc_cambio_pais 'REPUBLICA DOM','CANADA', @variable output
select @variable
go

select * from sys.parameters where object_id=2030630277

select * from sys.objects where name='PRC_CAMBIO_PAIS';
