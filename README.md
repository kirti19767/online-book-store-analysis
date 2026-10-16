# Online Book Store Database & Analysis

A comprehensive MySQL relational database project designing schema structures, managing order transactions, and executing data analytics queries for an online bookstore.

## Project Overview
This project models an e-commerce book store database to manage inventory, customer records, and sales history. It includes table creation, bulk data insertion with date formatting, table constraint mapping, and multi-level analytical SQL queries to answer critical business questions.

## Database Schema & Structure
The database consists of three core relational tables:
* **`Books`**: Stores information on book titles, authors, genres, publication years, prices, and available stock.
* **`Customers`**: Contains customer demographics including name, email, phone, city, and country.
* **`Orders`**: Tracks order dates, quantities, total amounts, and foreign key relationships mapping back to Customers and Books.

## Key Analytics & Business Questions Answered
* **Revenue & Sales Tracking:** Calculated total revenue across all sales transactions and evaluated genre-based sales performance[cite: 2].
* **Inventory Management:** Tracked remaining stock inventory after order fulfillment and identified low-stock titles[cite: 2].
* **Customer Insights:** Identified top-spending customers, city-wise customer spending patterns exceeding thresholds, and repeat purchase trends[cite: 2].
* **Advanced Aggregations:** Utilized `JOIN`s, `GROUP BY`, `HAVING`, `SUM`, `AVG`, `COUNT`, and limit parameters to filter top-performing books and authors[cite: 2].

## Tools & Technologies Used
* **Database Management System:** MySQL Workbench / MySQL Server[cite: 2]
* **SQL Techniques:** DDL/DML Scripting, Data Type Casting (`CAST`, `STR_TO_DATE`), Primary/Foreign Keys, Referential Integrity, Subqueries, Relational Joins, Grouped Aggregations[cite: 2]

## How to Run
1. Clone this repository to your local machine.
2. Open **MySQL Workbench** or your preferred SQL editor.
3. Open and execute `onlinebookstore Project.sql` to generate the database, tables, and analytical views[cite: 2].
