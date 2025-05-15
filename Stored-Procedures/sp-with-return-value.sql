
# Stored procedures with return values 

-- when a SP is executed it returns an integer status variable
-- 0 indicates success and non-zero indicates failure 

-----------------------------------------------------------------------------------------------------------

-- SP with output parameter 

create procedure GetTotalStudent 
@studentCount int output
as 
begin
	select @studentCount = count(id) from student
end

declare @studentCount int
execute GetTotalStudent  @studentCount = @studentCount output

print @studentCount

-----------------------------------------------------------------------------------------------------------

-- SP with return value

create procedure GetSecondaryClassCount
as 
begin
	return (select count(*) from student where class > 8) -- returns value
end

declare @classCount int
execute @classCount = GetSecondaryClassCount
select @classCount

-- this will fail 
-- as non integer values can not be returned in an SP
-- error: Conversion failed when converting the nvarchar value 'team' to data type int.

create procedure GetStudentNameById
@id int 
as 
begin
	return (select name from student where id = @id) 
end

declare @studentName nvarchar(20)
execute @studentName = GetStudentNameById 2
select @studentName

-----------------------------------------------------------------------------------------------------------

# SP with return value
	-- can return only integer value
	-- can return only one value 
	-- used to convey success or failure 

# SP with output parameters 
	-- can return any datatype
	-- can return more than one value 
	-- used to return values like names, count etc 

-----------------------------------------------------------------------------------------------------------



