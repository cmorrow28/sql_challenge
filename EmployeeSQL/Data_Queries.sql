-- References to created tables
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

-- Query to display employee details and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s 
ON e.emp_no = s.emp_no;

-- Query to display employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Query to display manager of each department
-- Include department and employee details
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d
LEFT JOIN dept_manager m
ON d.dept_no = m.dept_no
LEFT JOIN employees e
ON m.emp_no = e.emp_no;

-- Query to display employees department number
-- Include employee details
SELECT de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
LEFT JOIN dept_emp de
ON d.dept_no = de.dept_no
LEFT JOIN employees e
ON de.emp_no = e.emp_no;

-- Query to display employees with the first name Hercules
-- Last name must also begin with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Query to display employees in the Sales Department
-- Include employee details
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp de
ON d.dept_no = de.dept_no
INNER JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_no = 'd007';

-- Query to display employees in Sales and Development Departments
-- Include employee details
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp de
ON d.dept_no = de.dept_no
INNER JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_no IN ('d007', 'd005');

-- Query to display frequency of employee last names
-- In descending order
SELECT last_name, COUNT(*) AS "last name frequency"
FROM employees
GROUP BY last_name
ORDER BY "last name frequency" DESC;
