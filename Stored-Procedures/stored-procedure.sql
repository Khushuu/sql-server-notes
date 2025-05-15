# STORED PROCEDURES 

-- group of T-SQL (Transact SQL) statements
-- instead of writing the same query again and again use a SP and call the SP

-- use CREATE PROCEDURE or CREATE PROC statement to create SP
-- system stored procedures prefix with sp_
-- do not use sp_ as prefix in user defined SPs

-- to execute the stored procedure
	-- spGetClass
	-- EXEC spGetClass
	-- Execute spGetClass

--------------------------------------------------------------------------------------------------------

-- SP to get females

CREATE PROCEDURE females 
AS
BEGIN
	select p.name, g.gender from person p inner join gender g
	on p.gender_id = g.gender_id and g.gender = 'female'
END

--------------------------------------------------------------------------------------------------------

# use alter procedure statement to modify sp
# use drop procedure 'procedure_name' to drop an SP

--------------------------------------------------------------------------------------------------------

# to encrypt an SP use WITH ECRYPTION option - text of an encrpted SP can not be viewed

create procedure getClass 
	@class int
with encryption
as 
begin 
	select * from student where class = @class
end  

--------------------------------------------------------------------------------------------------------

# Useful System Stored Procedures

# sp_help procedure_name
	-- to view the information about the stored procedure
	-- can be used with tables, view, sp's, trigger - any database object
	-- or press ALT + F1 on object name after highlighting it

# sp_helptext procedure_name
	-- to view the text of the stored procedure

#sp_depends procedure_name
	-- to view the dependencies of the stored_procedure
	-- helpful in viewing the list of tables the SP depends on 
	-- can be used with othere database objects like tables etc.
	-- with tables it will list the SP, functions, triggers etc that use this table
