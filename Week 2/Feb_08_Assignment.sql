--8th FEB 20222
-- SQL joins
/********************************************************************************/
--Assignment 1
--Creating a two new tables as they dont exist in the previous database of oracle

CREATE TABLE my_orders
(OrderId number(10) NOT NULL,
CustomerId number(10) NOT NULL,
OrderDate DATE);

CREATE TABLE my_customers
(CustomerId number(10) NOT NULL,
CustomerName varchar(50) NOT NULL,
ContactName varchar(50),
Country varchar(50));

INSERT INTO my_orders VALUES(10308, 2, '18-09-1996');
INSERT INTO my_orders VALUES(10309, 37, '19-09-1996');
INSERT INTO my_orders VALUES(10310, 77, '20-09-1996');

INSERT INTO my_customers VALUES(1, 'Alfreds Futterkiste','Maria Anders','Germany');
INSERT INTO my_customers VALUES(2, 'Ana Trujillo Emparedados y helados','Ana Trujillo','Mexico');
INSERT INTO my_customers VALUES(3, 'Antonio Moreno Taquería','	Antonio Moreno','Mexico');


SELECT * FROM my_orders;
SELECT * FROM my_customers;

SELECT my_orders.OrderID, my_customers.customername, my_orders.orderdate
FROM my_orders INNER JOIN my_customers ON my_orders.customerid=my_customers.customerid;

SELECT my_orders.OrderID, my_customers.customername, my_orders.orderdate
FROM my_orders LEFT OUTER JOIN my_customers ON my_orders.customerid=my_customers.customerid;

SELECT my_orders.OrderID, my_customers.customername, my_orders.orderdate
FROM my_orders RIGHT OUTER JOIN my_customers ON my_orders.customerid=my_customers.customerid;

SELECT my_orders.OrderID, my_customers.customername, my_orders.orderdate
FROM my_orders FULL OUTER JOIN my_customers ON my_orders.customerid=my_customers.customerid;

--(INNER) JOIN: Returns records that have matching values in both tables
--LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
--RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
--FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

/********************************************************************************/
/**Assignment 2**/
CREATE TABLE books
( id number(10) NOT NULL,  
  title varchar2(50) NOT NULL,  
  type varchar2(50) NOT NULL,
  author_id number(10) NOT NULL,
  editor_id number(10) NOT NULL,
  translator_id number(10) NOT NULL,
  CONSTRAINT books_id PRIMARY KEY (id)  
);  

CREATE TABLE authors
( id number(10) NOT NULL,  
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  CONSTRAINT authors_id PRIMARY KEY (id)  
);  

CREATE TABLE editors
( id number(10) NOT NULL,  
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  CONSTRAINT editors_id PRIMARY KEY (id)  
);  

CREATE TABLE translators
( id number(10) NOT NULL,  
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  CONSTRAINT translators_id PRIMARY KEY (id)  
);  

ALTER TABLE books MODIFY ( translator_id NULL);
--Inserting values into book tables
INSERT INTO books values(1,'Time to Grow Up!','original',11,21,NULL);
INSERT INTO books values(2,'Your Trip','translated',15,22,32);
INSERT INTO books VALUES(3,'Lovely Love','original',14,24,NULL);
INSERT INTO books VALUES(4,'Dreamy Your Life','original',11,24,NULL);
INSERT INTO books VALUES(5,'Oranges','translated',12,25,31);
INSERT INTO books VALUES(6,'Your Happy Life','translated',15,22,33);
INSERT INTO books VALUES(7,'Applied AI','translated',13,23,34);
INSERT INTO books VALUES(8,'My Last Book','original',11,28,NULL);

SELECT * FROM books;

INSERT INTO authors VALUES(11,'Ellen','Writer');
INSERT INTO authors VALUES(12,'Olga','Savelieva');
INSERT INTO authors VALUES(13,'Jack','Smart');
INSERT INTO authors VALUES(14,'Donald','Brain');
INSERT INTO authors VALUES(15,'Yao','Duo');

SELECT * FROM authors;

INSERT INTO editors VALUES(21,'Daniel','Brown');
INSERT INTO editors VALUES(22,'Mark','Jhonson');
INSERT INTO editors VALUES(23,'Maria','Evans');
INSERT INTO editors VALUES(24,'Cathrine','Roberts');
INSERT INTO editors VALUES(25,'Sebastian','Wright');
INSERT INTO editors VALUES(26,'Barbara','Jones');
INSERT INTO editors VALUES(27,'Matthew','Smith');

