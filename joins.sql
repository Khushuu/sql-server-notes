# JOINS in sql server

-- used to retrieve data from two or more tables 
-- in general tables are related to each other using foreign key constraints 

# Different types of JOINS

-- INNER JOIN
-- OUTER JOIN
-- CROSS JOIN

# Outer joins are further divided into

-- left join or left outer join
-- right join or right outer join
-- full join or full outer join

# INNER JOIN

-- returns only matching rows between both the tables 
-- non-matching rows are eliminated 
-- inner join and join can be used interchangably

select s.id, g.gender from student s
inner join gender g
on s.gender_id = g.gender_id

-------------------------------------------------------------------------------------------------------

# LEFT JOIN

-- returns matching rows and non-matching rows from the left table
-- unmatched columns are returned as null
-- left join and left outer join can be used interchangably

select s.id, g.gender from student s
left join gender g
on s.gender_id = g.gender_id

-------------------------------------------------------------------------------------------------------

# RIGHT JOIN

-- returns matching rows and non-matching rows from the right table
-- unmatched columns are returned as null
-- right join and right outer join can be used interchangably

select s.id, g.gender from student s
right join gender g
on s.gender_id = g.gender_id

-------------------------------------------------------------------------------------------------------

# FULL JOIN

-- returns matching rows and non-matching rows from both the tables
-- unmatched columns are returned as null
-- full join and full outer join can be used interchangably

select s.id, g.gender from student s
full join gender g
on s.gender_id = g.gender_id

-------------------------------------------------------------------------------------------------------

# CROSS JOIN

-- produces cartesian product of the two tables
-- one table = 10 rows and second table = 3 rows
-- cross join between the two gives - 10 * 3 = 30 rows

-- cross join does not use ON clause

select s.id, g.gender from student s
cross join gender g

-------------------------------------------------------------------------------------------------------

# Advance JOINS

select * from person p inner join gender g on p.gender_id = g.gender_id
select * from person p left join  gender g on p.gender_id = g.gender_id
select * from person p right join  gender g on p.gender_id = g.gender_id
select * from person p full join  gender g on p.gender_id = g.gender_id

select * from person p cross join  gender g

-- non-matching left table
select * from person p left join gender g on p.gender_id = g.gender_id where p.gender_id is null

-- non-matching right table
select * from person p right join  gender g on p.gender_id = g.gender_id where p.gender_id is null

-- non-matching both tables
select * from person p full join  gender g on p.gender_id = g.gender_id where g.gender_id is null or  p.gender_id is null

-------------------------------------------------------------------------------------------------------

# Self JOIN

-- joining a table with itself 
-- supports all type of joins -- inner, outer(left, right, full) and cross

-- a table with employeeid, name and manager id (nothing but employee id)

create table employeeM (
	
	id int not null,
	name nvarchar(20) not null,
	manager_id int null
)

insert into employeeM values (1, 'derek', 2), (2, 'patrick', null), (3, 'lane', 2), (4, 'drake', 1), (5, 'aron', null)

select * from employeeM

select * from employeeM a inner join employeeM b on a.manager_id = b.id

select a.id, a.name, a.manager_id, b.name as manager_name from employeeM a 
inner join employeeM b on a.manager_id = b.id

select a.id, a.name, a.manager_id, b.name as manager_name from employeeM a 
left join employeeM b on a.manager_id = b.id

-------------------------------------------------------------------------------------------------------