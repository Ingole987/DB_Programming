@echo off
@echo executing functions
SQLCMD -s (localdb)\MSSQLLocalDB -d DB_Programming -E -i "C:\Users\prati\source\DB Programming\BATCH FILE.sql"
PAUSE