
# SP with OUPUT parameters

-- use keywords OUT or OUTPUT with the parameter

create table student (
	
	id int primary key identity(1, 1),
	name nvarchar(20) not null,
	class int not null,
	gender_id int,
	foreign key (gender_id) references gender(gender_id)
)

insert into student values('dream', 1, 1), ('team', 10, 2), ('hola', 11, 3), ('amigo', 9, 1) 

--------------------------------------------------------------------------------------------------------

create procedure GetStudentCountByClass
	@class int,
	@studentCount int OUTPUT
as 
begin
	select @studentCount = count(id) from student 
	where class = @class
end

# execute sp with output parameters 

-- same format for passing variables should be used for all variables
-- if u use @name = value use it for all else use value, value format for all 


-- using input parameter name
declare @studentCount
execute GetStudentCountByClass @class = 9,  @studentCount = @studentCount output
print @studentCount


-- without using input parameter name 
declare @studentCount
execute GetStudentCountByClass 9, @studentCount output
print @studentCount

--------------------------------------------------------------------------------------------------------

NOTE: if output keyword parameter is not specified while executing the stored procedure the value of @studentCount will be null 

NOTE: both print and select keyword can be used 