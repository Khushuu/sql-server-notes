# SP with INPUT parameters 

-- create employee that returns employee with salary greater than provided value 

create procedure getSalary 
	@id int,
	@salary int
as 
begin
	select * from employee where id < @id and salary > @salary
end
go

execute getSalary 2, 1000
go

-- u can also execute using
execute getSalary @id = 3, @salary = 1000

-- if multiple parameters are there order does not matter if variable name is defined
execute getSalary @salary = 500, @id = 4

-- otherwise the order should match as that of the SP parameters

NOTE: to view stored procedure use query: sp_helptext 'getSalary'

--------------------------------------------------------------------------------------------------------