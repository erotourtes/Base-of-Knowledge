---
title: "Sql"
date: 2023-08-03T08:10:59Z
draft: false
---


# MySql

> **Note**: it is not case sensetive  
> order matters  
> each complete statement should be terminated with ';'


---
## Basic
``` sql
USE database1; # complete statement (if you don't use database you need to specify it ex: database1.table1.field1)

SELECT row1, row2, row3 * 10 AS alias # or 'alias with spaces'
FROM table1 # case sensetive
WHERE data1 = 6 * data2 
  AND 1 != 5 
  AND arr1  IN (1, 2, 3)
  OR  arr2  NOT IN (1, 2, 7)
  OR  data3 BETWEEN 1 AND 3 # inclusive [1, 3]
  AND data4 LIKE '%name' # every data4 have 'NAME' at the end
  AND data4 LIKE '__y' # every data4 have len 3 and ends with 'Y'
  AND data5 REGEXP '^[a-h]+(1|2)$'
  AND data6 IS NULL
  AND data7 IS NOT NULL
ORDER BY data8 DESC, data9, data9 % 10
LIMIT 3 # LIMIT 6, 3 - skip 6 and take 3
```

```sql 
-- advanced select

SELECT *
FROM talbe1
WHERE id = (
	SELECT client_id
	FROM clients
	WHERE name = 'Some name'
)

-- or if compund query returns more than 1 id

SELECT *
FROM talbe1
WHERE id IN (
	SELECT client_id
	FROM clients
	WHERE name = 'Some name'
)
```


---
## Joins
### INNER join
``` sql
-- Explicit Join Syntax

SELECT o.name -- alias o is orders
FROM orders o
INNER JOIN customers c ON o.id = c.id # INNER is not necessary
```

``` sql
-- Implicit Join Syntax

SELECT order_id, first_name
FROM orders o, customers c -- however if you forgot to use where, it would apply cross join 
WHERE  o.customer_id = c.customer_id
```


```sql
-- multiple joins
-- compund joining is where table has several primary keys; so you need to join it using several conditions (JOIN ... ON true AND true)

SELECT os.id as status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
-- or USING(customer_id) # if c.customer_id and o.customer_id have the same name <customer_id>
JOIN order_statuses os
	ON o.status = os.id
```

### OUTER join
``` sql
-- outer join (left - returns all records from the first table whether the condition is true or not, rigth)

SELECT c.id, o.order_id
FROM customers c # first or left table
LEFT JOIN orders o # second or rigth table 
-- or LEFT OUTER JOIN
ON c.id = o.id
-- or USING(id) # if c.id and o.id have the same name <id>
ORDER BY c.customer_id
```

### CROSS join
Every record from `table1` would be joined with every record from `table2`
``` sql
SELECT *
FROM shippers s
CROSS JOIN products p
```

### UNION
Number of colums should be equal. The name is taken from the `table1`
``` sql
SELECT first_name
FROM customers
UNION -- union rows from different queries
SELECT name
FROM shippers
```


---
## Read | Write | Create | Delete
### Insert a record
``` sql
INSERT INTO customers
VALUES (DEFAULT, NULL, 'CA');

-- or specify the fields

INSERT INTO customers (
    city,
    state)
VALUES ('city', 'CA')

-- or multiple insertions

INSERT INTO products
VALUES 	(DEFAULT, 'Name1'), 
		(DEFAULT, 'Name2'), 
		(DEFAULT, 'Name3') 

-- or existing values

INSERT INTO table1
SELECT *
FROM orders
WHERE order_date < '1019-01-01'
```

### Create a table
``` sql 
-- copy table 

CREATE TABLE table1 AS
SELECT * FROM orders;

-- advanced copy


CREATE TABLE archived AS
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client
FROM invoices i
JOIN clients c USING (client_id)
WHERE payment_date IS NOT NULL 
```

### Update all records (or specified records)
``` sql
UPDATE invoices
SET invoice_total = payment_total/0.5, payment_total = DEFAULT, payment_date = '2019-03-01'
WHERE invoice_id = 1 AND # if not specified would update all the table, so use `SELECT` instead `UPDATE` before updating
      customer_id IN (SELECT customer_id FROM customers WHERE points > 3000)
```

### Delete all records (or specified records)
``` sql
DELETE FROM invoices -- witohut WHERE it would delete all records!!!
WHERE client_id = 2
```

