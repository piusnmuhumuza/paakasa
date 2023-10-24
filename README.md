# PAAKASA

## Business Database Project Design

### Introduction

Databases are structured collections of data that allow this data to be easily accessed, managed and updated.

How data is organized in a database greatly impacts the performance of an application considering databases are the heart of most business applications, which is why It’s important to properly design databases in order to speed up queries, indexing, and storage among other processes & performance targets.  

### Reading Resource

While working on this project i utilized this resources for learning purposes;-

* [Why Is Database Design Important?](https://www.linkedin.com/pulse/why-database-design-important-colbytech/)
* [Database Design Project: Building A Business Database from Scratch](https://medium.com/@okonkwoebuka456/database-design-project-building-a-business-database-from-scratch-9f9b48944f97)
* [Why Database Character Set Matter?](https://www.linkedin.com/pulse/why-database-character-set-matter-adhika-widjaya/)
* [Understanding Database Character Sets and Collations”](https://blog.fourninecloud.com/database-character-set-charset-collation-and-their-relationship-explained-227bd5155c48)
* [Understanding Character Encoding](https://www.geeksforgeeks.org/understanding-character-encoding/)
* [Introduction to Character Encoding](https://medium.com/jspoint/introduction-to-character-encoding-3b9735f265a6)
* [The ASCII table and mapping](https://www.asciitable.com/)
* [Data Normalization: Definition, Importance, and Advantages](https://coresignal.com/blog/data-normalization/)

### The Paakasa Database process

I initially followed the process from the github repo until the Normalization and Denormalization step at which point i realized i needed to revisit the previous SQLs commands as well as the excel file and clean the data a little bit better.

I therefore embarked on proper versioning with creating branches for each step so that i can inspect and perform each step properly.

### Database Creation & Data Loading  

* I created the file <em>db_pakaasa-create.sql</em> for this step.
* I also made sure to clean the excel data a bit, reduce it and make it a bit relevant to my test project.
* I tried loading the data from csv using the sql command in file <em>db_pakaasa-load-data.sql</em> and failed due to restriction, I ran the <code>SET GLOBAL local_infile = true;</code> and checked it with <code>SHOW GLOBAL VARIABLES LIKE 'local_infile';</code> but also failed even with (value) showing ON, so run <code>SET GLOBAL local_infile = false;</code> to change value back to OFF and resorted to using the Table Import Wizard as well.
* Data was uploaded successfully(107 rows) and confirmed by running sql query <em>SELECT *
FROM TblPaakasa;</em>.

All in all at the end of the project i was working with only 94 rows after making some data cleaning.

### Normalization and Denormalization

As per tutorial, the imported data is denormalized, thus the need for, Data Normalization

Normalization involves organizing data based on assigned attributes as a part of a larger data model. The main objective of database normalization is to eliminate redundant data, minimize data modification errors, and simplify the query process.

After Normalizing the table, The table was sub-divided into the following entities

* Customers with query <code>SELECT * FROM db_paakasa.customers;</code> to confirm table.
* Categories with query <code>SELECT * FROM db_paakasa.categories;</code> to confirm table.
* Suppliers with query <code>SELECT * FROM db_paakasa.suppliers;</code> to confirm table.
* Products with query <code>SELECT * FROM db_paakasa.products;</code> to confirm table.
* Orders with query <code>SELECT * FROM db_paakasa.orders;</code> to confirm table.
* Employees with query <code>SELECT * FROM db_paakasa.employees;</code> to confirm table.

The file i used for this step was <code>db_pakaasa-data-normalization.sql</code>
  
### Database Diagram Design and Table Alterations

This section of the tutorial gave me abit of a challenge as i had to go back and forth between the SQL scripts, Excel data and [BARD](https://bard.google.com/)(As my peer programmer) to get it right.

### Creating Views, Triggers, and Stored Procedures

The file i used for this step was <code>db_paakasa-create-views-triggers-stored-procedures.sql</code>

### User Management and Privileges

The 1st user "JohnDoe" a DBA was granted full DATABASE ADMINISTRATOR PRIVILEGES.
THE 2nd user "JaneDoe" an ANALYST was granted only Read Access. 
The file i used for this step was <code>db_paakasa-user-management-privileges.sql</code>

  
### Project SQL file

After completing the project I compiled it all back into one file <code>db_paakasa.sql</code> 
Check my Documentation for [SQL Script](https://github.com/piusnmuhumuza/paakasa/blob/master/paakasa-documentation.md).


### Database Backup

I did a Data Export from my MySQL workbench to create a backup of the DB file <code>PaakasaBackUp20231024.sql</code>

### Conclusion

As part of my learning, I forked the original project to [my account](https://github.com/piusnmuhumuza/Database-Design) for learning purposes, backup and easy follow-up purposes.
Here is my [Paakasa project](https://github.com/piusnmuhumuza/paakasa) on github

I organized the files and pushed all files to the repository to complete the project.

### Tool Utilized

* [Markdown](https://www.markdownguide.org/basic-syntax/), Medium & Hashnode for this documenting my project.
* [VS CODE](https://code.visualstudio.com/download) , [MySQL WorkBench](https://www.mysql.com/products/workbench/) for the SQL.
* Google, LinkedIn & Medium for the tutorial reading material.
* [Project Documentation](https://github.com/Ebuka456/Database-Design) by [Okonkwo Chukwuebuka Malcom](https://medium.com/@okonkwoebuka456/database-design-project-building-a-business-database-from-scratch-9f9b48944f97) on github.
* I also thought it a good practice to use [BARD](https://bard.google.com/) as a peer Programmer and for quickly researching complex syntax, terminologies to save time using google search or specific sites. Its important not to add sensitive information to Bard or any chatGPT platform and also ask questions that you are familiar with a a control measure incases of genAI hallucinations. 
