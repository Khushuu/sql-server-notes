# Different ways to replace NULL values

	-- ISNULL() function
	-- COALESCE function
	-- CASE Statement

-------------------------------------------------------------------------------------------------------

create table employeeM (
	
	id int not null,
	name nvarchar(20) not null,
	manager_id int null
)

insert into employeeM values (1, 'derek', 2), (2, 'patrick', null), (3, 'lane', 2), (4, 'drake', 1), (5, 'aron', null)

select * from employeeM

-------------------------------------------------------------------------------------------------------

-- instead of return null as manager name return no manager

# ISNULL()

-- takes two arguments --> if the first value is null returns the second else returns first

select ISNULL(null, 'khushboo') as name --> return khushboo

select a.id, a.name, a.manager_id, ISNULL(b.name, 'no manager') as manager_name 
from employeeM a 
left join employeeM b 
on a.manager_id = b.id

-------------------------------------------------------------------------------------------------------

# COALESCE function

-- returns the first non null value
-- atleast one value provided in the coalesce function should be not null

-- ERROR: At least one of the arguments to COALESCE must be an expression that is not the NULL constant.
select COALESCE(null, null, null) as name --> returns error

select COALESCE(null, null, null, 'khushboo') as name --> return khushboo

select id, coalesce(firstName, middleName, lastName) from person -- returns first non null out of the three

select a.id, a.name, a.manager_id, COALESCE(b.name, 'no manager') as manager_name 
from employeeM a 
left join employeeM b 
on a.manager_id = b.id

-------------------------------------------------------------------------------------------------------

# CASE statement

-- like an if else condition

case 
	when [expression] then '' else '' 
end

select a.id, a.name, a.manager_id, 
case
	when b.name is null then 'no manager'
	else b.name 
end 
as manager
from employeeM a 
left join employeeM b 
on a.manager_id = b.id


