-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.gender,salaries.salary
FROM employees LEFT JOIN salaries ON (employees.emp_no=salaries.emp_no); 

-- 2. List employees who were hired in 1986.
SELECT first_name,last_name
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no,departments.dept_name,department_manager.emp_no, employees.last_name,employees.first_name,department_manager.from_date,department_manager.to_date
FROM departments LEFT JOIN department_manager ON (departments.dept_no=department_manager.dept_no) LEFT JOIN employees ON (employees.emp_no =department_manager.emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT departments.dept_name, department_employees.emp_no,employees.last_name,employees.first_name
FROM departments INNER JOIN department_employees ON (departments.dept_no = department_employees.dept_no) INNER JOIN employees ON (employees.emp_no = department_employees.emp_no)
ORDER BY departments.dept_name;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT*
From employees
WHERE employees.first_name='Hercules'
AND employees.last_name like'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT department_employees.emp_no, employees.last_name,employees.first_name,departments.dept_name
FROM departments INNER JOIN department_employees ON (departments.dept_no = department_employees.dept_no) 
INNER JOIN employees ON (employees.emp_no = department_employees.emp_no) 
WHERE departments.dept_name ='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT department_employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM departments INNER JOIN department_employees ON (departments.dept_no = department_employees.dept_no) 
INNER JOIN employees ON (employees.emp_no=department_employees.emp_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY dept_name;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name)AS "total last name"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name)DESC