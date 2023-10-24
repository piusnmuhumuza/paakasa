-- TASK: CREATE TWO USERS AND GIVE THEM ACCESS TO THE DATABASE 
/* 
THE FIRST USER "JohnDoe" WILL BE A DBA AND SHOULD GET FULL DATABASE ADMINISTRATOR PRIVILEGES
THE SECOND USER "JaneDoe" IS AN ANALYST AND NEEDS READ ACCESS
*/

-- To check for the existing privileges granted
SHOW GRANTS FOR 
root@localhost;

-- USER CREATION

-- FOR THE FIRST USER NAMED "JohnDoe"
CREATE USER IF NOT EXISTS
'JohnDoe'@'localhost'
IDENTIFIED BY 'user_password';

-- FOR THE SECOND USER NAMED "JaneDoe"
CREATE USER IF NOT EXISTS
'JaneDoe'@'localhost'
IDENTIFIED BY 'user_password';

-- ASSIGNING USER PRIVILEGES

-- FOR THE FIRST USER, PRIVILEGES ARE FULL DATABASE ADMINISTRATOR
-- DBA GETS FULL PRIVILEGES ON THE DATABASE
GRANT ALL PRIVILEGES
ON db_paakasa.*
TO 'JohnDoe'@'localhost';

-- FOR THE SECOND USER, PRIVILEGES ARE FOR A DATA ANALYST
-- DATA ANALYSTS GET READ ONLY ACCESS WHICH IS ONLY THE SELECT STATEMENT
GRANT 
	SELECT
ON db_paakasa.*
TO 'JaneDoe'@'localhost';