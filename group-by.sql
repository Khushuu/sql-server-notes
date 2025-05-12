# Group By Clause

-- used to group selected set of rows using columns 
-- always used in conjunction with one or more aggregate functions 

# aggregate functions

# SUM

-- select sum(salary) from employee

# MIN

-- select min(salary) from employee

# MAX

-- select max(salary) from employee


create table employee (

	employee_id int primary key identity(1,1),
	name nvarchar(50) not null,
	city nvarchar(50) null,
	salary int not null default 1000
)

insert into employee values ('k', 'london', 3000), ('v', 'rome', 20000), ('rr', 'london', 13000), ('s', 'paris', 20000)

# group by 

--> total salary paid in each city

-- select city, sum(salary) as total_salary
-- from employee group by city 

-- select city, gender, sum(salary) as total_salary, count(employee_id) as total_employees
-- from employee group by city, gender


-- incorrect
-- error: Column 'employee.city' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

-- select city, sum(salary) as total_salary from employee 

# where and having

-- where clause 
	-- used to filter rows before aggregation (sum, max, min - these function)
	-- aggregate functions can not be used with where clause
	-- can be used with select, insert and update statements 


select city, sum(salary) from employee where city = 'london' group by city

-- having clause 
	-- used to filter groups after aggregation  (sum, max, min - these function)
	-- aggregate functions can be used in having clause
	-- can only be used with select statement

select city, sum(salary) from employee group by city having city = 'london' 



