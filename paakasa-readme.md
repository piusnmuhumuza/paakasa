# PAAKASA

## Business Database Project Design

### Introduction

Database are structured collections of data tha allow this data to be easily accessed, managed and updated.

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

#### Database Creation & Data Loading  

* I created the file <em>db_pakaasa-create.sql</em> for this step.
* I also made sure to clean the excel data a bit, reduce it and make it a bit relevant to my test project.
* I tried loading the data from csv using the sql command in file <em>db_pakaasa-load-data.sql</em> and failed due to restriction, I ran the <code>SET GLOBAL local_infile = true;</code> and checked it with <code>SHOW GLOBAL VARIABLES LIKE 'local_infile';</code> but also failed even with (value) showing ON, so run <code>SET GLOBAL local_infile = false;</code> to change value back to OFF and resorted to using the Table Import Wizard as well.
* Data was uploaded successfully(107 rows) and confirmed by running sql query <em>SELECT *
FROM TblPaakasa;</em>.

#### Normalization and Denormalization

As per tutorial, the imported data is denormalized, thus the need for, Data Normalization

Normalization involves organizing data based on assigned attributes as a part of a larger data model. The main objective of database normalization is to eliminate redundant data, minimize data modification errors, and simplify the query process.

After Normalizing the table, The table was sub-divided into the following entities

* Customers with query <em>SELECT * FROM db_paakasa.customers;</em> to confirm table.
* Categories with query <em>SELECT * FROM db_paakasa.categories;</em> to confirm table.
* Suppliers with query <em>SELECT * FROM db_paakasa.suppliers;</em> to confirm table.
* Products with query <em>SELECT * FROM db_paakasa.products;</em> to confirm table.
* Orders with query <em>SELECT * FROM db_paakasa.orders;</em> to confirm table.
* Employees with query <em>SELECT * FROM db_paakasa.employees;</em> to confirm table.
  
### Conclusion

As part of my learning i forked the original project to [my account](https://github.com/piusnmuhumuza/Database-Design) for learning purposes, backup and easy follow-up purposes.
Here is my [Paakasa project](https://github.com/piusnmuhumuza/paakasa) on github

### Tool Utilized

* [Markdown](https://www.markdownguide.org/basic-syntax/), Medium & Hashnode for this documenting my project.
* [VS CODE](https://code.visualstudio.com/download) , [MySQL WorkBench](https://www.mysql.com/products/workbench/) for the SQL.
* Google, LinkedIn & Medium for the tutorial reading material.
* [Project Documentation](https://github.com/Ebuka456/Database-Design) by Okonkwo Chukwuebuka Malcom on github.
* I also thought it a good practice to use [BARD](https://bard.google.com/) as a peer Programmer and for quickly researching complex syntax, terminologies to save time using google search or specific sites. Its important not to add sensitive information to Bard or any chatGPT platform and also ask questions that you are familiar with a a control measure incases of genAI hallucinations. 
*  