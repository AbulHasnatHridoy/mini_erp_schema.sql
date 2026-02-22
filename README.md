# mini_erp_schema.sql

A Mini ERP Database Project for MySQL 8.0

## Author
Hasnat

## Environment
MySQL 8.0 (WSL Ubuntu)

## Overview
This project contains a simple ERP database schema with three main tables:
- **Departments**: Manages department information
- **Employees**: Stores employee data with department references
- **Salaries**: Tracks salary payments for employees

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
- Department management
- Employee tracking with department assignment
- Salary payment records with validation (amount must be positive)
- Pre-populated sample data
- Reporting queries included

## Sample Queries
The schema includes several useful queries:
- Employee with Department listing
- Salary Report by employee
- Department-wise total salary calculation

## Usage
1. Ensure MySQL 8.0 is installed
2. Run the SQL script:
   ```bash
   mysql -u your_username -p < mini_erp_schema.sql
   ```
3. The database `CompanyDB` will be created with sample data

## License
This project is open source and available for educational purposes.
