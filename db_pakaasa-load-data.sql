-- INSERTING DATA INTO THE CREATED TABLE
LOAD DATA LOCAL INFILE
'G:\projects\paakasa\paakasa.csv'-- table path
INTO TABLE TblPaakasa
FIELDS TERMINATED BY ',' -- for a csv file
ENCLOSED BY '"' -- for the strings
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- ignore the headers

-- to check the table for the loaded data
SELECT *
FROM TblPaakasa;
/**
This works if you have access enabled on the User and clients side. 
Due to issues with getting access so I used the Table Import Wizard and the table was successfully
imported into the db_paakasa database created on MySQL Workbench.
**/