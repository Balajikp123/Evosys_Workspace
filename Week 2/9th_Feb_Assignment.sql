/*********************--9FEB2022:Assignment--***********************/

-->========================HackerRank Query==========================

CREATE TABLE hackers(
hacker_id number(10) NOT NULL,
name varchar(20));

CREATE TABLE challenges(
challange_id number(10) NOT NULL,
hacker_id number(10));

INSERT INTO hackers VALUES(5077,'Rose');
INSERT INTO hackers VALUES(21283,'Angela');
INSERT INTO hackers VALUES(62743,'Frank');
INSERT INTO hackers VALUES(88255,'Patrick');
INSERT INTO hackers VALUES(96196,'Lisa');


INSERT INTO challenges VALUES(61654,5077);
INSERT INTO challenges VALUES(58302,21283);
INSERT INTO challenges VALUES(40587,88255);
INSERT INTO challenges VALUES(29477,5077);
INSERT INTO challenges VALUES(1220,21283);
INSERT INTO challenges VALUES(69514,21283);
INSERT INTO challenges VALUES(46561,62743);
INSERT INTO challenges VALUES(58077,62743);
INSERT INTO challenges VALUES(18483,88255);
INSERT INTO challenges VALUES(76766,21283);
INSERT INTO challenges VALUES(52382,5077);
INSERT INTO challenges VALUES(74467,21283);
INSERT INTO challenges VALUES(33625,96196);
INSERT INTO challenges VALUES(26053,88255);
INSERT INTO challenges VALUES(42665,62743);
INSERT INTO challenges VALUES(12859,62743);
INSERT INTO challenges VALUES(70094,21283);
INSERT INTO challenges VALUES(34599,88255);
INSERT INTO challenges VALUES(54680,88255);
INSERT INTO challenges VALUES(61881,5077);

SELECT * FROM hackers;
SELECT * FROM challenges;

--QUERY PART1
SELECT hacker_id, name, COUNT(challange_id) as total_challanges
FROM hackers JOIN challenges USING (hacker_id)
GROUP BY hacker_id,name
ORDER BY total_challanges DESC;
--we can also use
SELECT h.hacker_id, h.name, COUNT(c.challange_id) as total_challanges
FROM Hackers h JOIN Challenges c 
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY total_challanges DESC;


--QUERY PART2
SELECT hacker_id, name, COUNT(challange_id) as total_challanges
FROM hackers JOIN challenges USING (hacker_id)
GROUP BY hacker_id,name
HAVING total_challanges=(SELECT COUNT(challange_id) AS my_counts FROM Challenges
                        GROUP BY Hacker_id
                        ORDER BY my_counts)
ORDER BY total_challanges DESC;


SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as no_of_challenges
FROM Hackers H
JOIN Challenges C ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING no_of_challenges = (SELECT count(challenge_id) AS max_count FROM Challenges GROUP BY hacker_id ORDER BY max_count DESC LIMIT 1)
OR no_of_challenges IN (SELECT t.cnt FROM (SELECT count(challenge_id) AS cnt FROM Challenges GROUP BY hacker_id) t GROUP BY t.cnt HAVING COUNT(t.cnt) = 1)
ORDER BY no_of_challenges DESC, H.hacker_id ASC;




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
--UNION AND UNION ALL

-- oracle union
SELECT first_name, last_name, email,'aka_contact'
FROM contacts
UNION
SELECT first_name, last_name, email, 'aka_employee'
FROM employees;

--oracle UNION and ORDER BY example
SELECT 
    first_name || ' ' || last_name as name,
    email,
    'contact'
FROM contacts
UNION
SELECT 
    first_name || ' ' || last_name name,
    email,
    'employee'
FROM
    employees
ORDER BY
    name DESC;

--UNION (it will return unique last names from employee)
SELECT
    last_name
FROM
    employees
UNION 
SELECT
    last_name
FROM
    contacts
ORDER BY
    last_name;
--UNION ALL, it will return all the names i.e last_names
SELECT
    last_name
FROM
    employees
UNION ALL 
SELECT
    last_name
FROM
    contacts
ORDER BY
    last_name;