--HOW TO CREATE DTABASE
create database DB_Programming
--HOW TO SELECT IN WHICH DATABASE WE ARE WORKING
use DB_Programming
--TO DROP DTABASE
drop database DB_Programming
--CHANGE DATABASE NAME
Alter database DB_Programming MODIFY NAME = DB_Programming_NEW
EXEC sp_renamedb DB_Programming_NEW,DB_Programming
--HOW TO CREATE TABLE
Create table tbl_EmployeeDetails
(
EMP_ID int primary key IDENTITY (1,1),
Emp_Name varchar (50) not null,
EMP_AGE decimal (2) not null CHECK (EMP_AGE <= 30) ,
Emp_Address varchar(250) not null,
Emp_City varchar(100) not null,
Emp_State varchar(100) not null,
Emp_Zip decimal(6) not null,
Emp_Phonenumber Decimal(12) not null UNIQUE,
Emp_EmailID varchar(50) not null UNIQUE,
Emp_BasicPay decimal (15) not null,
Emp_Department varchar (20) not null,
EMP_JOINING Datetime DEFAULT Getdate(),
CONSTRAINT ID_MOBILE_NO  UNIQUE (EMP_ID,Emp_Phonenumber) 
)
--HOW TO INSERT DATA INTO TABLE
insert into tbl_EmployeeDetails values
('Ismael Whitlatch','20','2319  Burton Avenue','Memphis','Tennessee','38117','9017658987','sa5bxlla2e@gmail.com','15000','Security','2015-02-01')
insert into tbl_EmployeeDetails values
('Christopher Forst','25','2846  Tori Lane','Salt Lake City','Utah','84113','8015870002','ctmgz50esj@gmail.com','10000','Security','2014-03-01')
insert into tbl_EmployeeDetails values
('David Washington','28','3379  Echo Lane','TULAROSA','New Mexico','88352','2699626511','wkephpw9q2@gmail.com','20000','Sales','2015-08-09')
insert into tbl_EmployeeDetails values
('Byron Daniels','26','4385  West Street','Grand Rapids','Michigan','49546','6165758233','6y4ug4knmib@gmail.com','40000','Marketing','2015-08-09')
insert into tbl_EmployeeDetails values
('James Juarez','26','12564  Clay Street','Indianapolis','Indiana','46214','3174103617','penlzpd00f@gmail.com','25000','HR','2017-01-09')
--TO SHOW VALUES IN TABLE
select * from tbl_EmployeeDetails
--ALTER TABLE COLOUMN 
ALTER TABLE tbl_EmployeeDetails ADD NOTHING VARCHAR(50) NULL
--TO MODIFY COLOUMN IN TABLE
ALTER TABLE tbl_EmployeeDetails ALTER COLUMN NOTHING DECIMAL (10) NULL
--TO DROP COLUMN 
ALTER TABLE tbl_EmployeeDetails DROP COLUMN NOTHING
--FORIEGN KEY CONSTRAINT
CREATE TABLE EMP_ATTENDANCE
(
EMP_ID INT,
EMP_ATTENDANCE varchar(10),
FOREIGN KEY (EMP_ID) REFERENCES tbl_EmployeeDetails(EMP_ID)
)
--IDENTITY --TO EXPLICITLY ADD IDENTITY IN TABLE
SET IDENTITY_INSERT tbl_EmployeeDetails ON
--TO RESET IDENTITY 
DBCC CHECKIDENT(tbl_EmployeeDetails,RESEED,10)
--TO CHECK LAST UPDATED VALUE IN TABLE 
insert into tbl_EmployeeDetails values
('Cristiano Ronaldo','28','12564  Clay Street','Funchal',' Madeira','46256','3551843513','crist007@gmail.com','45000','HR','2014-01-09')
SELECT @@IDENTITY
--TO CHECK WITH SCOPED IDENTITY --GENERATES LAST INSERTED IDENTITY VALUE REGARDLESS OF EXECUTION
CREATE PROC P1
AS
BEGIN
insert into tbl_EmployeeDetails values
('LIONEL MESSI','25','145564  ROCK Street','Rosario','Santa Fe','62556','3554560513','LImessi010@gmail.com','40000','SALES','2014-02-09')
END
SELECT @@IDENTITY
EXEC P1
SELECT SCOPE_IDENTITY()
--TO RETURN VALUE FOR LAST IDENTITY INSERTED FOR GIVEN TABLE
SELECT IDENT_CURRENT('tbl_EmployeeDetails')