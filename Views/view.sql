# View

-- it is a saved SQL query
-- also considered as a virtual table

----------------------------------------------------------------------------------------------------

# create view

create view studentGender
as
	select id, name, class, gender from student s
	inner join gender g
	on s.gender_id = g.gender_id

----------------------------------------------------------------------------------------------------

# select data from view

select * from studentGender

-- when this query is executed the database engine actually retrieves data from the underlying tables
-- from student and gender table

----------------------------------------------------------------------------------------------------

# View itself does not store any data by default - this behaviour can be changed
	-- for this reason view is considered as just a stored query or a virtual table

----------------------------------------------------------------------------------------------------

# Advantages of using view:

-- can be used to reduce the complexity of the database schema for non IT users
-- the sample view studentGender hides the complexity of joins
-- non-IT users find it easy to query the view than writing complex joins

** Row level security:
-- views can be used as a mechanism to implement row and column level security
-- u can grant the user access to only the view and not the underlying tables

** Column level security:
-- prevent access to confidential columns 
-- create a view which excludes the confidential column 
-- grant the end user access to this view rather than base tables

-- can be used to present only aggregated data using aggregate functions and hide detailed data 

----------------------------------------------------------------------------------------------------

# to look at view definition:
	execute sp_helptext veiw_name

----------------------------------------------------------------------------------------------------

# to modify a view:
	alter view statement

----------------------------------------------------------------------------------------------------

# to drop a view:
	drop view view_name

----------------------------------------------------------------------------------------------------

# Updatable views

# View based on single table

-- Insert, update, delete can be done on underlying table in the view 
-- u can insert or delete rows from the base tables using view

# View based on multiple tables

-- if you update the view, it may not update the underlying base tables correctly
-- use INSTEAD OF triggers for correctly updating view based on multiple tables






