# Advantages of using Stored Procedures

-- execution plan retention and reusability
	-- can use the same execution plan 
	-- when a query is executed in a server 3 steps happen
		-- checks the syntax of the query
		-- compiles the query
		-- generates an execution plan
	
	-- execution plan: what is the best possible way for the query to execute the data 
	
	-- if same query is executed again the execution plan that is cached will be used
	-- for adhoc sql queries even if there is slight change in the query with a dfiferent filter condition
	-- then new execution plan is created
	
	-- for SPs even if input parameters changes same execution plan will be used 

-- reduces network traffic 
	-- u do not need to execute the big adhoc query again and again and pass it over network
	-- just execute the SP with parameters 

-- code resusability and better maintainability
	-- same code can be used by multiple applications 
	-- a bug needs to be solved at only one place not across all applications - maintainability

-- better security
	-- instead of providing access to the table
	-- just give access to the SP 

-- avoids SQL injection attack  
