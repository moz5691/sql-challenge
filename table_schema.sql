
drop table if exists departments cascade;
drop table if exists employees cascade;
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries;
drop table if exists titles;


create table departments (
	dept_no varchar(30) primary key,
	dept_name varchar(60) not null
);

create table employees (
	emp_no serial primary key,
	birth_date date not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	gender varchar(6) not null,
	hire_date date not null
);


create table dept_emp (
	emp_no serial references employees(emp_no),
	dept_no varchar(30) references departments(dept_no),
	from_date date not null,
	to_date date,
	primary key (emp_no, dept_no)
);

create table dept_manager (
	dept_no varchar(30) references departments(dept_no),
	emp_no integer references employees(emp_no),
	from_date date not null,
	to_date date,
	primary key (emp_no, dept_no)
);


create table salaries (
	emp_no integer references employees(emp_no),
	salary integer not null,
	from_date date not null,
	to_date date,
	primary key (emp_no, salary)
);


create table titles (
	emp_no integer references employees(emp_no),
	title varchar(30) not null,
	from_date date not null,
	to_date date,
	primary key (emp_no, from_date)
);
