--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select
	e.id
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary
from employee e
	join salary s
	on e.id = s.emp_id
	
	
--2. List first name, last name, and hire date for employees who were hired in 1986.
select 
	first_name
	,last_name
	,hire_date
from employee
where extract(year from hire_date)=1986


--3. List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
select 
	d.number
	,d.name department
	,e.id manager_id
	,e.last_name
	,e.first_name
from employee e
	join dep_manager dm
	on dm.emp_id=e.id
		join dep_emp de
		on e.id=de.emp_id
			join department d
			on de.dep_id=d.number
	
	
--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
select
	e.id
	,e.last_name
	,e.first_name
	,d.name department
from employee e
	join dep_emp de
	on e.id=de.emp_id
		join department d
		on de.dep_id=d.number


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 
	first_name
	,last_name
	,sex
from employee
where first_name='Hercules' and last_name like 'B%'


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
	e.id
	,e.last_name
	,e.first_name
	,d.name department
from employee e
	join dep_emp de
	on e.id=de.emp_id
		join department d
		on de.dep_id=d.number
where d.name = 'Sales'


--7. List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
select
	e.id
	,e.last_name
	,e.first_name
	,d.name department
from employee e
	join dep_emp de
	on e.id=de.emp_id
		join department d
		on de.dep_id=d.number
where d.name = 'Sales' or d.name = 'Development'


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
	last_name
	,count(id) frequency
from
	employee
Group by
	last_name
Order by 2 desc






