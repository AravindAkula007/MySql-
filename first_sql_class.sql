show databases; 
create database Practicedb10; ## creation of database name
-- selecting the practicedb10(it will be in bold colored, all the belo data will be created in this..)
use practicedb10; ## Run this command to start
show tables; ## Displays the table
#####################################################################################
## Creating table with data
create table Students (sid int, Sname char(30), Age int, Course char(20)); 
## Displays/Describes the content of students table
desc students; 
describe students; ## same command we can use either desc or describe
## inserting values, excute only once.
insert into students values (1,"Aravind",28,"MySql"); 
insert into students values (2,"Abhinav",26,"MySql");
## select --> prints, * --> All rows/col, students--> from tables.
select * from students; 
############################################################################3
-- Patients Table
create table Patients (Pid int, Pname varchar(30), DOB date, TOA datetime);
insert into patients values (1, "Aravind", "1993-01-07", "2024-04-05 10:07:00");
insert into patients values (2, "ABC", "1993-02-10", now()); ## now() gives the current system time.
select * from patients;
select year (DOB) from Patients; ## returns only year from DOB
select monthname(dob) as Month_Name from Patients; ## returns MonthName from DOB, Month_Name is an Alias for column.
select now(); -- print current system time
###############################################################################
-- Operations
select 2*3;
select 2+3;
select 2-3;
select 10/5;
select 2>3 as Comapring; -- 0 means false, 1 means true. Comapring is aan Alias means renaming column
select 2<3 as Result; -- 0 means false, 1 means true. Results is aan Alias means renaming column
######################################################################3
-- DDL (Alter, Create, Drop, Rename, Truncate)
## Alter command
desc students; ## Describe the table
alter table students add column Marks int; ## To add the column
alter table students drop column age; ## To drop the column from table
alter table students modify column sname varchar(30); ## To modify(Char to Varchar) the column
alter table students change column sid std_id int; ## To change the column from sid to std_id
alter table students rename to MyStudents; ## To rename the column from students to MyStudents.
desc mystudents;
-- drop command
## drop table patients;
-- Rename command
Rename table mystudents to students;
-- Truncate
Truncate table patients; ## Empty/delete the data from table and we cn recreate and it's similar to delete command.
select * from patients;
####################################################################
-- DML Commnads (Insert, Update, Delete)
select * from students;
## inserted command new data in 3 & 4 Row.
insert into students (std_id, sname, marks) values (3, "Tom", 90), (4, "Jerry", 80) 
-- Update Command
set sql_safe_updates = 0;
set sql_safe_updates = 0; -- to turnoff the safe mode before updating.
update students set sname = "John" where std_id = 2;
update students set course = "DataAnalyst" where std_id = 1;
update students set course = "DataAnalyst" where sname = "Aravind" and marks = 95;
select * from students;
-- Null (has no Value) use "is" or "is not"
select 2 = Null as results;
select 2 is null as results; -- Gives false
select 2 is not null as results; -- Gives true
update students set marks = 0 where marks is null; -- To insert 0 where the value is null.
-- Delete Command
delete from students where marks is null; -- delete specific record
delete from students; -- delete entire data from table
select * from students;
########################################################################
-- DQL Command (Select)
create table MyEmp (Emp_id int, Fname varchar(30), Lname varchar(30), DOJ int, Salary int); 
insert into myemp values (100, "Steve", "Smith", 1996-05-10, 25000);
insert into myemp values (101, "Virat", "Kohli", 1997-03-15, 35000);
insert into myemp values (102, "MS", "Dhoni", 1993-05-05, 45000);
insert into myemp values (103, "Sachine", "Tendulkar", 1997-06-10, 45000);
insert into myemp values (104, "Robin", "Uttahpa", 1997-06-15, 25000);
insert into myemp values (105, "Harbhajan", "Singh", 1990-05-05, 35000);
insert into myemp values (106, "Raju", "Sachine", 1997-08-10, 25000);
insert into myemp values (107, "John", "Cena", 1998-10-15, 45000);
insert into myemp values (108, "Gabbar", "Singh", 1990-05-05, 35000);
insert into myemp values (109, "Himader", "Raj", 1997-08-10, 25000);
insert into myemp values (110, "Stve", "Hotin", 1998-10-15, 45000);
select * from myemp;
select * from myemp limit  3; ## limit = displays only 3 rows.
select * from myemp limit  2,1; ## limit 2,1 = skips 2 rows/records and displays the next row from 1.
select emp_id,Fname,Lname,salary, salary * 0.2 as Bonus from myemp; ## only Bonus column with adding 0.2 (20%) to there salaries.
select emp_id,Fname,Lname,salary + salary * 0.2 as Total_Salary from myemp; ## Bonus + Salary in Total_Salary
-- Distinct (Distinct -> Unique)
select distinct emp_id from myemp order by emp_id desc;
select distinct emp_id,fname from myemp order by emp_id; 
select distinct fname from myemp order by fname desc;
########################################################################
-- Operators (=, >, <= ,<, <=, !=, Like, AND, OR, IN, BETWEEN)
select * from myemp;
select * from myemp where emp_id = 102; ## getting 102 id details
select * from myemp where emp_id != 102; ## skipping id 102
select * from myemp where salary >= 30000; ## getting salaries greater than 30k
########################################################################
-- Like (% used for any char length, _ used for fixed char length)
select * from myemp;
select * from myemp where fname like "s%"; ## starts with S letter without any fixed length of char
select * from myemp where fname like "%e"; ## ending with E letter without any fixed length of char
select * from myemp where fname like "%i%"; ## displays the I letter from entire fname.
select * from myemp where fname like "____e%"; ## displays 5th char as E char length from fname.(ex: _ _ _ _ e)
select * from myemp where fname like "S______"; 
select * from myemp where DOJ like "%1"; ## displays ending with 1 from DOj column
########################################################################
-- AND Operator (Both the conditions must be TRUE)
select * from myemp;
select * from myemp where Emp_id = 102 and salary >35000;
select * from myemp where emp_id = 104 and salary >20000;
-- OR Operator(Any one of the condition must be TRUE)
select * from myemp;
select * from myemp where Emp_id = 102 or salary > 50000;
-- In Operator(To check more than two departments or columns)
select * from myemp;
select * from myemp where Emp_id in (100,102,104,105); ## Displays emp id with mentioned.
-- Between Operator(To Check the Range of the data)
select * from myemp where salary between 30000 and 50000 order by salary; ## Displays salary between 30k to 50k
########################################################################
-- Colease (Displays the first Non-null value from the table of the data. )
select coalesce(null, null, "Hello", Null, "World") as Results; ## as is used for Alias
select coalesce(null, 1, "Hello", 5, Null) as Output;
########################################################################
-- Case Statement (similar to If else statement)
select emp_id,fname,lname,salary, case
when salary = 25000 then "D Grade Employee"
when salary = 35000 then "C Grade Employee"
when salary = 45000 then "B Grade Employee"
when salary = 65000 then "A Grade Employee"
when salary >= 65000 then "A+ Grade Employee"
else "None"
end as Grades from myemp;
########################################################################
-- Aggregate/GroupBy functions (Sum, Avg, Min, Max, Count, Group By)
select * from myemp;
select sum(salary) as Total_salary from myemp;
select avg(salary) as Average_Salary from myemp;
select min(salary) as Minimum_Salary from myemp;
select max(salary) as Maximum_Salary from myemp;
select count(salary) as Count_Salary from myemp;
select sum(salary), avg(salary), min(salary), max(salary), count(salary) from myemp;
select count(*) as Total_Records from myemp; ## * means all Rows and Col
select count(*) from myemp where salary >= 45000;
-- Group by(Groups the data)
select emp_id, avg(salary) from myemp group by Emp_id; ## groupby gives the results on group empid
select emp_id, avg(salary) from myemp where emp_id in (100,102,104,106) group by emp_id order by emp_id;
select avg(salary) from myemp group by emp_id; ## Getting avg salary in each dept_id example
select emp_id, count(*), avg(salary) from myemp group by emp_id; ## Groupng emp_id and displaaying count and avg salary.
####################################################################
-- Constraints(Req Fields *) Types are: 
-- 1) Domain ()
## Unique : Emp_id, Dep_id (Ensures all values in a column are different.Both P.K & U.K provides uniqueness. Can have many unique keys and it contains null values)
## NOT NULL : Fname
## Check : Age
## Default : Courses
## ENUM : Gender
-- 2) Key
## Primary Key
-- 3) Refrential Integrity
## Foreign Key

