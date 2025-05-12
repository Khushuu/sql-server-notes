-- # Create a database 

query: create database payment

to change database name

-- using alter query: 
alter database payment modify name = 'paymentservices'

-- using system SP query: 
execute sp_renameDB 'payment', 'paymentservices'

-- # to drop a database

-- query: 
drop database paymentservices   

-- can not drop a database if it is currently in use 
-- solution:
	-- put the database in single user mode and then drop the database
	-- query: 
	alter database paymentservices set SINGLE_USER with rollback immediate
	-- with rollback immediate option: 
		-- all incomplete transactions are rolled back
		-- and the connection to the database is closed

-- NOTE: system databases can not be dropped 