/* and */

CREATE TABLE Teachers (
TeacherID int IDENTITY (800, 1) NOT NULL,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(50) NOT NULL
);

TRUNCATE TABLE Teachers;

INSERT INTO Teachers (FirstName, LastName, Email)
VALUES 
('Vengai', 'Madamombe', 'vmadamombe@gmail.com'),
('Judith', 'Madamombe', 'jmadamombe@gmail.com'),
('Juliet', 'Madamombe', 'jtgmadamombe@gmail.com'),
('Vengai', 'Madamombe', 'vmadamombe@gmail.com'),
('Noah', 'Madamombe', 'nmadamombe@gmail.com'),
('Evermore', 'Madamombe', 'evervmadamombe@gmail.com'),
('Nkosana', 'Madamombe', 'nkosanamadamombe@gmail.com'),
('Francisca', 'Madamombe', 'fransmadamombe@gmail.com'),
('Joellant', 'Madamombe', 'joellantmadamombe@gmail.com')
;


SELECT *
FROM dbo.Teachers;

SELECT TOP (3) FirstName, LastName
FROM dbo.Teachers;

SELECT FirstName, LastName
FROM dbo.Teachers;


SELECT *
FROM dbo.Teachers
WHERE FirstName = 'Vengai' AND LastName ='Madamombe';

SELECT *
FROM dbo.Teachers
WHERE LastName ='Madamombe'
ORDER BY FirstName DESC;


UPDATE dbo.Teachers
SET 
FirstName = 'Brenda', 
LastName = 'Mzingwane',
Email = 'bmzingwane@gmail.com'
WHERE TeacherID = 800
;

SELECT *
FROM dbo.Students;

SELECT *
FROM dbo.Programmes;


SELECT 
	Students.StudentID,
	Students.FirstName,
	Students.LastName,
	Students.Age,
	Students.Email,
	Programmes.ProgrammeID,
	Programmes.ProgrammeDescription
FROM Students 
INNER JOIN 
Programmes ON Students.StudentID = Programmes.StudentID
;


SELECT 
	Students.StudentID,
	Students.FirstName,
	Students.LastName,
	Students.Age,
	Students.Email,
	Programmes.ProgrammeID,
	Programmes.ProgrammeDescription
FROM Students 
LEFT JOIN Programmes 
ON Students.StudentID = Programmes.StudentID
;

SELECT 
	Students.StudentID,
	Students.FirstName,
	Students.LastName,
	Students.Age,
	Students.Email,
	Programmes.ProgrammeID,
	Programmes.ProgrammeDescription
FROM Students 
RIGHT JOIN Programmes 
ON Students.StudentID = Programmes.StudentID
;

SELECT 
	Students.StudentID,
	Students.FirstName,
	Students.LastName,
	Students.Age,
	Students.Email,
	Programmes.ProgrammeID,
	Programmes.ProgrammeDescription
FROM Students 
FULL OUTER JOIN Programmes 
ON Students.StudentID = Programmes.StudentID
;

SELECT *
FROM dbo.Students;

SELECT *
FROM dbo.Programmes;


-- #Select from a view which is already created and view named students_programme_details

SELECT * FROM dbo.students_programme_details;

-- create an index in sql server

CREATE NONCLUSTERED INDEX IX_Students_LastName
ON dbo.Students (LastName ASC);

--CREATE STORED PROCEDURE

CREATE PROCEDURE dbo.StudentsAndProgrammes
AS
SELECT 
	Students.StudentID,
	Students.FirstName,
	Students.LastName,
	Students.Age,
	Students.Email,
	Programmes.ProgrammeID,
	Programmes.ProgrammeDescription
FROM Students 
LEFT JOIN Programmes 
ON Students.StudentID = Programmes.StudentID
ORDER BY FirstName
GO

EXEC dbo.StudentsAndProgrammes