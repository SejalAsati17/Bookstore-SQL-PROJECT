-- q4
Select * from Orders where Order_Date Between '2023-11-01' And '2023-11-30';

-- Q5 Retrieve the total stocks of books available
select Sum(Stock) as Total_Stocks from Books ;

-- Q6 Find the details of the most expensive book available
select * from Books where Price= (select Max(Price) from Books);

-- Q7 Show all customers who ordered more than one quantity
  select * from Orders where Quantity >1;
  
  -- Q8 Retrive all orders where total amount exceeds $20
  select * from Orders where Total_Amount> 20;
  
  -- Q9 lIST ALL GENRE available from the bOOks 
  select distinct Genre from Books;
  
  -- Q10 Find the books with the lowest stock
  select * from Books where Stock =(select min(Stock) from Books);
  
  -- Q10  Calculate total revenue generated from all orders 
  select Sum(Total_amount) as Total_Revenue from Orders
  
  