create table student (sid int unique,
					  sname varchar(30) NOT NULL,
                      Age int check (Age > 21),
                      Course Varchar(20) default "MySql",
                      Gender Enum ("Male", "Female"));
desc student;

insert into student values (1, "Aravind", 30, "MySql", "Male");
insert into student values (2, "Sairam", 29, "MySql", "Male");
insert into student values (3, "Nikhitha", 26, "MySql","Female");
insert into student values (4, "Anamika", 31, "MySql", "Female");
insert into student values (5, "Akash", 27,"MySql", "Male");
select * from student;
## Checking with constarints
insert into student (sid, sname, age, course, gender) values (1, Null , 30, "MySql", "Male"); ## Error : Sname cannot be null
insert into student (sid, sname, age, course, gender) values (1, "Sairam", 29, "MySql", "Male"); ## Error : Sid is duplicate cuz it's unique
insert into student (sid, sname, age, course, gender) values (3, "Nikhitha", 20, "MySql","Female"); ## Error : check is violated cuz > 21
insert into student (sid, sname, age, course, gender) values (6, "Anamika", 31, default, "Female"); ## Error : fills default values to mysql
insert into student (sid, sname, age, course, gender) values (5, "Akash", 27,"MySql", "others"); ## Error : Accepts only M or F.

