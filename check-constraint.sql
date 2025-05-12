# Check constraint

-- used to limit the range of the values that can be entered for a column

-- use CK_table_name_column_name --> naming convention for default constraint

-- for new column
alter table person 
add age int null check (age > 0 and age < 130)

-- for existing column
alter table [table_name]
add constraint [constraint_name] check [boolean_expression]

alter table person
add constraint CK_person_age check (age > 0 and age < 130)

-- if boolean expression returns true - check constraint allows the value 
-- else it doesn't 

-- for a column that is nullable and has check constraint 
-- null values are allowed even with constraint 
-- the boolean expression evaluates to UNKNOWN and allows the value 


-- dropping the check constraint 

alter table [table_name]
drop constraint [constraint_name]

alter table person
drop constraint CK_person_age