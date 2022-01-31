COMMIT;

    SELECT  * FROM dept;
    SELECT deptno,dname,branchno FROM dept;
    
    SELECT * FROM branch;
    SELECT branchno, branchname,location FROM branch;
    
    SELECT * FROM emp;
    SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  FROM emp;
    
    SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno  
    FROM
    emp
    ORDER BY 
    empno;
    
    SELECT 
    deptno,empno,ename,job,mgr,hiredate,sal,comm,branchno    
    FROM
    emp
    ORDER BY
    deptno,empno; 