-- Primary Key
## Uniquely identifies each record in a table.
## Primary key must have unique values, but not at all NULL VALUES.
## The table must has only ONE primary key,
## Primary key automatically has a unique constraint and can have single or multiple columns. 
create table sample (sid int primary key, sname varchar (30) not null);
desc sample;
insert into sample values (1, "Tom");
insert into sample values (null, "Tom"); ## Sid cannot be NULL as it is P.Key
select * from sample;

-- Moifying the constraits by using ALTER
create table sample2 (sid int);
desc sample2;
alter table sample2 modify sid int unique not null default "0";
desc sample2;
alter table sample2 drop index sid;
alter table sample2 alter column sid drop default; ## Deletes the 0 from default
alter table sample2 modify column sid int null; ## changes from NOT NULL to NULL
alter table sample2 modify column sid int primary key; ## Again setting to P.K from U.K
desc sample2;

-- Foreign Key ()
## A Foreign Key is a field in one table and REFERS to the Primary key of the another table.
## The Primary key table contains called as "PARENT TABLE" and Foreign key table contains called as "CHILD TABLE"
## Table, which is requesting the data called as "CHILD TABLE".
## Table, which is providing the data called as "PARENT TABLE". 
create table persons (Pid int primary key, 
					  Fname varchar (30) not null,
                      Lname varchar (30),
                      Age int check (Age > 21));
desc persons;
insert into persons values (1, "Hansen", "Ola", 30);
insert into persons values (2, "Svendson", "Tove", 23);
insert into persons values (3, "Pettersen", "Kari", 25);
select * from persons;

create table orders (OrderID int primary key,
					 Ordernum int not null,
                     Pid int, foreign key (Pid) references persons (Pid));
