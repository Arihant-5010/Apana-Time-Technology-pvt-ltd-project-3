use project;
/* Show the top 5 warehouses with the highest Stockout_Risk, including their location, stock, and operational cost.*/
select  Warehouse_ID, Location, Current_Stock, Stockout_Risk, Operational_Cost
FROM supply_chain
ORDER BY Stockout_Risk DESC
LIMIT 5;

/* What is the average customer rating for each product category?*/
select Product_Category,avg(Customer_Rating) as Avg_Rating
from supply_chain
group by Product_Category;

/*List all warehouses where current stock is less than 50% of warehouse capacity*/
SELECT Warehouse_ID, Location, Current_Stock, Warehouse_Capacity
FROM supply_chain
WHERE Current_Stock < (Warehouse_Capacity * 0.5);




/*What is the average order processing time for each warehouse?*/
select Warehouse_ID, avg(Order_Processing_Time) as Avg_Processing_Time
from supply_chain
group by warehouse_ID;

/*Find the top 3 product categories by total monthly sales.*/
select Product_Category,sum(Monthly_Sales) as  Total_Sales
from supply_chain
group by Product_Category
ORDER BY Total_Sales DESC
limit 3;

/*Sort warehouses by lowest Order_Processing_Time and Return_Rate.*/
SELECT Warehouse_ID, Order_Processing_Time, Return_Rate
FROM supply_chain
ORDER BY Order_Processing_Time ASC, Return_Rate ASC;


/*Which supplier is linked to the highest total operational cost?*/
SELECT Supplier_ID, SUM(Operational_Cost) AS Total_Cost
FROM supply_chain
GROUP BY Supplier_ID
ORDER BY Total_Cost DESC
LIMIT 1;

/*List warehouses with customer rating > 4.5 and return rate < 5%.*/
SELECT Warehouse_ID, Customer_Rating, Return_Rate
FROM supply_chain
WHERE Customer_Rating > 4.5 AND Return_Rate < 5;

/*What is the average lead time for each supplier?.*/
SELECT Supplier_ID, AVG(Lead_Time_Days) AS Avg_Lead_Time
FROM supply_chain
GROUP BY Supplier_ID;

/*Average shipping time by location:*/
SELECT Location,AVG(Shipping_Time_Days) AS Avg_Shipping_Time
FROM supply_chain
GROUP BY Location
ORDER BY Avg_Shipping_Time ASC;

/*Warehouses with  long shipping times*/
SELECT Warehouse_ID,Location,Shipping_Time_Days
FROM supply_chain
WHERE Shipping_Time_Days > 5;

 /*Shipping performance vs. customer ratings:*/
 SELECT Warehouse_ID,Location,AVG(Shipping_Time_Days) AS Avg_Shipping_Time,AVG(Customer_Rating) AS Avg_Customer_Rating
FROM supply_chain
GROUP BY Warehouse_ID, Location
HAVING AVG(Shipping_Time_Days) > 5 AND AVG(Customer_Rating) < 3;


/*Monthly Sales by Product Category*/
SELECT Product_Category,SUM(Monthly_Sales) AS Total_Monthly_Sales
FROM Supply_chain
GROUP BY 
    Product_Category
ORDER BY 
    Total_Monthly_Sales DESC;
    
/*Total Stock Supplied per Supplier*/
SELECT Supplier_ID,SUM(Current_Stock) AS Total_Supplied_Stock
FROM supply_chain
GROUP BY Supplier_ID
ORDER BY Total_Supplied_Stock DESC;





