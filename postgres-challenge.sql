CREATE DATABASE challenge;

\c challenge

CREATE EXTENSION "uuid-ossp";

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS department;

CREATE TABLE department(
	department_id uuid DEFAULT uuid_generate_v4 (), 
	department_name VARCHAR(30),
	salary_increment NUMERIC(2),
	PRIMARY KEY(department_id)
);

SELECT *
	FROM department;
	
	
DROP TABLE IF EXISTS temp_table;
	
CREATE TABLE IF NOT EXISTS temp_table (
				first_name VARCHAR(30),
				last_name VARCHAR(30),
				salary NUMERIC(5),
				dept_name VARCHAR(20),
				salary_increment NUMERIC(2)
);
	
COPY temp_table FROM '/Users/bappamac/flat_data.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM temp_table;


INSERT INTO department (department_name, salary_increment)
SELECT dept_name, CAST(salary_increment AS NUMERIC)
FROM temp_table;

SELECT *
	FROM department;

	
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
	employee_id uuid DEFAULT uuid_generate_v4 () ,
	department_id uuid,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	salary NUMERIC(5),
	PRIMARY KEY(employee_id),
	CONSTRAINT fk_department
	FOREIGN KEY(department_id)
	REFERENCES department(department_id)
	ON DELETE SET NULL
);

SELECT *
	FROM employees;
	
\dt+

SELECT *
FROM (
  SELECT row_number() OVER (), *
  FROM department
) AS t1
INNER JOIN (
  SELECT row_number() OVER (), *
  FROM temp_table
) AS t2
  USING (row_number);
	
	
INSERT INTO employees (department_id, first_name, last_name, salary)
SELECT department_id, first_name, last_name, salary
FROM (
  SELECT row_number() OVER (), *
  FROM department
) AS t1
INNER JOIN (
  SELECT row_number() OVER (), *
  FROM temp_table
) AS t2
  USING (row_number);

SELECT * FROM employees;


DROP TABLE IF EXISTS updated_salaries;

CREATE TABLE updated_salaries(
	employee_id uuid ,
	updated_salary NUMERIC(8,2)
);

SELECT *
	FROM employees et INNER JOIN department dt
	ON et.department_id = dt.department_id;

INSERT INTO updated_salaries(employee_id, updated_salary)
SELECT et.employee_id, (1 + dt.salary_increment/100) * et.salary
FROM employees et INNER JOIN department dt
ON et.department_id = dt.department_id;

SELECT * FROM updated_salaries;

DROP TABLE temp_table;
