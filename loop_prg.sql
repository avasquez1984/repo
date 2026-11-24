use Northwind
go
declare @empid int =1, @lname nvarchar(20);
while @empid <=5
 begin
  select @lname=lastname from Employees where EmployeeID=@empid
  print @lname
  set @empid +=1
 end;