SELECT * FROM editors;

INSERT INTO translators VALUES(31,'Ira','Davies');
INSERT INTO translators VALUES(32,'Ling','Weng');
INSERT INTO translators VALUES(33,'Kristian','Green');
INSERT INTO translators VALUES(34,'Roman','Edwards');

SELECT * FROM translators;

--INNER JOIN
SELECT b.id, b.title, a.first_name, a.last_name
FROM books b INNER JOIN authors a
ON b.author_id=a.id
ORDER BY b.id;

SELECT b.id, b.title,b.type, t.last_name AS Translator_name
FROM books b INNER JOIN translators t
ON b.translator_id=t.id
ORDER BY b.id;

--LEFT OUTER JOIN 
SELECT b.id, b.title, b.type, a.last_name AS author, t.last_name AS translator
FROM books b LEFT OUTER JOIN authors a
ON b.author_id=a.id
LEFT JOIN translators t
ON b.translator_id=t.id
ORDER BY b.id;

SELECT b.id, b.title, e.last_name AS editor
FROM books b
LEFT JOIN editors e
ON b.editor_id = e.id
ORDER BY b.id;

SELECT b.id, b.title, e.last_name AS editor
FROM books b
RIGHT JOIN editors e
ON b.editor_id = e.id
ORDER BY b.id;

SELECT b.id, b.title, e.last_name AS editor
FROM books b
RIGHT JOIN editors e
ON b.editor_id = e.id
ORDER BY b.id;

SELECT b.id, b.title, a.last_name AS author, e.last_name AS editor, t.last_name AS translator
FROM books b 
FULL JOIN authors a ON b.author_id=a.id
FULL JOIN editors e ON b.editor_id=e.id
FULL JOIN translators t ON b.translator_id=t.id
ORDER BY b.id;

/******************************************************************************/
--Assignment 3
CREATE TABLE brands
( Brand_id number(10) NOT NULL,  
  Brand_name varchar2(50) NOT NULL,
  CONSTRAINT my_brand_id PRIMARY KEY (brand_id)  
);
INSERT INTO brands VALUES(1,'Audi');
INSERT INTO brands VALUES(2,'BMW');
INSERT INTO brands VALUES(3,'Ford');
INSERT INTO brands VALUES(4,'Honda');
INSERT INTO brands VALUES(5,'Toyota');

CREATE TABLE cars
( car_id number(10),  
  car_name varchar2(50),
  brand_id number(10)
);

ALTER TABLE cars MODIFY(CAR_ID NULL); 
ALTER TABLE brands MODIFY(brand_ID NULL); 

INSERT INTO cars VALUES(1,'Audi R8 Coupe',1);
INSERT INTO cars VALUES(2,'Audi Q2',1);
INSERT INTO cars VALUES(3,'Audi S1',1);
INSERT INTO cars VALUES(4,'BMW 2-serie Cabrio',2);
INSERT INTO cars VALUES(5,'BMW i8',2);
INSERT INTO cars VALUES(6,'Ford Edge',3);
INSERT INTO cars VALUES(7,'Ford Mustang Fastback',3);
INSERT INTO cars VALUES(8,'Honda S2000',4);
INSERT INTO cars VALUES(9,'Honda Legend',4);
INSERT INTO cars VALUES(10,'Toyota GT86',5);
INSERT INTO cars VALUES(11,'Toyota C-HR',5);

commit;

CREATE VIEW audi_cars AS 
SELECT car_id, car_name, brand_id
FROM cars
WHERE brand_id=1;

SELECT * FROM audi_Cars;

INSERT INTO audi_Cars(car_name, brand_id) values('BMW Z3 coupe',2);
SELECT * FROM audi_Cars;

UPDATE
    audi_cars
SET
    car_name = 'BMW 1-serie Coupe',
    brand_id = 2
WHERE
    car_id = 3;

SELECT
    *
FROM
    audi_cars;

CREATE
    VIEW ford_cars AS SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 3 WITH CHECK OPTION;
        
SELECT * FROM FORD_CARS;

--below query fails coz of with check point clause
INSERT
    INTO
        ford_cars(
            car_name,
            brand_id
        )
    VALUES(
        'Audi RS6 Avant',
        1
    );
    
