--Use Join to retrieve employees salary information from Salaries table and list employees no, first and last name, hire date and salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary FROM employees
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)

--List employees who where hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE  hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date ASC;

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT employees.first_name, employees.last_name, employees.emp_no, dept_manager.dept_no, departments.dept_name,dept_emp.from_date, dept_emp.to_date
FROM employees
LEFT JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
LEFT JOIN departments ON
dept_manager.dept_no = departments.dept_no
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
WHERE dept_manager.dept_no IS NOT NULL

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.first_name, employees.last_name, employees.emp_no, dept_emp.dept_no
FROM employees
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
ORDER BY dept_no ASC

--List all employees whose first name is "Hercules" and last names begin with "B.
SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Development' OR dept_name = 'Sales'
ORDER BY dept_name DESC

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (*)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC
