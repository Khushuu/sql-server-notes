# Built-in string functions 

for system functions --> programmability --> functions


# ASCII(character_expression)

-- returns the integer ASCII code of given character expression
-- if a string is present then returns the ASCII code of first character 

select ASCII('a') -- returns 97
select ASCII('abc') -- returns 97

--------------------------------------------------------------------------------------------------------

# CHAR(integer_expression)

-- returns the ASCII code character for the integer expression
-- the integer_expression value should be between 0 to 255
-- returns null if value not in range is provided 

select CHAR(65) -- returns A 
select CHAR(550) -- returns NULL

-- print english alphabets from A to Z


declare @start int = 65
while(@start <= 90)
begin
	print CHAR(@start)
	set @start = @start + 1
end

--------------------------------------------------------------------------------------------------------

#LTRIM(character_expression) 

-- removes blank from the left hand side of given character expression

select LTRIM('  aaa b c') -- aaa b c
select LTRIM('  aaabc')

--------------------------------------------------------------------------------------------------------

#RTRIM(character_expression) 

-- removes blank from the right hand side of given character expression

select RTRIM('aaa b c     ') -- aaa b c
select RTRIM('aaabc    ') -- aabc

select LTRIM(RTRIM('  abc   ')) -- removes the space from both the ends

--------------------------------------------------------------------------------------------------------

# LOWER(character_expression)

-- converts all characters in the character_expression to lower case letters 

select LOWER('ABCd') -- abcd

--------------------------------------------------------------------------------------------------------

# UPPER(character_expression)

-- converts all characters in the character_expression to upper case letters 

select UPPER('abCd') -- ABCD

--------------------------------------------------------------------------------------------------------

# REVERSE(string_expression)

-- reverse all characters in the string_expression

select REVERSE('what do u want') -- tnaw u od tahw

--------------------------------------------------------------------------------------------------------

# LEN(string_expression)

-- returns the count of total characters in string_expression
-- excludes the blanks at the end of the expression
-- blanks at the start of the expression is not ignored 

select LEN('what do u want   ') -- 14


--------------------------------------------------------------------------------------------------------

# LEFT(character_expression, integer_expression)

-- returns the specified number of characters form the left side of character expression

select left('hola amigo', 4) -- hola

--------------------------------------------------------------------------------------------------------

# RIGHT(character_expression, integer_expression)

-- returns the specified number of characters form the right side of character expression

select right('hola amigo', 5) -- amigo

--------------------------------------------------------------------------------------------------------

# CHARINDEX(expression_to_find, expression_to_search, start_location)

-- returns the specified position of the character expression in the specified string 
-- it is 1-index based
-- start_location is optional - by default starts from 0

select charindex('hola', 'we say: hola amigo', 0) -- 9

--------------------------------------------------------------------------------------------------------

# SUBSTRING(expression, start, length)

-- returns the substring from the given expression

select substring('we say: hola amigo', 9, 4) -- hola

-- with charIndex to get the start index of hola

select substring('we say: hola amigo', charindex('hola', 'we say: hola amigo'), 4) -- hola

-- get different email domains present in a table

select distinct substring(email, charindex('@', email) + 1, len(email) - charindex('@', email)) as domain 
from person


--------------------------------------------------------------------------------------------------------

# REPLICATE(string_to_replicate, no_of_times)

-- repeats the given string specified number of times 

select replicate('*', 5) -- *****

--------------------------------------------------------------------------------------------------------

# SPACE(number_of_spaces)

-- returns the number of spaces specified 

select 'hannah' + space(3) + 'bate' -- hannah   bate

--------------------------------------------------------------------------------------------------------

# PATINDEX('%pattern%', expression)

-- returns the starting position of the first occurence of a pattern in the specified expression
-- charindex works with exact string
-- patindex also works with wildcards
-- if no pattern matches returns 0 

-- returns only the email and the index for which pattern matches

select email, patindex('%@p.com', email) as position from person
where patindex('%@p.com', email) > 0

--------------------------------------------------------------------------------------------------------

# REPLACE(string_expression, pattern, replace_with)

-- replaces all occurences of a specified string with another string value

select replace('abracadabra', 'a', 'z') -- zbrzczdzbrz
select replace('abracadabra', 'ab', 'z') -- zracadzra

select email, replace(email, '.com', '.org') as newEmail from person

--------------------------------------------------------------------------------------------------------

# STUFF(original_expression, start, length, replacement_expression)

-- inserts characters in original expression from start for the length specified with replacement expression

select stuff('who let the cat out', 0, 3, 'dog') --  dog let the cat out

