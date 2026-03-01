-- Advanced and Window-function Queries

-- 1) Latest salary record per employee
SELECT s.*
FROM salaries s
JOIN (
  SELECT emp_id, MAX(payment_date) AS max_date
  FROM salaries
  GROUP BY emp_id
) latest ON s.emp_id = latest.emp_id AND s.payment_date = latest.max_date;

-- 2) Running total of salaries per employee ordered by payment_date
SELECT emp_id, payment_date, amount,
       SUM(amount) OVER (PARTITION BY emp_id ORDER BY payment_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM salaries
ORDER BY emp_id, payment_date;

-- 3) Monthly total salary (year-month)
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS year_month, SUM(amount) AS total_salary
FROM salaries
GROUP BY year_month
ORDER BY year_month;

-- 4) Top 3 employees by total salary
SELECT emp_id, SUM(amount) AS total_salary
FROM salaries
GROUP BY emp_id
ORDER BY total_salary DESC
LIMIT 3;

-- 5) Employees without any salary records
SELECT e.emp_id, e.emp_name
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;

-- 6) Departmental salary rank using window function
SELECT dept_name, emp_name, total_salary, RANK() OVER (PARTITION BY dept_name ORDER BY total_salary DESC) AS dept_rank
FROM (
  SELECT d.dept_name, e.emp_name, SUM(s.amount) AS total_salary
  FROM departments d
  JOIN employees e ON d.dept_id = e.dept_id
  LEFT JOIN salaries s ON e.emp_id = s.emp_id
  GROUP BY d.dept_name, e.emp_name
) t;
