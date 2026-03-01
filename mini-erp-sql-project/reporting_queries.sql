-- Employee with Department
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- Total Salary per Employee
SELECT e.emp_name, d.dept_name, SUM(s.amount) AS total_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_name, d.dept_name;

-- Department with Highest Total Salary
SELECT d.dept_name, SUM(s.amount) AS total_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_salary DESC
LIMIT 1;

-- Count Employees per Department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employee
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