### Operations with a database & a table
#### Database
```sql
DROP DATABASE IF EXISTS name1;
CREATE DATABASE IF NOT EXISTS name1;
use name1;
```

#### Table
```sql
CREATE TABLE IF NOT EXISTS customers
(
	customer_id     INT             PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50)     `CHARACTER SET latin1`          NOT NULL DEFAULT 'USER',
    email           VARCHAR(50)                                     UNIQUE
);
```

##### Alter
```sql
ALTER TABLE customers
	ADD last_name VARCHAR(50) NOT NULL AFTER first_name, -- also `ADD COLUMN` instead of `ADD`
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT '', -- `COLUMN` is optional
    DROP points;
```

##### Alter with primary / foreign keys
```sql
ALTER TABLE customers
	ADD PRIMARY KEY (order_id, customer_id),
    DROP PRIMARY KEY, -- don't specify the name of the columns
	DROP FOREIGN KEY fk_orders_customers,
    ADD FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customers (customer_id)
			ON UPDATE CASCADE
			ON DELETE NO ACTION;
```

##### Engine
```sql
ALTER TABLE customers -- takes a lot of time to rebuild a table
ENGINE = engine_name
```


---
## Functions
### Aggregate functions
`MIN, MAX, AVG, SUM, COUNT`
> COUNT counts only `IS NOT NULL` properties, to count all use COUNT(*)

```sql
SELECT 
 	MAX(invoice_total) AS highest,
 	AVG(invoice_total * 1.1) AS average,
    COUNT(DISTINCT invoice_total) AS 'distinct number of invoices'
FROM invoices
```

#### GROUP BY
> NOTE: it is better to use all NON aggregative fields in `GROUP BY` clause
```sql
SELECT state, city, SUM(invoice_total) AS total_sales
FROM invoices
JOIN clients USING (client_id)
WHERE invoice_date >= '2018-07-01'
GROUP BY state, city -- would calculate SUM for specified fields
ORDER BY total_sales DESC
```

#### HAVING
Works after `GROUP BY` clasue has applied.  
Works only with fields in `SELECT` clasue.  
Reffer to fields not by their aliases

```sql
SELECT 
	client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(*) AS total_invoices
FROM invoices
-- WHERE total_sales > 1 # unknown total_sales, works before `GROUP` has worked
GROUP BY client_id
HAVING total_sales > 500 # works after `GROUP` clasue has worked; should be in SELECT clause
```

#### WITH ROLLUP
Summarizes all the data
```sql
SELECT 
	client_id,
	SUM(invoice_total) AS total_sales,
    state,
    city
FROM invoices i
JOIN clients c USING (client_id)
GROUP BY client_id, state, city WITH ROLLUP
```

### Number
- ROUND(n), ROUND(n, digits)
- SELECT TRUNCATE(5.7345, 2) = `5.73`  
- CEILING, FLOOR, ABS, RAND
### String
- LENGTH, UPPER, LOWER, LTRIM, RTRIM, TRIM
- LEFT("KING?", 4) = KING   
- RIGHT
- SUBSTRING(str, start, len) -- or end
- LOCATE('str', 'in str')  
- CONCAT
### Date and Time
- NOW(), CURDATE(), CURTIME()
- YEAR(NOW()) -- MONTH, DATE, HOUR
- EXTRACT(DAY FROM NOW())
- DATE_FORMAT, TIME_FORMAT
- DATE_ADD, DATE_DIFF, TIME_TO_SEC

### Custom functions
Should have at least 1 modifier:
- DETERMINISTIC
- READS SQL DATA -- would have SELECT statement
- MODIFIES SQL DATA

```sql
DROP FUNCTION IF EXISTS fun;
DELIMITER $$
CREATE FUNCTION fun (
	client_id INT
)
RETURNS INTEGER
READS SQL DATA 
BEGIN
	DECLARE total_payment DECIMAL(9,2);
    
    SELECT SUM(amount)
    INTO total_payment
    FROM payments p
    WHERE p.client_id = client_id;
    
    SET @debt = ROUND(total_payment * 3);
    
	RETURN @debt;
END$$
DELIMITER ;

SELECT 
	fun(client_id) -- calling function named `fun`
FROM clients
```


