/**Display all the information of the EMP table***/
SELECT * FROM EMP;

/**Display unique Jobs from EMP table?*/
SELECT DISTINCT JOB FROM EMP;

/**List the emps in the asc order of their Salaries?**/
SELECT * FROM EMP
ORDER BY SAL ASC;

/**List the details of the emps in asc order of the Dptnos and desc of Jobs?**/
SELECT * FROM EMP
ORDER BY DEPTNO,JOB ASC;

/**Display all the unique job groups in the descending order?**/
SELECT DISTINCT JOB FROM EMP;

/**Display all the details of all ‘Mgrs’**/
SELECT * FROM EMP
ORDER BY MGR;

/**List the emps who joined before 1981**/
SELECT ENAME FROM EMP
WHERE HIREDATE > 01-01-81;