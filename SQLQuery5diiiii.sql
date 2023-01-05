--1. Create a database "Teachers" and add two tables to it. 


CREATE DATABASE Teachers

CREATE TABLE POSTS (
	Id int PRIMARY KEY ,
	[Name] nvarchar(20) NOT NULL,
)

CREATE TABLE TEACHERS (
	Id int PRIMARY KEY ,
	[Name] nvarchar(15),
	Code char(10),
	IdPost  int FOREIGN KEY REFERENCES POSTS(Id),
	Tel CHAR (7) ,
	Salary int,
	Rise numeric(6,2),
	HireDate datetime,
)



--2. Delete the "POSTS" table.  
ALTER TABLE TEACHERS
DROP CONSTRAiNT FK__TEACHERS__IdPost__4E88ABD4
DROP TABLE POSTS

--3.	In the "TEACHERS" table, delete the "IdPost" column.  

ALTER TABLE TEACHERS
DROP COLUMN IdPost

--4.	For the "HireDate" column, create a limit: the date of hiring must be at least 01/01/1990.  

ALTER TABLE TEACHERS
ADD CONSTRAINT  cnt_Hire_Date CHECK(HireDate>'01/01/1990')


--5.	Create a unique constraint for the "Code" column

ALTER TABLE TEACHERS
ADD CONSTRAINT UQ_teachers_code UNIQUE(Code)

--6.	Change the data type In the Salary field from INTEGER to NUMERIC (6,2).  

ALTER TABLE TEACHERS 
ALTER COLUMN Rise NUMERIC (6,2)

--7.	Add to the table "TEACHERS" the following restriction: the salary should not be less than 1000, but also should not Exceed 5000.  

ALTER TABLE TEACHERS
ADD CONSTRAINT CHK_Teachers_Salary CHECK(Salary>1000 AND Salary<5000)

--8.	Rename Tel column to Phone

sp_rename 'TEACHERS.Tel', 'Phone', 'COLUMN';

--9.	Change the data type in the Phone field from CHAR (7) to CHAR (11).  

ALTER TABLE TEACHERS
ALTER COLUMN Phone char(11)

--10.	Create again the "POSTS" table. 

CREATE TABLE POSTS (
	Id int PRIMARY KEY ,
	[Name] nvarchar(20) NOT NULL,
)

--11.	For the Name field of the "POSTS" table, you must set a limit on the position 
--(professor, assistant professor,  teacher or assistant). 

ALTER TABLE POSTS
ADD CONSTRAINT CHK_Teachers_Name CHECK([Name]='professor' OR [Name]='assistant professor' OR [Name]='teacher')

--12 Anlamadim

--13.	Add the IdPost (int) column to the "TEACHERS" table.  

ALTER TABLE TEACHERS
ADD IdPost int

--14.	Associate the field IdPost table "TEACHERS" with the field Id of the table "POSTS". 

ALTER TABLE TEACHERS
ADD CONSTRAINT FK_Teachers_IdPost FOREIGN KEY (IdPost) REFERENCES POSTS(Id)

--15.	Fill both tables with data. 
 
INSERT INTO POSTS (Id, [Name])  
VALUES (1, N'Professor ');  
INSERT INTO POSTS (Id, Name)  
VALUES (3, N'teacher');  
INSERT INTO POSTS (Id, Name)  
VALUES (4, N'assistant professor '); 
  
INSERT INTO TEACHERS (Id, Name, Code, IdPost, Phone, Salary, Rise, HireDate)  
VALUES (8, N'Sidorov ',' 0129 ', 5, NULL, 1070, 470, '01 .09.1992');  
INSERT INTO TEACHERS (Id, Name, Code, IdPost, Phone, Salary, Rise, HireDate)  
VALUES (11, N'Ramishevsky ',' 453 ', 62,' 45678', 1110, 370, '09 .09.1998');  
INSERT INTO TEACHERS (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)  
VALUES (3, N'Horenko ',' 12345 ', 3, NULL, 2000, 230, '10 .10.2001');  
INSERT INTO TEACHERS (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)  
VALUES (4, N'Vibrovsky ',' 234567 ', 4, NULL, 4000, 170, '01 .09.2003');  
INSERT INTO TEACHERS (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)  
VALUES (5, N'Voropaev ', NULL, 4, NULL, 1500, 150, '02 .09.2002');  
INSERT INTO TEACHERS (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate)  
VALUES (6, N'Kuzintsev ',' 5678901 ', 3,' 4567890 ', 3000, 270, '01 .01.1991'); 



--16.	Create a view:  

CREATE VIEW TeachS
AS
SELECT *
FROM POSTS

CREATE VIEW TeachersOpt
AS 
SELECT *
FROM TEACHERS

--16.1.	All job titles

SELECT Name From TeachS

--16.2.	All the names of teachers.  

Select Name FROM TeachersOpt

--16.3.	The identifier, the name of the teacher, his position, the general s / n (sort by s \ n). 

SELECT Id,[Name],Salary,HireDate 
FROM TeachersOpt
Order BY Id DESC


--16.4.	Identification number, surname, telephone number (only those who have a phone  number).  

SELECT Id,[Name],Code,Phone
FROM TeachersOpt
WHERE Phone IS NOT NULL


--16.5.	Surname, position, date of admission in the format [dd/mm/yy].  

SELECT [Name] ,HireDate
FROM TeachersOpt
GROUP BY [Name] , HireDate
HAVING HireDate='dd.mm.yy'
