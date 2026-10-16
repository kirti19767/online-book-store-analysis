CREATE DATABASE OnlineBookStore;


USE OnlineBookStore;

-- 1. Create Books Table
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Genre VARCHAR(100),
    Published_Year INT,
    Price DECIMAL(10, 2),
    Stock INT
);

-- 2. Create Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(50),
    City VARCHAR(100),
    Country VARCHAR(100)
);

-- 3. Create Orders Table
USE onlinebookstore;

CREATE TABLE orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

USE onlinebookstore;

-- 1. Copy data from orders_temp into orders with date conversion
INSERT INTO orders (Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
SELECT 
    CAST(Order_ID AS SIGNED),
    CAST(Customer_ID AS SIGNED),
    CAST(Book_ID AS SIGNED),
    STR_TO_DATE(Order_Date, '%m/%d/%Y'),
    CAST(Quantity AS SIGNED),
    CAST(Total_Amount AS DECIMAL(10,2))
FROM orders_temp;    

-- 2. Drop the temporary staging table
DROP TABLE orders_temp;   

USE onlinebookstore;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_books
FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID);              

Select * from BOOKS;
Select * from Customers; 
Select * from orders; 


-- 1) Retrieve all books in the "Fiction" genre:
SELECT * From books
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM books
WHERE published_year>1950;

-- 3) List all customers from the Canada:

Select * FROM customers 
Where country ='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:  

SELECT SUM(stock) AS TOTAL_STOCK	
FROM BOOKS;


-- 6) Find the details of the most expensive book:

SELECT* From books 	
ORDER BY Price DESC 
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM orders 
WHERE QUANTITY>1 ;


-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM orders 
WHERE TOTAL_AMOUNT>20 ;


-- 9) List all genres available in the Books table:

SELECT DISTINCT genre FROM books; 

-- 10) Find the book with the lowest stock:

SELECT * FROM BOOKS
ORDER BY STOCK 
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(TOTAL_AMOUNT) AS revenue 
FROM ORDERS;


-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT * FROM ORDERS;
SELECT b.genre , sum(o. quantity) AS Total_Books_sold
FROM ORDERS o
JOIN BOOKS B ON o.book_id = b.book_id 
GROUP BY b.genre;


-- 2) Find the average price of books in the "Fantasy" genre: 

SELECT avg(PRICE) AS AVERAGE_PRICE
FROM books
WHERE GENRE= 'FANTASY';



-- 3) List customers who have placed at least 2 orders:

SELECT o.customer_id, c.name, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o. customer_id=c.customer_id
GROUP BY customer_id, c.name
HAVING COUNT(order_id)>=2;


-- 4) Find the most frequently ordered 

SELECT o. Book_id , b. title, count(o.order_id) AS ORDER_COUNT
FROM ORDERS o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;





-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM BOOKS
WHERE genre = 'fantasy'
ORDER BY price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author: 

SELECT b.author, SUM(o.quantity) AS TOTAL_BOOKS_SOLD
FROM ORDERS o 
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;



-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, Total_Amount
FROM orders o
JOIN customers c ON o.customer_id= c. customer_id
WHERE o. total_amount>30;

-- 8) Find the customer who spent the most on orders:  

Select c.customer_id , c.name, sum(o.total_amount) AS Total_Spent
from orders o
JOIN customers c ON o.customer_id=c.customer_id 
GROUP BY c.customer_id, c.name
ORDER BY TOTAL_SPENT DESC LIMIT 1;



----- 9) Calculate the stock remaining after fulfilling all orders:

SELECT b.BOOK_ID , b.TITLE, b.stock, COALESCE(SUM(o.quantity),0) AS ORDER_Quantity,
b.stock- COALESCE(sum(o.quantity),0) AS REMAINING_QUANTITY
FROM books b
LEFT JOIN orders o ON b.book_id =o.book_id
GROUP BY b.book_id;







