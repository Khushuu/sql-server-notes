# DATETIME functions

# Datatypes for datetime

time - hh:mm:ss[.nnnnnnn] --> accuracy: 100 nanoseconds --> storage: 3 to 5 bytes

date - YYYY-MM-DD --> range: 0001-01-01 to 9999-12-31 --> storage: 3 bytes

smalldatetime - YYYY-MM-DD hh:mm:ss --> range: 1900-01-01 to 2079-06-06 --> storage: 4 bytes

datetime - YYYY-MM-DD hh:mm:ss[.nnn] --> range: 1753-01-01 to 9999-12-31 --> storage: 8 bytes

datetime2 - YYYY-MM-DD hh:mm:ss[.nnnnnnn] --> storage: 6 to 8 bytes

datetimeoffset - YYYY-MM-DD hh:mm:ss[.nnnnnnn][+][-]hh:mm --> storage: 8 to 10 bytes - UTC timezone

# UTC - Universal coordinated time 

- time based on which world regulates clocks and time
- slight difference but almost same as GMT

# Datetime Functions

# getdate() - 		returns current date 
# current_timestamp - 	equivalent to getdate
# sysdatetime() - 	more fractional seconds precision
# sysdatetimeoffset() - more fractional seconds precision + time zone offset
# getutcdate() - 	utc date and time 
# sysutcdatetime() - 	utc date and time with more fractional seconds precision


-- same for others

select getdate()
select sysdatetime()

---------------------------------------------------------------------------------------

ISDATE(expression) 

-- checks if the given expression is valid date, time or datetime 
-- returns 1 for success and 0 for failure 

select isdate('abc') -- returns 0
select isdate(getdate()) -- returns 1
select isdate('2020-12-12') -- returns 1

NOTE: for datetime2 values isdate returns 0

