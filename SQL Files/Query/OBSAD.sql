-- Q1 Retrive the total Number of Books Sold for each genre
select genre, count(Book_ID) as No_of_Books_Sold from Books group by genre;
-- q2 Find the average price of books in the  fantasy genre
select  avg(Price) from Books where genre = 'Fantasy';
-- q3 List the customers who have placed atleast two orders
select c.Name, o.Customer_ID, count(o.Order_ID) from orders as o inner join customers as c 
on o.Customer_ID= c.Customer_ID group by o.Customer_ID having count(o.Order_ID) >=2;
-- q4 find th emost frequently ordered book
Select b.Title , b.Book_ID , count(o.Order_ID) as order_count from Books as b inner join Orders as o
 on b.Book_ID = o.Book_ID group by b.Book_ID having order_count = 4;
 -- q5 Show the top 3 most expensive books of the fantasy genre
 select Title, price from Books where genre = 'Fantasy' order by price desc  limit 3;
 --  q6 Retrive the total Quantity of books sold by each author
 select  b.author, sum(o.Quantity) as Total_Quantity from Books as b inner join Orders as o on 
 b.Book_ID = o.Book_ID group by b.author ;
 -- q7 list the cities where customers who ordered more than $30 are located
 Select distinct c.City , o.Total_Amount from Customers as c join Orders as o 
 on c.Customer_ID= o.Customer_ID where Total_Amount>30;
 -- q8 Find the customer who spent the most on orders
 Select c.Name, o.Total_Amount from Customers as c join Orders as o on c.Customer_ID = o.Customer_ID where o.Total_Amount = (Select max(Total_Amount) from Orders);
-- q9 Calculate the Stock remaining after fulfilling all orders
select b.Book_ID,  b.Title, b.stock,coalesce(sum(o.Quantity),0) as Order_Quantity, (b.stock- coalesce(sum(o.Quantity),0)) as Stock_Remaining from Books as b left join Orders as o 
on b.Book_ID= o.Book_ID  group by b.Book_ID;
 