desc orders;
insert into orders values (1, 77895, 3);
insert into orders values (2, 77833, 3);
insert into orders values (3, 77841, 2);
insert into orders values (4, 76548, 1);
insert into orders values (5, 77896, 3);
insert into orders values (6, 77837, 3);
insert into orders values (7, 77840, 2);
insert into orders values (8, 76545, 1);
insert into orders values (9, 77855, 2);
insert into orders values (10, 76565, 1);

select * from orders;
select * from persons;
-- To drop a Foreign Key
alter table orders drop foreign key Pid;

-- Delete and Modify 
delete from orders where pid = 1; ## Deleted the Pid contains 1
update persons set pid = 22 where pid = 2;
alter table orders drop index pid; ## drops pid from orders
select * from persons;
#########################################################################
-- Auto Increment(It will insert the numerical values automatically by itself)
create table sample3 (sid int primary key auto_increment,
					  sname varchar(20),
                      age int,
                      course varchar(20));
desc sample3;
insert into sample3 (sname,age,course) values ("Tom", 22, "MySql"),("Jerry", 24, "MySql"),("Aravind", 25, "Data Analyst");
select * from sample3;
alter table sample3 auto_increment = 100; ## Auto_Increment starts from : 100.
insert into sample3 (sname,age,course) values ("Tom", 22, "MySql"),("Jerry", 24, "MySql"),("Aravind", 25, "Data Analyst");

-- delete 
set sql_safe_updates = 0; -- to turnoff the safe mode before updating.
delete from sample3; ## deleted entire data.
insert into sample3 (sname,age,course) values ("Tom", 22, "MySql"),("Jerry", 24, "MySql"),("Aravind", 25, "Data Analyst");
select * from sample3;
-- Truncate (Deletes all the rows from the existing table, leaving the row with the column names, starts from left over index, dleted 102 rows, now starts from 103)
insert into sample3 (sname,age,course) values ("Tom", 22, "MySql"),("Jerry", 24, "MySql"),("Aravind", 25, "Data Analyst");
select * from sample3;
##################################################################################################
-- Joins 
## Inner Join : Return's records that have common or matching values from both the tables 
## Left Join : Returns all records from the left table 1, and also matching records, if any, from the table2
## Right Join : Returns all records from the Right table 2, and also matching records, if any, from the table1
## Cross/Full Join : Returns all records from both the tables, whether the tables matches or not 
## Self Join : It is a self joined by itself 

## Parent Table
create table movies (id int unique,
					 title varchar(30),
                     category varchar(20));
desc movies;
insert into movies values (1, "Pushpa", "Action Movie");
insert into movies values (2, "RRR", "Action Movie");
insert into movies values (3, "Bhubali", "Animation Movie");
insert into movies values (4, "DJ Tillu", "Action Movie");
insert into movies values (5, "Devil Hunt", "Horror Movie");
insert into movies values (6, "Kanchana", "Horror Movie");
insert into movies values (7, "Rowdy Boy", "Action Movie");
insert into movies values (8, "Family Star", "Entertainment Movie");
insert into movies values (9, "Safe House", "Horror Movie");
insert into movies values (10, "Gitanjali", "Horror Movie");
select * from movies;

## Child Table
create table members (mem_id int unique,
					 Fname varchar(30),
                     Lname varchar(20),
                     moveid int);
desc members;

insert into members values (1, "Alicia", "Alarocn", 1);
insert into members values (2, "Don", "Draper", 2);
insert into members values (3, "Lizzie", "Moss", 5);
insert into members values (4, "One", "Chance", 8);
insert into members values (5, "Jenny", "Thomas", 10);
insert into members values (6, "Grage", "Hymen", null);
insert into members values (7, "Joson", "Roy", null);
insert into members values (8, "Mathew", "Wade", null);
select * from members;
############################################################################
-- Joins Operations:
select * from movies; ## Parent Table
select * from members; ## Child Table 
select * from members inner join movies on members.moveid = movies.id;
select * from members left join movies on id = moveid;
select * from members right join movies on id = moveid;
select * from movies cross join members;
select * from movies, members where id = 3;
select title from movies union select fname from members as results;
###############################################################################
-- TCL (Commit, RollBack, SavePoint)
## Commit : Save the changes
## Roll Back: Undo the changes
## SavePoint: 

