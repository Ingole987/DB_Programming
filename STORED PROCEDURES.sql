use DB_Programming

----------HOW TO EXECUTE STORED PROCEDURES-------------
SELECT * FROM tbl_EmployeeDetails
--CREATE 
CREATE PROC spDEPARTMENT
AS
BEGIN
SELECT *FROM tbl_EmployeeDetails WHERE Emp_Department = 'Security'
END
--ALTER
ALTER PROC spDEPARTMENT
AS
BEGIN
SELECT *FROM tbl_EmployeeDetails WHERE Emp_Department = 'Security'
SELECT *FROM tbl_EmployeeDetails WHERE Emp_Department = 'HR'
END
--DROP
DROP PROC spDEPARTMENT2
--BY GIVING PARAMETERS
CREATE PROC spDEPARTMENT2
@emp_dept VARCHAR(100) ,
@emp_age decimal(2) 
AS
BEGIN
SELECT *FROM tbl_EmployeeDetails WHERE Emp_Department = @emp_dept
SELECT *FROM tbl_EmployeeDetails WHERE Emp_AGE = @emp_age
END

EXEC spDEPARTMENT

EXEC spDEPARTMENT2 'HR',20

--OUTPUT PARAMETERS
CREATE PROC spADDNo
@Num1 INT,
@Num2 INT,
@Result INT OUTPUT
AS
BEGIN
   SET @Result=@Num1+@Num2
END
--VARIABLE TO STORE VALUE
DECLARE @RES INT
EXEC spADDNo 4,5,@RES OUTPUT
SELECT @RES

--COMMAND TO GET STORED PROCEDURE
sp_helptext spADDNo

--TO ENCRYPT STORED PROC
CREATE PROC spADDNo2
@Num1 INT,
@Num2 INT,
@Result INT OUTPUT
WITH ENCRYPTION
AS
BEGIN
   SET @Result=@Num1+@Num2
END
--VARIABLE TO STORE VALUE
DECLARE @RES INT
EXEC spADDNo2 4,5,@RES OUTPUT
SELECT @RES
--COMMAND TO GET STORED PROCEDURE
sp_helptext spADDNo2