drop table if exists department_manager;
drop table if exists department_employees;
drop table if exists departments;

CREATE TABLE departments 
	(dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR);
	
CREATE TABLE department_employees
	(emp_no VARCHAR,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
CREATE TABLE department_manager
	(dept_no VARCHAR,
	emp_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

drop table if exists titles;
drop table if exists salaries;
drop table if exists employees;

CREATE TABLE employees (
	emp_no VARCHAR PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE
	);
	
CREATE TABLE salaries (
	emp_no VARCHAR,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

SELECT * FROM departments;
SELECT * FROM department_employees;
SELECT * FROM department_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

