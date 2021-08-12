-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/774EpM
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE department (
    number varchar NOT NULL PRIMARY KEY,
    name varchar NOT NULL
);

CREATE TABLE title (
    id varchar NOT NULL PRIMARY KEY,
    title varchar NOT NULL
);

create type sex as enum('M', 'F');

CREATE TABLE employee (
    id integer NOT NULL PRIMARY KEY,
	title_id varchar NOT NULL,
	birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,  
    sex sex NOT NULL,
    hire_date date NOT NULL 
);

CREATE TABLE dep_emp (
    emp_id integer NOT NULL,
    dep_id varchar NOT NULL,
	PRIMARY KEY (emp_id, dep_id)
);

CREATE TABLE dep_manager (
    dep_id varchar NOT NULL,
    emp_id integer NOT NULL,
	PRIMARY KEY (emp_id, dep_id)
);

CREATE TABLE salary (
    emp_id integer NOT NULL PRIMARY KEY,
    salary integer NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT fk_employee_title_id FOREIGN KEY(title_id)
REFERENCES title (id);

ALTER TABLE dep_emp ADD CONSTRAINT fk_dep_emp_emp_id FOREIGN KEY(emp_id)
REFERENCES employee (id);

ALTER TABLE dep_emp ADD CONSTRAINT fk_dep_emp_dep_id FOREIGN KEY(dep_id)
REFERENCES department (number);

ALTER TABLE dep_manager ADD CONSTRAINT fk_dep_manager_emp_id FOREIGN KEY(emp_id)
REFERENCES employee (id);

ALTER TABLE dep_manager ADD CONSTRAINT fk_dep_manager_dep_id FOREIGN KEY(dep_id)
REFERENCES department (number);

ALTER TABLE salary ADD CONSTRAINT fk_salary_emp_id FOREIGN KEY(emp_id)
REFERENCES employee (id);