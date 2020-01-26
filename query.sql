-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.gender,salaries.salary
FROM employees LEFT JOIN salaries ON (employees.emp_no=salaries.emp_no); 

-- 2. List employees who were hired in 1986.
SELECT first_name,last_name
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';