create table sample4 (sid int, sname varchar(30));
insert into sample4 values (1, "Tom"); ## This values dont get deleted cuz we enter before starting transaction.
select * from sample4;
start transaction; ## Starting the transaction, Run this command, Auto Commit will be turned off
insert into sample4 values (2, "Jack"),(3, "Harry"),(4, "John"); ## this values gets inserted
rollback; ## now all the above 3 records will get undo and we wont able to commit or rool back for same. we have to write agin new.alter
-- Starting transaction
start transaction;
insert into sample4 values (2, "Jack"),(3, "Harry"),(4, "John");  ## this values gets inserted
select * from sample4;
commit; ## Once after commitng we cant do roll back.

select * from sample4;
start transaction;
insert into sample4 values (5, "A"),(6, "B");  ## this values gets inserted
savepoint sb; ## sb is used to rollback to particular savepoint.
insert into sample4 values (7, "C"),(8, "D");  ## this values gets inserted
savepoint ss;
insert into sample4 values (9, "E"),(10, "F");  ## this values gets inserted
rollback to ss; ## Saves till A,B,C,D and doesnt save E,F.
rollback to sb; ## Saves till A,B and doesnt save C,D.
commit;
select * from sample4;
############################################################################################
-- Views (Views are virtual tables that are created on top of a select command. A view is created with the CREATE VIEW statement.)
select emp_id,Fname,Lname,salary, salary * 0.2 as Bonus from myemp; ## using this staement as View.
create view Emp_Bonus as select emp_id,fname,lname,salary,salary * 0.2 as Bonus from myemp;
select * from Emp_Bonus; ## Next time just use this emp_bonus, you will get the code excuted.instead of writing the lengthy code we use to store in a view, access it.

select * from sample3; ## using this staement as View.
create view Newsample3 as select * from sample3; ## Created View as Newsample3
insert into newsample3 (sname,age,course) values ("Ranjith", 25, "DS"),("Kaoushik", 27, "MySql"); ## using updated view "newsample3", we've inserted 2 records.
select * from newsample3;
#################################################################################################
-- Indexes (used to create indexes in table, and to retrieve data from the database quickly. 2-types: B tree index and hash index.) B tree index and hash index re used for large data.
## Syntax : Create index <index_name> on table_name (col 1,col 2);
##  Syntax : Create index <index_name> using (BTree) on <table_name> (col 1,col 2) ;
-- Btree Index
select * from sample3; ## using this for below example
select sid,sname,course,age from sample3 where age >= "23"; ## displaying age greater/= than 23
create index indexname using btree on sample3 (age); ## created indexname using btree on sample3 tablename.
show indexes from sample3; ## works as describe command.

-- Hash Index
## Hash Index is much faster than btree. Must use = to search.
## 3 types : Unique,Spacious,Full Text. If we use this types, automatially Btree is included.
## Syntax: create Unique/ Spacious/ Full Text index <index_name> using (hash) on <table_name> (col 1,col 2) ;
create table sample5 (sid int primary key, sname varchar(30), Pnumber int);
show indexes from sample5; #By default Btree is used.

