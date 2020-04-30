SELECT * FROM department_employees;
SELECT * FROM department_manager;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY 3;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	departments.dept_no,
	departments.dept_name,
	department_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
JOIN department_manager ON departments.dept_no = department_manager.dept_no
JOIN employees ON department_manager.emp_no = employees.emp_no;
	
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	department_manager.emp_no,
	employees.last_name,
	employees.first_name,
	department_manager.dept_no
FROM department_manager
JOIN employees
ON department_manager.emp_no = employees.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN department_employees ON department_employees.emp_no = employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development'
ORDER BY dept_name;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name,
	COUNT(last_name)
FROM employees
GROUP BY 1
ORDER BY 2 DESC;
	


--bonus.