---
## Conditions
- IFNULL(field, 'field is null')
- COALESCE(field1, field2, ..., 'Not assigned') -- choose first not null field
- IF
  ```sql
  SELECT 
    id,
    IF(
      YEAR(date) = YEAR(NOW())),
      'Active',
      'Archived'
    ) as Type
  FROM table
  ```
- CASE
  ```sql
  SELECT 
    id,
    date,
    CASE
  	  WHEN YEAR(date) = Year(NOW()) THEN 'Active'
      WHEN YEAR(date) = Year(NOW()) - 1 THEN 'Last year'
      ELSE 'Future'
  	END AS category
  FROM orders
  ```

---
## Complex queries

```sql
-- WHERE clause

SELECT *
FROM employees
WHERE salary > (
	SELECT AVG(salary)
 FROM employees
)
```

```sql
-- SELECT clause

SELECT 
	invoice_id,
    invoice_total,
    (
		SELECT AVG(invoice_total)
        FROM invoices
    ) as average,
    invoice_total - (SELECT average) as diff
    -- couldn't just use `average`
FROM invoices
```
```sql
-- FROM clause

SELECT * 
FROM (
	SELECT 
		client_id,
		name,
		(
			SELECT SUM(invoice_total)
			FROM invoices
			WHERE client_id = c.client_id
		) as total_sales,
		(
			SELECT AVG(invoice_total)
			FROM invoices
		) as average,
		(SELECT total_sales - average) as diff
	FROM clients c
) as summary
WHERE total_sales IS NOT NULL
```

> Complex queries could be rewritten with `joins`
```sql 
SELECT first_name as client
FROM orders
JOIN customers USING (customer_id)
WHERE order_id IN (
	SELECT order_id
	FROM order_items
	WHERE product_id = 3
);

-- or 

SELECT DISTINCT first_name as client
FROM orders o
JOIN customers c USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE product_id = 3
```

### Uncorrelated & correlated subqueries
Correlated subquery would be recalculated on each outer `WHERE` clause
```sql 
-- uncorrelated subqueries and correlated subqueries

SELECT *
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
    WHERE office_id = e.office_id -- correlated subquery;
)
```

---
## ALL | SOME | ANY | EXISTS
### ALL
```sql 
SELECT *
FROM invoices
WHERE invoice_total > ALL ( -- ALL keyword, iterates through all the values
	SELECT invoice_total
	FROM  invoices
	WHERE client_id = 3
)
```
### ANY | SOME
`= ANY` == `IN`
```sql 
SELECT *
FROM invoices
WHERE invoice_total > ANY ( -- ANY and SOME is the same;
	SELECT invoice_total
	FROM  invoices
	WHERE client_id = 3
)
```
### EXISTS
```sql
SELECT *
FROM clients c
WHERE EXISTS ( -- better imapct on a large data set because subquery would return only TRUE or FALSE and there won't be any large lists
	SELECT client_id
    FROM invoices
    WHERE client_id = c.client_id
)

-- also

SELECT *
FROM clients
WHERE client_id IN ( -- negative impact with large data because it would generate IN (1, 2, 3, ... n) and then comparing
	SELECT DISTINCT client_id
    FROM invoices
)

-- also


SELECT *
FROM clients c
LEFT JOIN invoices USING (client_id)
WHERE invoce_id IS NOT NULL
```

---
## Views
```sql
CREATE OR REPLACE VIEW view_name AS
-- CREATE VIEW view_name AS
SELECT 
	c.client_id,
    c.name,
    SUM(sales) AS total_sales
FROM clients c
JOIN sales s USING (client_id)
GROUP BY client_id, name
WITH CHECK OPTION
```

> If you modify view, some elements can be gone.  
  To prevent this use `WITH CHECK OPTION`

### Drop
`DROP VIEW view_name`
### Updatable views
It doesn't have theese:
- DISTINCT
- Aggregate FUNCTIONS
- GROUP BY / HAVING
- UNION

Updatable views can be updated C;
```sql
UPDATE view_name
SET ...
WHERE ...

DELETE view_name
WHERE ...
```

---
## Procedures
Working with sql queries through `procedures`
```sql
DROP PROCEDURE IF EXISTS procedure_name;  -- preffered way
DELIMITER $$
CREATE PROCEDURE procedure_name()
BEGIN
	SELECT *
    FROM clients_balance
    WHERE balance > 0;
END$$
DELIMITER ;
```

- procedure with a parameter

