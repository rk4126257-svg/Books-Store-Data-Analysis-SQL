CREATE DATABASE BookStore;

USE BookStore;

SELECT * FROM dbo.Books;

--Basic Queries--

--Ques.1 Retrieve all books in the "Fiction" genre .
SELECT COUNT(*) AS fiction_book
FROM books
WHERE genre='fiction'

--Ques.2 Find books published after the year 1950.
SELECT * FROM Books
WHERE published_year > 1950;

--Ques.3 List all customers from the Canada.
SELECT * FROM Customers 
WHERE LOWER(Country) = 'canada';

--Ques.4 Show orders placed in November 2023.
SELECT * FROM Orders 
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

--Ques.5 Retrieve the total stock of books available.
SELECT SUM(Stock) AS Total_Stock
FROM Books;

--Ques.6 Find the details of the most expensive book.
SELECT TOP 1 * FROM Books
ORDER BY Price DESC;

--Ques.7 Show all customers who ordered more than 1 quantity of a book.
SELECT * fROM Orders
WHERE Quantity >1;

--Ques.8 Retrieve all orders where the total amount exceeds $20.
SELECT * FROM Orders
WHERE total_amount>20;

--Ques.9 List all genres available in the Books table.
SELECT DISTINCT Genre FROM Books;

--Ques.10 Find the book with the lowest stock.
SELECT TOP 1 * FROM Books
ORDER BY Stock ASC;

--Ques.11 Calculate the total revenue generated from all orders.
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orders;

--Advance Queries--

--Ques.1 Retrieve the total number of books sold for each genre ?

SELECT B.Genre, SUM(OD.Quantity) AS Total_Books_Sold
FROM Books B
JOIN dbo.Orders OD ON B.Book_ID = OD.Book_ID
GROUP BY B.Genre;

--Ques.2) Find the average price of books in the "Fantasy" genre ?
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

--Ques.3) List customers who have placed at least 2 orders ?

SELECT o.customer_id, c. name,COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT (Order_id)>=2;

--Ques.4) Find the most frequently ordered book ?

SELECT top 1 o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC 

--Ques.5) Show the top 3 most expensive books of 'Fantasy' Genre ?

SELECT TOP 3 *
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC;

--Ques.6) Retrieve the total quantity of books sold by each author ?

SELECT B.Author, SUM(O.Quantity) AS Total_Quantity_Sold
FROM Books B
JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Author
ORDER BY Total_Quantity_Sold DESC;


--Ques.7) List the cities where customers who spent over $30 are located ?

SELECT DISTINCT C.City
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN Books B ON O.Book_ID = B.Book_ID
WHERE (O.Quantity * B.Price) > 30;


--Ques.8) Find the customer who spent the most on orders ?

SELECT TOP 1 Customer_ID, SUM(Total_Amount) AS Total_Spent
FROM Orders
GROUP BY Customer_ID
ORDER BY Total_Spent DESC;


--Ques.9) Calculate the stock remaining after fulfilling all orders ?

SELECT B.Book_ID, 
B.Title, B.Stock - ISNULL(SUM(O.Quantity), 0) AS Stock_Remaining
FROM Books B
LEFT JOIN Orders O ON B.Book_ID = O.Book_ID
GROUP BY B.Book_ID, B.Title, B.Stock;

--or
SELECT b.book_id, 
b.title, b.stock, COALESCE(SUM(o.Quantity),0) AS Order_quantity,
b.stock- COALESCE(SUM(o.Quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;


