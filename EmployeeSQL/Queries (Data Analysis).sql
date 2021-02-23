---- Data Analysis

---- list of all tables
SELECT * FROM TITLES;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPT_EMP;
SELECT * FROM DEPT_MANAGER;
SELECT * FROM SALARIES;

-----------------------------------------------------------------------------------------------------------------------------------

---- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.EMP_NO, E.LAST_NAME, E.FIRST_NAME, E.SEX, S.SALARY 
FROM EMPLOYEES E 
	INNER JOIN SALARIES S
	ON (E.EMP_NO = S.EMP_NO)
ORDER BY E.EMP_NO;


---- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DATE_PART('YEAR', HIRE_DATE) = '1986';


---- 3. List the manager of each department with the following information: 
----    department number, department name, the manager's employee number, last name, first name.

SELECT DM.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.LAST_NAME, E.FIRST_NAME
FROM EMPLOYEES E 
	INNER JOIN DEPT_MANAGER DM
	ON (E.EMP_NO = DM.EMP_NO)
	INNER JOIN DEPARTMENTS D
	ON (DM.DEPT_NO = D.DEPT_NO);


---- 4. List the department of each employee with the following information: 
----    employee number, last name, first name, and department name.

SELECT E.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
FROM EMPLOYEES E 
	INNER JOIN DEPT_EMP DE
	ON (E.EMP_NO = DE.EMP_NO)
	INNER JOIN DEPARTMENTS D
	ON (DE.DEPT_NO = D.DEPT_NO);
	

---- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT FIRST_NAME, LAST_NAME, SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules' 
AND LAST_NAME LIKE 'B%';


---- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT E.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
FROM EMPLOYEES E 
	INNER JOIN DEPT_EMP DE
	ON (E.EMP_NO = DE.EMP_NO)
	INNER JOIN DEPARTMENTS D
	ON (DE.DEPT_NO = D.DEPT_NO)
WHERE D.DEPT_NAME = 'Sales';


---- 7. List all employees in the Sales and Development departments, 
----    including their employee number, last name, first name, and department name.

SELECT E.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
FROM EMPLOYEES E 
	INNER JOIN DEPT_EMP DE
	ON (E.EMP_NO = DE.EMP_NO)
	INNER JOIN DEPARTMENTS D
	ON (DE.DEPT_NO = D.DEPT_NO)
WHERE D.DEPT_NAME IN ('Sales','Development');


---- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(LAST_NAME), LAST_NAME
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY COUNT(LAST_NAME) DESC;