```sql
DROP PROCEDURE IF EXISTS name1;
DELIMITER $$
CREATE PROCEDURE name1(
	state CHAR(3)
)
BEGIN
	SELECT *
    FROM currency c
    WHERE c.state = state;
END$$
DELIMITER ;

CALL name('USD') -- calling procedure
```

#### checking parameters
```sql

DROP PROCEDURE IF EXISTS name1;
DELIMITER $$
CREATE PROCEDURE name1(
	state CHAR(2)
)
BEGIN
	IF state IS NULL THEN
		-- SET state = 'CA'; -- to prevent NULL situation
        SELECT  * FROM clients;
	ELSE
		SELECT *
		FROM clients c
		WHERE c.state = state;
        -- or use IFNULL in the statement `p.payment_method = IFNULL(payment_method_id, p.payment_method);`
	END IF;
END$$
DELIMITER ;
CALL get_clients_by_state(NULL)
```

#### throwing errors

```sql 
DROP PROCEDURE IF EXISTS make_payment;
DELIMITER $$
CREATE PROCEDURE make_payment(
	invoice_id INT,
    payment_amount DECIMAL(9,2),
    payment_date DATE
)
BEGIN
	IF payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid paramter (payments_amount)';
	END IF;

	UPDATE invoices i
    SET i.payment_total = payment_amount,
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END $$
DELIMITER ;
CALL make_payment(5, -1000, NOW())
```

---
## Variables

- Local `DECLAREE local_var TYPE`
- Session `SET @session_var = VALUE`

```sql
DROP PROCEDURE IF EXISTS make_payment;
DELIMITER $$
CREATE PROCEDURE make_payment(
	client_id INT,
    OUT invoices_total DECIMAL(9,2), -- OUT KEYWORD acts like a pointer
    OUT invoices_count INT
)
BEGIN
	-- Local variable      TYPE         DEFFAULT IF NECESSARY
	DECLARE local_variable DECIMAL(9,2) DEFAULT 0;
	SELECT COUNT(*), SUM(invoice_total), COUNT(*)
    INTO invoices_count, invoices_total, local_variable 
    FROM invoices i
    WHERE i.client_id = client_id AND payment_total = 0;
	SET @global_var = local_variable * -- SET @global_var
	SELECT @global_var
END $$
DELIMITER ;

-- User or session variables
set @var1 = 0;
set @var2 = 0;
CALL make_payment(3, @var1, @var2);
SELECT @var1, @var2
```

### Types
#### String
- Char(x) fixed-length
- VARCHAR(x) max: 65,535, stores only occupied characters
- Mediumtext max: 16mb (64kb)
- Longtext max: 4gb
- englihs 1b european 2b asian 3b
#### Numeric Types
- Tinyint 1b / unsigned tinyint
- smallint
- mediumint
- int

- DECIMAL(precision, scale) = DEC = NUMERIC = FIXED
- FLOAT, DOUBLE
#### Booleans
- Bool, Boolean
#### Enums
- ENUM('first', 'second', 'third')
- Set
#### Date and Time Types
- DATE
- TIME
- DATETIME 8b 
- TIMESTAMP 4b (up to 2038)
- YEAR
#### BLOBS - binary data
- TINYBLOB 255b
- BLOB 65kb
- MEDIUMBLOB 16MB
- LONGBLOB 4GB
#### JSON
```sql
JSON_EXTRACT(properties, "$.path")

-- or 

properties -> '$.weight' --  or ->> to get rid of literal representation
```
```sql 
-- to update 1 or more keys 
JSON_SET(properties, '$.weight', 10, '$.another.path', 20)

-- to remove  
JSON_REMOVE()
```


---
## Triggers
> Note: `triggers` should update values in tables that they are not watching, or it would cause an infinite loop  
  Use `OLD` or `NEW` keyword to select data

> use clever naming - table_before/after_eventName

- BEFORE, AFTER
- UPDATE, DELETE, INSERT

```sql
DELIMITER $$
CREATE TRIGGER payments_after_insert
	-- BEFORE / AFTER ; UPDATE / DELETE / INSERT
	AFTER INSERT ON payments
	FOR EACH ROW
BEGIN
	UPDATE inoices -- if use the same table `payments` it would be an infinite loop
    SET payment_total = payment_total + NEW.amount -- or OLD
    WHERE inovice_id = NEW.invoice_id;
END$$
DELIMITER ;
```

