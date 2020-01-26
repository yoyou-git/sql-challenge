-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE employees (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    gender varchar(30)   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE departments (
    dept_no varchar(30)   NOT NULL,
    dept_name varchar(30)   NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE department_employees (
    emp_no int   NOT NULL,
    dept_no varchar(30)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY(dept_no,emp_no)
);

CREATE TABLE department_manager (
    dept_no varchar(30)   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY(dept_no,emp_no)
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY(emp_no,from_date)
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar(30)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY(emp_no,from_date)
);
COPY departments FROM '/tmp/departments.csv' DELIMITER ',' CSV HEADER;
COPY department_employees FROM '/tmp/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY department_manager FROM '/tmp/dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM '/tmp/salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM '/tmp/titles.csv' DELIMITER ',' CSV HEADER;

