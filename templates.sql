/* Creating */
/* Create  Table*/
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM table_name
    WHERE ....;

CREATE TABLE table (
    col1 datatype,
    col2 datatype,
    col3 datatype,
       ....
    );
/* Create Index*/
CREATE UNIQUE INDEX index
ON table_name (column1, column2, ...);

/* Create View*/
CREATE VIEW view AS
SELECT col1, col2, ...
FROM table
WHERE condition;

/* Deleting*/
/* Create Backup*/
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;
/* Drop Values*/
DROP TABLE table_name;
/* Drop Table*/
TRUNCATE TABLE table_name;

/*Procedures*/
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
EXEC SelectAllCustomers City = "London", PostalCode = "WA1 1DP";

/* Selecting */
SELECT DISTINCT column
FROM table1 AS t1
LEFT JOIN table2 AS t2
ON t1.primarykey = t2.foreignkey
WHERE NOT column IN (SELECT STATEMENT)
AND column BETWEEN val1 AND val2
OR column NOT LIKE "%blub_"
GROUP BY column
HAVING condition
ORDER BY column_name(s) ASC|DESC;
UNION
SELECT *
FROM table3;

/* Self Join*/
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

/* Updating*/
/* Update Values */
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

/*Insert Columns*/
ALTER TABLE Customers
ADD col1 varchar(255);

/* Insert Values */
INSERT INTO table_name (col1, col2, col3, ...) VALUES (val1, val2, val3, ...);