create unique index testing using btree on sample5 (sname, pnumber); ## It doesnt allow sname, pnumber to be unique
insert into sample5 values (1, "Tom", 12345);
select * from sample5;
insert into sample5 values (1, "Tom", 12345); -- Error : Duplicate entry, so unique doesnt allow duplicate values in insertion.
##########################################################################################################################################
-- Stored Procedures: It allows to do programming a sql, so code can be reduced over and over again,then we can save it as stored procedure and then just call it to execute it. Can also pass parameters to it.
## Syntax : create <procedure_name> as sql_statement GO; EXEC <procedure_name>;
## Stored Procedures has : Variables, Parameters, If Cond, Loops, Exception Handlers, Cursors.
## To Open Stored Procedures, Right click on stored procedure and write the code in between  BEGIN and END.
-- Using Variables
call pro_variable(); ## 10 * 15, Using Variables only.
call proc_emp(); ## select emp_id,fname,lname,salary from myemp where emp_id >= 102;
call proc_emp(101); ## Prints 101 details (Hover cursor on proc_emp in schema and click on thunder option to enter 100,102........)
call proc_emp(103);
-- Using Parameters
call sample (@avg); ## Using Parameters & Passing Variables Statement
select @avg;
-- Using if Conditions
call proc_if_condition(100); ## Using If Condition Statement
-- Using Loops
## syntax : loopname:loop ...........end loop <loopname>
call proc_loop(3); ## Using loop.(Run in sql command line : 1.password, 2.use practicedb10 3.call proc_loop();)
-- Using Exception Handlers : Error codes, SQL State, SQL Exception.
call proc_excep (cid, amt);
-- Cursors
## Syntax : declare <cursor_name> cursor for select command....
## Open <cursor name>
## fetch data
call proc_cursor(); ## fetch the products as per code in command line.
-- User defined functions()
##########################################################################################################
-- SubQueries
## Writing a query within a query is known as subquery.
select max(salary) from myemp;
select * from myemp where salary = 75000;

select * from myemp where salary = (select max(salary) from myemp); ## this is single value subquery, finding max salary
select * from myemp where salary > (select avg(salary) from myemp) order by salary; ## this is multiple value subquery,finding salaries greater than avg salary of all emps.
select avg(salary) from myemp;

select * from myemp as e where salary > (select avg(salary) from myemp where doj = e.doj group by doj);
##############################################################################################################
-- Triggers ()
select * from books;
select * from book_sales;
alter table books add column Sales int default 0; ## adding extra sales column using alter
## right click on table name, click alter table, click trigger and write the code 
#####################################################################################################################
-- Window Functions: Extension of Group By, OVER clause is used.
## OVER (partition by or order by) is used
## has Aggregate, first value, nth value, lead, lag, rank, dense rank functions.
select * from myemp;
-- Partition()
select fname,lname,emp_id,salary, avg(salary) over (partition by salary) as avg_salary from myemp; ## we can use either paartition by or order by, but not both.
-- Order By()
select fname,lname,emp_id,salary, avg(salary) over (order by salary) as avg_salary from myemp; ## using order by
-- Rank()
select emp_id, salary, rank() over (order by salary desc) as Rank1 from myemp; ## using Rank func, displaying ranks of salary emp's by decending order.
-- Dense_Rank
select emp_id, salary, dense_rank() over (order by salary desc) as Rank1 from myemp; ## using Dense_Rank func, displaying ranks of salary emp's by decending order.
-- FirstValue
select emp_id, fname,lname,salary, first_value(fname) over (order by salary desc) as Highest_paid from myemp; ## using first value, displaying highest paid emp name.
-- nth value
select emp_id, fname,lname,salary, nth_value(fname, 5) over (order by salary desc) as Highest_paid from myemp; ## using nth values, printing same as above, but giving the number to skip the records.
-- Lead
select emp_id,fname,salary, lead(salary, 1) over (partition by emp_id order by salary) as High from myemp; ## using Lead
-- Lag
select emp_id,fname,salary, lag(salary, 1) over (partition by emp_id order by salary) as High from myemp;
-- CTE (common table expression)
select * from myemp;
with sample_cte as 	(select emp_id,fname,lname,salary * 0.2 as Bonus from myemp) select emp_id, bonus * 100 from sample_cte; ## printing values from gain CTE (dervied)