/******************************************************************************/
Assignment 4
SELECT
    name,
    credit_limit
FROM
    customers;

--Complex query
SELECT
    name AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );
    
-Using VIEW
CREATE OR REPLACE VIEW customer_sales AS 
SELECT
    name AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );
--Using our view instead of writing whole query again
SELECT
    customer,
    sales_amount
FROM
    customer_sales
WHERE
    YEAR = 2017
ORDER BY
    sales_amount DESC;
    
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Assignment 5
SELECT * FROM EMPLOYEES;

CREATE VIEW employee_yos AS
SELECT
    employee_id,
    first_name || ' ' || last_name full_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ) yos
FROM
    employees;
    
Select * FROM employee_yos;
--In above query, we did not define the column names for the view 
--because the defining query uses column aliases for expressions such as full_name for first_name || ' ' || last_name
--and yos for FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ).

--If you don’t want to use column aliases in the query, you must define them in the CREATE VIEWclause:

CREATE OR REPLACE VIEW employee_yos (employee_id, full_name, yos) AS
SELECT
    employee_id,
    first_name || ' ' || last_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 )
FROM
    employees;
--Using our created view in below query   

SELECT
    *
FROM
    employee_yos
WHERE
    yos = 5
ORDER BY
    full_name; 

--creating read only view
CREATE OR REPLACE VIEW customer_credits(
        customer_id,
        name,
        credit
    ) AS 
SELECT
        customer_id,
        name,
        credit_limit
    FROM
        customers WITH READ ONLY;
        
SELECT * FROM customer_Credits;

DELETE FROM customer_Credits where customer_id=117;--will show error coz its read only view


--creating join view
CREATE OR REPLACE VIEW backlogs AS
SELECT
    product_name,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR,
    SUM( quantity * unit_price ) amount
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN products
        USING(product_id)
WHERE
    status = 'Pending'
GROUP BY
    EXTRACT(
        YEAR
    FROM
        order_date
    ),
    product_name;


SELECT * FROM BACKLOGS;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
Assignment 6

--using oracle DROP view
CREATE VIEW salesman AS 
SELECT
    *
FROM
    employees
WHERE
    job_title = 'Sales Representative';

SELECT * FROM salesman;

--creating another view from our prev view "salesman"
CREATE VIEW salesman_contacts AS 
SELECT
    first_name,
    last_name,
    email,
    phone
FROM
    salesman;

SELECT * FROM salesman_contacts;

--dropping view salesman
DROP VIEW salesman;

--You can check the status of a view by querying data from the user_objects view.
--Note that the object name must be in uppercase.
SELECT
    object_name,
    status
FROM
    user_objects
WHERE
    object_type = 'VIEW'
    AND object_name = 'SALESMAN_CONTACTS';
    
SELECT * FROM salesman_contacts;--will show error coz we deleted his parent view. Hence, we ill drop it
DROP VIEW salesman_contacts;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Assignment 7
--oracle updatable view
CREATE VIEW cars_master AS 
SELECT
    car_id,
    car_name
FROM
    cars;
    
SELECT * FROM cars_master;

DELETE
FROM
    cars_master
WHERE
    car_id = 1;
    
--as we deleted a row from view, hence those changes will be reflectes in our real table too
UPDATE
    cars_master
SET
    car_name = 'Audi RS7 Sportback'
WHERE
    car_id = 2;
--the change above will be reflected in both view and table
SELECT * FROM cars_master;
Select * from cars;

--oracle updatable join view
CREATE VIEW all_cars AS
SELECT car_id, car_name, brand_id, brand_name
FROM cars INNER JOIN brands USING(brand_id);

--inserting value into our table cars via view "all_cars"
INSERT INTO all_cars(car_name, brand_id )
VALUES('Audi A5 Cabriolet', 1);--it will show error, because its a restriction,"cannot modify more than one base table through a join view" 

SELECT DISTINCT(BRAND_ID) from all_cars;

--To find which column can be updated, inserted, or deleted, you use the user_updatable_columns view. 
--The following example shows which column of the all_cars view is updatable, insertable, and deletable:
SELECT
    *
FROM
    USER_UPDATABLE_COLUMNS
WHERE
    TABLE_NAME = 'ALL_CARS';
    
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Assignment 8
--Using ORACLE FETCH

SELECT * FROM products;
SELECT * FROM inventories;



























