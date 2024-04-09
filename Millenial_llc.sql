--- FIND ALL EMPLOYEES ORDERED BY SALARY
SELECT * 
FROM m_employee
ORDER BY SALARY DESC;

--- LIST OF ALL COUNTRIES
SELECT country_name, 
country_id FROM country;

--- LIST OF EMPLOYEES, INCLUDE THEIR MGR AND SEX
SELECT emp_id, 
countrymgr_id,
SEX 
FROM m_employee ;
 
 --- FIND THE FIRST NAME AND LAST NAME OF ALL EMPLOYEES
 SELECT CONCAT(first_name, ' ', last_name) 
 AS fullname FROM M_employee;
 
 OR
 
SELECT First_name, Last_name
FROM m_employee;
 
 --- FIND THE TOTAL NUMBER OF EMPLOYEES
 SELECT COUNT(emp_id)
 FROM m_employee;
 
 --- FIND THE TOTAL NUMBER OF MALE AND FEMALE EMPLOYEES
 SELECT COUNT(SEX), SEX
 FROM M_employee
 GROUP BY sex;
 
--- FIND THE AVERAGE OF ALL EMPLOYEES SALARIES
SELECT AVG(SALARY)
FROM M_employee;

--- FIND THE SUM OF ALL EMPLOYEES SALARIES
SELECT SUM(SALARY)
FROM M_employee;

--- TOTAL SALES OF EACH COUNTRY
SELECT SUM(January_sales),
Febuary_sales,
March_sales, 
country_id
FROM sales
GROUP BY country_id;

--- FIND ANY EMPLOYEE WHO EARN 25000
SELECT * FROM M_employee
WHERE salary LIKE '%25000';

--- FIND A LIST OF EMPLOYEE WHO ARE BASED IN A COUNTRY AND THE NAMES OF THE COUNTRY
SELECT  first_name AS Company_names
FROM m_employee
UNION
SELECT Country_name
FROM Country;

--- FIND ALL THE COUNTRIES AND THE NAMES OF THEIR MANAGERS

SELECT m_employee.emp_id, m_employee.first_name, M_employee.last_name, country.country_name
FROM M_employee
JOIN country
ON m_employee.emp_id = country.countrymgr_id;

 --- FIND ALL EMPLOYEES THAT ARE MANAGED BY THE COUNTRY RICH MANAGES, ASSUME RICH'S ID IS KNOWN.

 SELECT M_employee.first_name, m_employee.last_name, m_employee.emp_id
 FROM m_employee
 WHERE M_employee.country_id =(
	 SELECT country.country_id
	 FROM country
	 WHERE countrymgr_id = 11
     LIMIT 1
 );