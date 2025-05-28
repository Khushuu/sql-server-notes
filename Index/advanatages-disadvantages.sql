# Advantages and disadvantages of indexes

# Advantages

-- SELECT, UPDATE and DELETE statements benefit from indexes
-- index helps in finding and searching a specific row quickly
-- also help queries that ask for sorted results both ascending and descending based on indexed column

-- GROUP BY queries can also benefit from indexes
-- query engine can use the index column to retrieve sorted keys
-- the matching keys will be present in consecutive index entries 

---------------------------------------------------------------------------------------------------------

# Disadvantages

-- Additional disk space: 
	-- required for non-clustered index
	-- amount of space required depends on size of the table, number and types of column used in the index

-- Insert Update and Delete statements can become slow:
	-- when DML (Data Manipulation Language) statements (Insert, Update, Delete) modifies data in a table
	-- the data in the indexes also needs to be updated 
	-- too many indexes to update hurts the performance of data modifications

