-- =========================
-- Database Creation
-- =========================
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- =========================
-- Departments Table
-- =========================
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    dept_email VARCHAR(100) UNIQUE NOT NULL
);

-- =========================
-- Employees Table
-- =========================
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    emp_joining_date DATE NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- =========================
-- Salaries Table
-- =========================
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    CONSTRAINT check_salary_positive CHECK (amount > 0),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
