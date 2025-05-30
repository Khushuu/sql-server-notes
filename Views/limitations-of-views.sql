# Limitations of views

** Cannot pass parameters to a view

-- table valued functions are a replacement for parameterized views

-- Error 
-- Cannot pass Parameters to Views

create view getStudentGender
@gender_id int
as
	select id, name, class, gender from student s
	inner join gender g
	on s.gender_id = @gender_id

--------------------------------------------------------------------------------------------------------------

# Table valued functions:

-- table Valued functions can be used as a replacement for parameterized views

create function fnGetStudentGender(@gender_id int)
returns table
as 
return (select * from student where gender_id = @gender_id)

-- calling the function
select * from fnGetStudentGender(1)

--------------------------------------------------------------------------------------------------------------

** Rules and default can not be associated with views

--------------------------------------------------------------------------------------------------------------

** The ORDER BY clause is invalid in views unless TOP or FOR XML is also specified

create view allStudent
as 
	select id, name, class from student
	order by class 

-- error
The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.

--------------------------------------------------------------------------------------------------------------

** Views cannot be based on temporary tables

create table #student (id int, name nvarchar(20))

insert into #student values (1, 'khush'), (2, 'derek')

-- error
-- Views or functions are not allowed on temporary tables. Table names that begin with '#' denote temporary tables.

create view studentName
as 
	select name from #student