### Show triggers
`SHOT TRIGGERS`  
`SHOT TRIGGERS LIKE 'payments%'`
### Drop triggers
`DROP TRIGGER IF EXISTS payments_after_insert;`


---
## EVENts
- ALTER  
  ALTER DISABLE / ENABLE
- CREATE
- DROP

```sql
DELIMITER $$
DROP EVENT IF EXISTS yearly_delete_state_audit_rows;
CREATE EVENT yearly_delete_state_audit_rows
-- ALTER EVENT yearly_delete_state_audit_rows -- change without DROPing an event
-- ATLER EVENT name DISABLE; -- or ENABLE
ON SCHEDULE
	-- AT '1000-05-05' to execute once
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01' -- STARTS and ENDS are optional
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
DELIMITER ;
```

### show events
`SHOW EVENTS`


---
## Transactions

Sql locking an data to update, while other transaction is updating
- lost updates -- locks
- dirty reads -- changed reades
- non-repeating reads -- not the same reads
- phantom reads -- not full reads
- deadlocks -- 1 transaction waits for the second one and vise versa

```sql
START TRANSACTION;
SELECT NOW()
COMMIT;
-- ROLLBACK; -- undo a transaction
```

```sql
USE sql_store;
-- dirty reads; the lovest isolaction level; could read data which was rollbacked in another transactoion
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT points
FROM customers
WHERE customer_id = 1

USE sql_store;
-- unrepetable read = so several reads could give different values; USES last value from the table
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT points
FROM customers
WHERE customer_id = 1

USE sql_store;
-- uses first value; have `phantom read`; Deafault behavior
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT points
FROM customers
WHERE customer_id = 1

USE sql_store;
-- executes in sequence one after another
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT points
FROM customers
WHERE customer_id = 1
```

---
## Creating database process
- understand the busines requirements
- build a **conceptual**    model   
  It means design a relations. You can use `draw.io` or uml diagrams 
- build a **logical**       model   
  Specify types  
  Relationship
- build a **physical**      model   
  Implementation of a logical model for a specific database

### Keys
Primary  
^   
|   
Foreign -> create an event

### Normalization
1. Each cell shold have a single value and we cannot have repeated columns.
1. Every **table** should describe **one entity**, and every column in that table should describe that entity.
1. A column in a table should not be **derived** from other columns.

### Indexing for high performance
Often stores in Binary tree
#### Cost
- increase the database
- slow down the writes


#### Creating
```mysql
-- regular 
CREATE INDEX idx_name ON table (field)

-- string
CREATE INDEX idx_name ON table (field(number_of_first_characters))

-- FULL text index
CREATE FULLTEXT idx_name_name1 ON table (name, name1)

SELECT *,
  MATCH(name, name1) AGAINST("some text") -- select relevancy sqore
FROM table
-- WHERE MATCH(name, name1) AGAINST("some text")
WHERE MATCH(name, name1) AGAINST("some text -text +text 'exact phrase'" IN BOOLEAN MODE)

-- COMPOSITE INDEX
CREATE idx_name_name1 ON table (name, name1) -- order matters
```

#### Composite index
`CREATE idx_name_name1 ON table (name, name1) -- order matters`

- order matters
- it would create an index sorting by first column and then by second column
  > so if there is index by state and name
  state | name          or reversed name    | state
  CA    | "name1"                   "name1" | "CA"           
  CA    | "name2"                   "name1" | "LU"
  BU    | "name3"                   "name2" | "CA"
  LU    | "name1"                   "name3  | "BU"
- sorting
  > (a, b)
    Using index:
     a
     a, b
     a DESC, b DESC
    Using file sort :
     b
     a DESC, b
- covering indexes -> indexes which entirely satisfy a query (by where, select and order by clauses, etc.)


#### Showing
```mysql
ANALYZE TABLE table -- refresh a statistics

SHOW INDEXES in table
```

#### Droping
```mysql
DROP INDEX idx_nam ON table
```

#### Show performace of a query
```mysql
EXPLAIN <any query>
SHOW STATUS LIKE 'last_query_cost'

-- -
SELECT id
FROM table
WHERE condition1 AND condition2

% sometimes it is better to split the query with UNION operator

-- -
SELECT id
FROM table
WHERE points + 10 > 100

% better to use points > 90 -- should not use an expression (isolate a column)

```
