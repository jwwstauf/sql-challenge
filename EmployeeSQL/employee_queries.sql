--1
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM
	employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

--2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'

--3
CREATE VIEW manager_depts AS
SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_name
FROM dept_manager
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
manager_depts.dept_no, 
manager_depts.dept_name
FROM employees
INNER JOIN manager_depts ON employees.emp_no = manager_depts.emp_no

--4
CREATE VIEW departments_names AS 
SELECT
departments.dept_name,
dept_emp.dept_no,
dept_emp.emp_no
FROM 
dept_emp
LEFT JOIN departments on dept_emp.dept_no =departments.dept_no

SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
departments_names.dept_name

FROM employees

LEFT JOIN departments_names on employees.emp_no = departments_names.emp_no

--5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6
SELECT employees.emp_no, employees.first_name, employees.last_name, departments_names.dept_name
FROM employees
LEFT JOIN departments_names on employees.emp_no = departments_names.emp_no
WHERE dept_name = 'Sales'

--7
SELECT employees.emp_no, employees.first_name, employees.last_name, departments_names.dept_name
FROM employees
LEFT JOIN departments_names on employees.emp_no = departments_names.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8
SELECT last_name, COUNT(emp_no)
FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC