USE DB_Programming

----------SQL TRANSACTIONS-------------

CREATE TABLE EMP_TRANS
(EMP_ID INT PRIMARY KEY,
DEPT_ID INT ,
AGE INT,
SALARY INT
)

SELECT * FROM EMP_TRANS

INSERT INTO EMP_TRANS VALUES
(101,1,21,90000),
(102,2,25,80000),
(103,3,26,75000)

------AUTO TRANSACTIONS--------
INSERT INTO EMP_TRANS VALUES (104,4,25,85000)
UPDATE EMP_TRANS SET SALARY=120000 WHERE EMP_ID=102
DELETE FROM EMP_TRANS WHERE EMP_ID=105

SELECT @@TRANCOUNT

-------IMPLICIT TRANSACTIONS--------
SET IMPLICIT_TRANSACTIONS ON 
INSERT INTO EMP_TRANS VALUES (105,5,25,85000)

UPDATE EMP_TRANS SET SALARY=120000 WHERE EMP_ID=104

DELETE FROM EMP_TRANS WHERE EMP_ID=105

SELECT @@TRANCOUNT AS OPENTANSACTIONS

DECLARE @P1 INT
SET @P1 = 1
IF @P1 = 1
BEGIN
    COMMIT
END
ELSE
BEGIN
    ROLLBACK
END

SELECT @@TRANCOUNT AS OPENTANSACTIONS

---------EXPLICIT TRANSACTIONS----------
BEGIN TRANSACTION 
INSERT INTO EMP_TRANS VALUES (106,6,25,85000)
BEGIN TRANSACTION 
UPDATE EMP_TRANS SET SALARY=120000 WHERE EMP_ID=106
BEGIN TRANSACTION 
DELETE FROM EMP_TRANS WHERE EMP_ID=104

SELECT @@TRANCOUNT AS OPENTANSACTIONS

DECLARE @P2 INT
SET @P2 = 1
IF @P2 = 1
BEGIN
    COMMIT
END
ELSE
BEGIN
    ROLLBACK
END

SELECT @@TRANCOUNT AS OPENTANSACTIONS

-------SAVEPOINT TRANSACTIONS-----------------
BEGIN TRANSACTION
	INSERT INTO EMP_TRANS VALUES (107,25,25,123456)
		SAVE TRANSACTION DELETEPOINT
		DELETE EMP_TRANS WHERE EMP_ID =101
		ROLLBACK TRANSACTION DELETEPOINT
COMMIT










