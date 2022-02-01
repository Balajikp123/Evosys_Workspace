CREATE TABLE EVOSYS(
    "ECODE" CHAR(6)NOT NULL PRIMARY KEY,
    "EDEPT" CHAR(20)NOT NULL,
    "ENAME" CHAR(50)NOT NULL,
    "MOBNO" CHAR(10)NOT NULL,
    "ADDRESS" CHAR(100)NOT NULL
    );
    
================================================================================  
================================================================================    
INSERT INTO EVOSYS VALUES ('150236','TechERP','Akash','7234567890','Jaipur');
INSERT INTO EVOSYS VALUES ('123456','TechERP','Balaji','9143658709','Kolhapur');
INSERT INTO EVOSYS VALUES ('783569','FuncERP','Neha','7852416032','Latur');
INSERT INTO EVOSYS VALUES ('541236','FuncERP','Pooja','8855246310','Agra');
INSERT INTO EVOSYS VALUES ('312987','TechERP','Rakesh','9014365270','Pune');
INSERT INTO EVOSYS VALUES ('153236','TechERP','Arjun','8234567896','Jaipur');
INSERT INTO EVOSYS VALUES ('121456','TechERP','Balraj','6143658701','Kolhapur');
INSERT INTO EVOSYS VALUES ('780569','FuncERP','Neelam','7852416034','Latur');
INSERT INTO EVOSYS VALUES ('547236','FuncERP','Pushpa','8855246315','Agra');
INSERT INTO EVOSYS VALUES ('314987','TechERP','Ajay','9014365273','Pune');
================================================================================
================================================================================

SELECT * FROM EVOSYS;
SELECT ecode,ename,mobno,address FROM EVOSYS;

================================================================================
================================================================================

CREATE TABLE CUSTOMER(
    "CUST_ID" VARCHAR(5) NOT NULL PRIMARY KEY,
    "CNAME" CHAR(40) NOT NULL,
    "MOBNO" CHAR(10)NOT NULL,
    "LOCATION" CHAR(50),
    "ECODE" CHAR(6)NOT NULL REFERENCES EVOSYS
    );
    
================================================================================
================================================================================

INSERT INTO CUSTOMER VALUES ('A5023','Akashay','9234567890','Lucknow','150236');
INSERT INTO CUSTOMER VALUES ('B2345','Kartki','8143658709','Kolkata','312987');
INSERT INTO CUSTOMER VALUES ('S8359','Vishwavijay','7752416032','Mumbai','541236');
INSERT INTO CUSTOMER VALUES ('R4136','Aniket','9855246310','Raipur','783569');
INSERT INTO CUSTOMER VALUES ('E1987','Raviraj','8014365270','Palghar','123456');
INSERT INTO CUSTOMER VALUES ('A1023','Akashey','9234567890','Lucknow','150236');
INSERT INTO CUSTOMER VALUES ('B3345','Kirti','8143651709','Kolkata','312987');
INSERT INTO CUSTOMER VALUES ('S4359','Vijay','7052416032','Mumbai','541236');
INSERT INTO CUSTOMER VALUES ('R4636','Amit','9815246310','Raipur','783569');
INSERT INTO CUSTOMER VALUES ('E7987','Viraj','8064365270','Palghar','123456');
INSERT INTO CUSTOMER VALUES ('C5023','Vilas','9260567890','Lucknow','150236');
INSERT INTO CUSTOMER VALUES ('B9345','Krishna','8143658749','Kolkata','312987');
INSERT INTO CUSTOMER VALUES ('P8359','Vishwa','7752086032','Mumbai','541236');
INSERT INTO CUSTOMER VALUES ('L4136','Niketan','9850046310','Raipur','783569');
INSERT INTO CUSTOMER VALUES ('E1087','Rajiv','8011365270','Palghar','123456');

================================================================================
================================================================================

COMMIT;

================================================================================
================================================================================

SELECT cust_id,ecode as rcode,cname,mobno,location FROM customer;   

================================================================================
================================================================================

SELECT 
    cust_id,cname,mobno,location  
FROM
    customer
ORDER BY 
    ecode;
    
================================================================================
================================================================================   
    
    
SELECT 
    ecode,ename,address  
FROM
    EVOSYS
ORDER BY 
    ecode;
    
    
================================================================================
================================================================================

SELECT 
    ecode as rcode,cname,mobno,location   
FROM
    customer
ORDER BY
    cust_id,cname DESC;
    
================================================================================
================================================================================



