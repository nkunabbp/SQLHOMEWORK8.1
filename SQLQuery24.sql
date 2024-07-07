-- 1
CREATE PROC FactorialFunction
AS
BEGIN
	DECLARE @num AS int = 5 , @Factorial AS int = 1 , @i AS int = 1 
	IF @num > 0
		BEGIN
	
			WHILE @i <= @num  
				BEGIN
					SET @Factorial *= @i  
					SET @i = @i + 1
				END
		END
	ELSE
		PRINT 'Factorial cannot be 0!'
	PRINT @Factorial
END

EXEC FactorialFunction

-- 2

USE [Library]

CREATE PROC LazyStudentss
    @StudentsCount INT OUTPUT 
AS
BEGIN
	SELECT  S.FirstName , S.Id , SC.Id_Student
	FROM Students AS S
	LEFT JOIN S_Cards AS SC
	ON S.Id = SC.Id_Student 
	WHERE SC.Id_Student IS NULL;
	
	    SELECT @StudentsCount = COUNT(*)
    FROM Students S
    WHERE S.Id NOT IN (SELECT DISTINCT Id_Student FROM S_Cards);

	IF @StudentsCount > 0
		BEGIN
			PRINT N'This '
			+ CAST(@StudentsCount AS nvarchar(5))
			+ 'much students are lazy.'
			
		END
END

DECLARE @CountLazyStudents INT;

EXEC LazyStudentss @StudentsCount = @CountLazyStudents OUTPUT;