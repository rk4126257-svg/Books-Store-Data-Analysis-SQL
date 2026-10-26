# 📚 Bookstore Database Analysis Using SQL

### 📌 Project Overview
This project focuses on analyzing a bookstore database using SQL to retrieve meaningful information about books, customers, and orders. It demonstrates practical SQL querying skills through data filtering, aggregate functions, joins and database analysis using SQL Server / MySQL.

The analysis helps to understand sales performance, customer behavior, inventory management and overall bookstore operations.

### 🎯 Objectives
- Retrieve all books belonging to the Fiction genre
- Calculate the total number of Fiction books using COUNT()
- Identify books published after 1950
- Retrieve customers who are from Canada
- Filter orders placed during November 2023 using date-based SQL queries
- Analyze revenue, stock, and customer spending patterns

### 🛠️ Technologies Used
- SQL
- SQL Server / MySQL
- SQL Server Management Studio (SSMS)
- Relational Database Queries

### 🔍 SQL Concepts Practiced
- SELECT statements to retrieve records
- WHERE clauses to filter data
- COUNT(), SUM(), AVG() and aggregate functions
- DISTINCT, TOP, ORDER BY, GROUP BY, HAVING
- JOINs (INNER JOIN, LEFT JOIN)
- Comparison operators for filtering publication years
- Date filtering to analyze monthly orders
- COALESCE() / ISNULL() to handle NULL values
- Database and table creation for organizing data

### 🗄️ Database Schema
**Database Name: BookStore**

**Tables Used:**
1.  **Books:** Book_ID, Title, Author, Genre, Published_Year, Price, Stock
2.  **Customers:** Customer_ID, Name, Email, Phone, City, Country
3.  **Orders:** Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount

### 📊 Project Queries

#### A) Basic SQL Queries
1. Count the books belonging to the Fiction genre
2. Find books published after 1950
3. List all customers from Canada
4. Retrieve orders placed in November 2023
5. Calculate the total stock of books available
6. Find the details of the most expensive book
7. Retrieve orders where the quantity is greater than one
8. Find orders where the total amount exceeds $20
9. List all distinct genres available in the Books table
10. Find the book with the lowest stock
11. Calculate the total revenue generated from all orders

**Example:** Most Expensive Book
SELECT TOP 1 * FROM Books ORDER BY Price DESC;

**Example:** Total Revenue
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;

### Advanced SQL Queries

1.	Calculate the total quantity of books sold for each genre.
2.	Find the average price of books in the Fantasy genre.
3.	List customers who have placed at least two orders.
4.	Identify the most frequently ordered book.
5.	Find the top three most expensive books in the Fantasy genre.
6.	Calculate the total quantity of books ordered for each author.
7.	List cities associated with customers whose orders exceed $30.
8.	Identify the customer who spent the most on orders.
9.	Calculate the remaining stock after accounting for ordered quantities.

**Example:** Most Frequently Ordered Book
SELECT TOP 1 o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title ORDER BY ORDER_COUNT DESC;

 **Example:** Stock Remaining After Orders
SELECT B.Book_ID, B.Title, B.Stock - ISNULL(SUM(O.Quantity), 0) AS Stock_Remaining
FROM Books B LEFT JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Book_ID, B.Title, B.Stock;

### ✨ Feature Scope

**Inventory Feature:** Track total stock, lowest stock book, remaining stock after sales.

**Sales Feature:** Total revenue, orders > $20, monthly sales (Nov 2023).

**Customer Feature:** Customers by location (Canada), high-spending customers, repeat customers.

**Book Analysis Feature:** Genre-wise sales, author-wise sales, Fantasy genre analysis, Fiction count.

### 📊 Key Learning Outcomes

•	Extract specific information from a bookstore database

•	Apply filtering conditions to books, customers, and orders

•	Calculate category-based book counts and revenue

•	Work with publication years and order dates

•	Use JOINs to combine data from multiple tables

•	Develop practical SQL skills for real-world data analysis

### 💼 Skills Demonstrated

QL Querying | Data Filtering | Aggregate Functions
| Date-Based Analysis | JOINs | SQL Server Management | Business Intelligence

### 🚀 Project Purpose

This project is part of my Data Analytics learning journey and demonstrates
how SQL can be used to explore relational databases and answer real-world business questions in the bookstore industry.

### 👤 About Me

I'm currently learning data analytics and building projects to improve my practical skills.
This project is one of the steps in my journey to becoming a data analyst.
