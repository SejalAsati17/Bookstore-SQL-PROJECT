-- Create Database
CREATE DATABASE OnlineBookstore;
Use  OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
-- Loading books.csv file into Books Table
Load data  infile "C:/Users/Asus/Downloads/Books.csv"
Into Table Books
fields Terminated by ','
enclosed by '"'
Lines terminated by '\n'
ignore 1 Lines;
Select * from Books;

 -- Loading  Customers csv file into customer table
 Load data Infile "C:/Users/Asus/Downloads/Customers (1).csv" 
 into table Customers 
 fields terminated by ','
 enclosed by'"'
 Lines terminated by '\n'
 ignore 1 Lines;
 select * from Customers;
 -- Loading Orders csv file into orders table
  Load data Infile "C:/Users/Asus/Downloads/Orders (1).csv"
 into table Orders 
 fields terminated by ','
 enclosed by'"'
 Lines terminated by '\n'
 ignore 1 Lines;
 Select * from Orders;
 
 
