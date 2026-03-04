# Mini ERP Database Project

A comprehensive relational database system demonstrating ERP-style employee and payroll management using MySQL 8.0.

## Author
Abul Hasnat Hridoy

## 🛠️ Environment
- **Database:** MySQL 8.0
- **Platform:** Ubuntu (WSL)
- **Tools:** MySQL CLI, Git

## Overview
This project demonstrates practical SQL database design and implementation skills through a normalized ERP-style system managing:
- **Departments:** Organizational units with contact information
- **Employees:** Personnel data with department assignments
- **Salaries:** Payroll transaction records with integrity constraints

**Key Features:**
- Normalized database schema (3NF)
- Referential integrity with foreign keys
- Data validation using CHECK constraints
- Complex reporting queries (JOINs, GROUP BY, subqueries)
- Business logic implementation

## Database Structure

### Tables
1. **departments**
   - `dept_id` (INT, Primary Key)
   - `dept_name` (VARCHAR(50))
   - `dept_email` (VARCHAR(100), Unique)

2. **employees**
   - `emp_id` (INT, Primary Key)
   - `emp_name` (VARCHAR(50))
   - `emp_joining_date` (DATE)
   - `dept_id` (INT, Foreign Key)

3. **salaries**
   - `salary_id` (INT, Primary Key)
   - `emp_id` (INT, Foreign Key)
   - `amount` (DECIMAL(10,2))
   - `payment_date` (DATE)

## Features
- ✅ Normalized database design (Third Normal Form)
- ✅ Primary and Foreign Key relationships
- ✅ Data integrity enforcement (CHECK constraints)
- ✅ Department-wise employee tracking
- ✅ Salary payment records with validation (amount > 0)
- ✅ Pre-populated sample data for testing
- ✅ Complex reporting queries with aggregations
- ✅ Subquery examples for business logic

## Sample Queries
The schema includes several useful queries:
- Employee with Department listing
- Salary Report by employee
- Department-wise total salary calculation

## 📊 Sample Reporting Queries

### 1. Department-wise Total Salary
Calculate total salary expenditure by department.

```sql
SELECT d.dept_name, SUM(s.amount) AS total_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;
```

### 2. Monthly Payroll Summary
Aggregate salary payments by month and year.

```sql
SELECT 
    YEAR(payment_date) AS year,
    MONTH(payment_date) AS month,
    SUM(amount) AS total_salary
FROM salaries
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY year, month;
```

### 3. Employee Salary Report with Department
List all employees with their department and salary information.

```sql
SELECT 
    e.emp_name,
    d.dept_name,
    s.amount,
    s.payment_date
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
INNER JOIN salaries s ON e.emp_id = s.emp_id
ORDER BY s.payment_date DESC;
```

### 4. Department with Highest Total Salary
Identify the department with maximum salary expenditure.

```sql
SELECT d.dept_name, SUM(s.amount) AS total_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_salary DESC
LIMIT 1;
```

### 5. Employee Count per Department
Count the number of employees in each department.

```sql
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
```

### 6. Salary Above Average (Subquery Example)
Find employees earning above the company average.

```sql
SELECT e.emp_name, s.amount
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.amount > (SELECT AVG(amount) FROM salaries);
```

## Usage
1. Ensure MySQL 8.0 is installed
2. Run the SQL script:
   ```bash
   mysql -u your_username -p < mini_erp_schema.sql
   ```
3. The database `CompanyDB` will be created with sample data

## 💡 Skills Demonstrated

- **Database Design:** Normalized schema design (3NF), entity-relationship modeling
- **SQL Fundamentals:** DDL (CREATE, ALTER), DML (INSERT, SELECT)
- **Data Integrity:** Primary keys, foreign keys, CHECK constraints, UNIQUE constraints
- **Query Operations:** INNER JOIN, LEFT JOIN, GROUP BY, ORDER BY, LIMIT
- **Aggregations:** SUM(), AVG(), COUNT() functions
- **Advanced SQL:** Subqueries, date functions, window functions
- **Business Logic:** Payroll calculations, department analytics, employee reporting

## 📁 Repository Structure

```
mini-erp-sql-project/
├── README.md              # Project documentation
├── schema.sql             # Database schema definition
├── sample_data.sql        # Sample data for testing
├── reporting_queries.sql  # Business reporting queries
└── advanced_queries.sql   # Advanced SQL examples
```

## License
This project is open source and available for educational purposes.
