--TASK 1
GO
USE MASTER
GO 
CREATE DATABASE Teachers

GO 
USE Teachers
GO
CREATE TABLE Posts
(
Id INT PRIMARY KEY NOT NULL,
[NAME] NVARCHAR(20) NOT NULL
)

GO
CREATE TABLE Teachers_Table
(
Id INT  PRIMARY KEY NOT NULL,
[Name] NVARCHAR(20) NOT NULL,
PostId INT NOT NULL,
CONSTRAINT FK_PostId FOREIGN KEY(PostId) REFERENCES Posts(Id),
Code CHAR(10) ,
Tel NVARCHAR(7) ,
SALARY INT ,
Rise NUMERIC(6,2),
HireDate DATETIME
)



-- TASK 2
GO
ALTER TABLE Teachers_Table
DROP CONSTRAINT FK_PostId
GO
DROP TABLE POSTS

--TASK 3
GO 
ALTER TABLE Teachers_Table
DROP COLUMN PostId



--TASK 4
GO
ALTER TABLE Teachers_Table
ADD CONSTRAINT Ck_HireDate CHECK(HireDate>='01/01/1990')


--TASK 5
GO
ALTER TABLE Teachers_Table
ADD CONSTRAINT UQ_Code UNIQUE (Code)

--task 6

GO
ALTER TABLE Teachers_Table
ALTER COLUMN Salary NUMERIC(6,2)


--TASK 7

GO 
ALTER TABLE Teachers_Table
ADD CONSTRAINT CK_Salary CHECK(Salary>1000 AND Salary<5000)

--TASK 8
GO
EXEC SP_RENAME 'DBO.Teachers_Table.TEL', 'Phone','COLUMN'


--TASK 9
GO
ALTER TABLE Teachers_Table
ALTER COLUMN PHONE CHAR(11)

--TASK 10

GO
CREATE TABLE Posts
(
Id INT PRIMARY KEY NOT NULL,
[NAME] NVARCHAR(20) NOT NULL
)

--TASK 11
GO
ALTER TABLE POSTS
ADD CONSTRAINT CK_Name CHECK([Name]='Professor' OR [Name]='Docent'OR [Name]='Teacher'OR [Name]='Assistant')


--TASK 12
GO
ALTER TABLE Teachers_Table
ADD CONSTRAINT CK_Name_TEACHER CHECK([Name] LIKE '%[A-Za-z]%')


--TASK 13
GO
ALTER TABLE Teachers_Table
ADD IdPost INT



--TASK 14
GO
ALTER TABLE Teachers_Table
ADD CONSTRAINT FK_IdPost FOREIGN KEY(IdPost) REFERENCES Posts(Id)


--TASK 15
GO
INSERT INTO Posts(Id, Name) 
VALUES (1, N'Professor') 
INSERT INTO Posts (Id, Name) 
VALUES (2, N'Docent') 
INSERT INTO Posts (Id, Name) 
VALUES (3, N'Teacher')
INSERT INTO Posts (Id, Name) 
VALUES (4, N'Assistant ')
 GO
INSERT INTO Teachers_Table(Id, [Name], Code, IdPost, phone, Salary, Rise, HireDate) 
VALUES (1, N'Sidorov ','0123456789', 1, NULL, 1070, 470, '01 .09.1992'); 
INSERT INTO Teachers_Table (Id, [Name], Code, IdPost, phone, Salary, Rise, HireDate) 
VALUES (2, N'Ramishevsky ','4567890123', 2,' 4567890 ', 1110, 370, '09 .09.1998'); 
INSERT INTO Teachers_Table (Id, [Name], Code, IdPost, phone, Salary, Rise, HireDate) 
VALUES (3, N'Horenko ','1234567890', 3, NULL, 2000, 230, '10 .10.2001'); 
INSERT INTO Teachers_Table (Id, [Name], Code, IdPost, phone, Salary, Rise, HireDate) 
VALUES (4, N'Vibrovsky ','2345678901', 4, NULL, 4000, 170, '01 .09.2003'); 
INSERT INTO Teachers_Table (Id, [Name], Code, IdPost, phone, Salary, Rise, HireDate) 
VALUES (5, N'Voropaev ', NULL, 4, NULL, 1500, 150, '02 .09.2002'); 
INSERT INTO Teachers_Table (Id, [Name], Code, IdPost, phone, Salary, Rise, HireDate) 
VALUES (6, N'Kuzintsev ','5678901234', 3,' 4567890 ', 3000, 270, '01 .01.1991')
