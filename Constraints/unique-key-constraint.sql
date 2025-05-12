# Unique key constraint

-- enforces uniqueness of the columns
-- doesn't allow duplicate values in the column

alter table [table_name]
add constraint [constraint_name] unique([column_name])

alter table student 
add constraint UQ_student_student_id unique(student_id)

# difference between primary key and unique key

-- primary key:
	-- a table can have only one primary key
	-- no null values allowed

-- unique key:
	-- can be more than one 
	-- one null value allowed 
	-- error in case of more than one null insert: Violation of UNIQUE KEY constraint 'UQ_student_student_id'. Cannot insert duplicate key in object 'dbo.student'. The duplicate key value is (<NULL>).

-- doubts
	-- if a column already has duplicate values can unique constraint be added --> NO it can not be added

# drop constraint

alter table student 
drop constraint UQ_student_student_id