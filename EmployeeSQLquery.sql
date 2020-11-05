--1) List the following details of each employee: employee number, last name, first name, sex, and salary.
--join salary and employees table on emp_no to obtain query employee number, last name, first, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON
e.emp_no = s.emp_no;

--2) List first name, last name, and hire date for employees who were hired in 1986.
-- where statement using between and the beginning and end dates.
SELECT first_name, last_name, hire_date 
FROM employees
where hire_date between '1986-01-01' and '1986-12-31';

--3) List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
-- dept manager table join dept_emp and departments; dept_emp and employees

SELECT dm.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_manager dm
  JOIN departments d ON
  dm.dept_no = d.dept_no
   INNER JOIN dept_emp de
   ON dm.emp_no = de.emp_no
   INNER JOIN employees e
   ON de.emp_no = e.emp_no;


--4) List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de
	ON e.emp_no = de.emp_no
	INNER JOIN departments d
	ON de.dept_no = d.dept_no;

--5) List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex from employees
	WHERE first_name = 'Hercules' and last_name like 'B%';
	
--6) List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de
	ON e.emp_no = de.emp_no
	INNER JOIN departments d
	ON de.dept_no = d.dept_no 
	AND d.dept_name = 'Sales';
	
--7) List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
	INNER JOIN employees e
	ON de.emp_no = e.emp_no
	INNER JOIN departments d
	ON d.dept_no  = de.dept_no
	WHERE d.dept_name =  'Sales'
	OR d.dept_name = 'Development';

--8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) 
	FROM employees
	GROUP BY last_name
	ORDER BY count(last_name) desc, last_name;
