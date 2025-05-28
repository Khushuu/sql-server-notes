# Difference between clustered and non-clustered index

-- clustered index: 	only one clustered index per table
-- non-clustered index:	can have more than one clustered index per table

-- clustered index: 	faster than non-clustered index
-- non-clustered index:	slower bcoz has to refer back to the table, if selected column not present in the index

-- clustered index: 	determines the storage order of rows in the table, doesn't require additional disk space
-- non-clustered index:	stored seperately from the table, hence additional storage space is required 