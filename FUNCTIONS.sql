USE DB_Programming

-------------FUNCTIONS-------------
SELECT GETDATE();
SELECT APP_NAME();
SELECT CURRENT_USER
DECLARE @FNAME VARCHAR ( 100)
SELECT COALESCE(@FNAME , 'PRATIK')
--USER DEFINED FUNCTIONS
CREATE FUNCTION ADDDIGIT (@num1 INT,@num2 INT)
RETURNS INT
AS 
BEGIN
DECLARE @RESULT INT;
SET @RESULT=@num1+@num1
RETURN @RESULT
END
--SELECT dbo.ADDDIGIT (2,4)
----------------------
CREATE FUNCTION TOTALMARKS (@ROLLNO INT)
RETURNS INT
AS 
BEGIN
DECLARE @RESULT INT;
SELECT @RESULT=(ENGLISH+MATHS+SCIENCE) FROM STUDENT_MARKS WHERE ROLLNO=@ROLLNO
RETURN @RESULT
END
--SELECT dbo.TOTALMARKS (1)

--TABEL VALUED FUNCTIONS
CREATE FUNCTION GETSTUDENTLIST (@TOTAL INT)
RETURNS TABLE
AS
RETURN SELECT * FROM STUDENT_MARKS WHERE (ENGLISH+MATHS+SCIENCE) > @TOTAL
--SELECT * FROM  dbo.GETSTUDENTLIST(250)

--MULTI-STATEMENT TABEL VALUED FUNCTIONS
 CREATE FUNCTION multistatement(@ROLLNO INT)
 RETURNS @MARKSHEET TABLE(ROLLNO INT,[NAME] VARCHAR (50) ,AVERAGE DECIMAL (4,2))
 AS 
 BEGIN
 DECLARE @PER DECIMAL(4,2)
 DECLARE @NAME VARCHAR (100)

 SELECT @NAME = [NAME] FROM STUDENT_MARKS WHERE ROLLNO=@ROLLNO
 SELECT @PER =((ENGLISH+MATHS+SCIENCE)/3) FROM STUDENT_MARKS WHERE ROLLNO=@ROLLNO

 INSERT INTO @MARKSHEET ([NAME],ROLLNO,AVERAGE)
 SELECT @NAME,ROLLNO,@PER FROM STUDENT_MARKS WHERE ROLLNO=@ROLLNO

 RETURN
 END
 SELECT * FROM  dbo.multistatement(1)
