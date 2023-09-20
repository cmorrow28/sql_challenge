-- Create departments table 
CREATE TABLE departments (
	dept_no VARCHAR(5)  PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);
-- Check departments table
SELECT * FROM departments;

-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR(6) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);
-- Check titles table
SELECT * FROM titles;

-- Create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(6) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);
-- Check employees table
SELECT * FROM employees;

-- Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);
--Check salaries table
SELECT * FROM salaries;

-- Create department employees table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- Check department employees table
SELECT * FROM dept_emp;

-- Create department managers table
CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--Check department managers table
SELECT * FROM dept_manager;



