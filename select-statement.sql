# select statement

# select all rows

-- select * from student 
-- select student_id, name from student

# TOP 

-- select top 10 * from student

# Percent

-- select top 50 percent * from student --> returns no of rows based on percentage provided 

# select distinct data 

-- select distinct name from student
-- select distinct name, class from student

# where clause

-- select * from student where class = 8

# NOT operator

-- select * from student where class <> 8 
-- select * from student where class != 7

# IN operator

-- select * from student where class in (7. 8. 9)

# OR operator

-- select * from student where class = 7 or class = 8 or class = 9

# BETWEEN operator

-- range of between is inclusive

-- select * from student where class between 7 and 9 

# LIKE operator and wild card operators

# %

-- select * from student where name like 'a%'
-- select * from student where email like '%@%' -- valid email
-- select * from student where email not like '%@%' -- not valid email

# _: denotes single character

-- select * from student where email like '_@_.com'

# []: any character within bracket - in the list

-- select * from student where name like '[abc]%' --> student whose name starts with a, b or c

# [^]: any character not within the bracket - not in the list 

-- select * from student where name like '[^abc]%' --> student whose name doesn't start with a, b or c

# OR, AND operator

-- select * from student where class = 10 and name like 'a%' -- class 10 students with name starting from a

# ORDER BY

-- select * from student order by class asc, name desc
-- select * from studnet order by class, name 

