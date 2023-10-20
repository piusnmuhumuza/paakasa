-- Dropping the database if it exists 
DROP DATABASE IF EXISTS db_paakasa;

-- creating the database using character encoding of utf-8
CREATE DATABASE db_paakasa DEFAULT CHARACTER SET utf8mb4;

-- to check if the database was created 
SHOW DATABASES;

-- to make the db_paakasa database the active database 
USE db_paakasa;