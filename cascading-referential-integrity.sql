# Cascading referential integrity constraint

-- specifies that if an attempt is made to delete or udpate a row with a key referenced by foreign keys in existing rows in other tables
-- allows to define the action server should take when an attempt is made to update or delete a foreign key

-- e.g
-- if u delete an id from gender table which is referred to in person table --> u get an error by default 

# OPTIONS when setting up cascading referential integrity constraint 

-- NO Action: 
	-- default behaviour
	-- error is raised and delete or update is rolled back 

-- Cascade:
	-- all rows containing those foreign keys are also deleted or updated

-- Set NULL:
	-- all rows containing those foreign keys are set to null

-- Set Default:
	-- all rows containing those foreign keys are set to default values 

ALTER TABLE person
ADD CONSTRAINT FK_person_gender
FOREIGN KEY (gender_id)
REFERENCES gender(id)
ON DELETE CASCADE
ON UPDATE SET NULL;