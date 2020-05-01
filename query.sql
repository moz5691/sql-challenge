
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e2.emp_no, last_name, first_name, gender, salary from employees e2 
inner join salaries 
on e2.emp_no = salaries.emp_no; 

-- 2. List employees who were hired in 1986.
select * from employees e 
where extract(year from hire_date) = 1986;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
select departments.dept_no, departments.dept_name, 
dm.emp_no, employees.last_name, employees.first_name, dm.from_date, dm.to_date
from dept_manager dm 
inner join departments 
on dm.dept_no = departments.dept_no
join employees 
on dm.emp_no = employees.emp_no ;


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select de.emp_no, employees.last_name, employees.first_name, 
(select dept_name from departments d2 where d2.dept_no = de.dept_no)
from dept_emp de 
inner join employees 
on de.emp_no = employees.emp_no ;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees e 
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
select de.emp_no, employees.last_name, employees.first_name, 
(select dept_name from departments d2 where dept_no = de.dept_no )   
from dept_emp de 
inner join employees 
on de.emp_no = employees.emp_no 
where dept_no in 
(select dept_no from departments d where dept_name = 'Sales');

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select de.emp_no, employees.last_name, employees.first_name, 
(select dept_name from departments where dept_no = de.dept_no)
from dept_emp de 
inner join employees 
on de.emp_no = employees.emp_no 
where dept_no in 
(select dept_no from departments 
where dept_name = 'Sales' or dept_name = 'Development');


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name ) 
from employees e 
group by last_name 


