-- ANALISI VENDITE ** PROGETTO APRILE 2026 **

-- TOTALE STATI
select count(distinct State_Code) as Total_States
from sales;

-- SALES TREND ANNUALE
select distinct State_Code as State,
       Year,
       sum(Total_Sales) as Revenue
from sales
group by 1, 2
order by 2, 3 desc;

-- TOTAL STATI PER ANNO
select Year,
       count(distinct State_Code) as Total_States
from sales
group by 1
order by 1;

-- VARIAZIONI VENDITE
select distinct Year,
       State_Code as State,
       sum(Total_Sales) as Revenue,
       sum(Total_Sales)-lag(sum(Total_Sales))over(partition by State_Code order by Year) as Sales_Variations
from sales
group by 1, 2
order by 1, 4;

-- VARIAZIONI VENDITE PER CATEGORIA
select distinct Year,
       State_Code as State,
       Category,
       sum(Total_Sales) as Revenue,
       sum(Total_Sales)-lag(sum(Total_Sales))over(partition by State_Code, Category order by Year) as Category_Sales_Variations
from sales
group by 1, 2, 3
order by 1, 5;

-- PRODOTTI PER CATEGORIA
select distinct Year,
       Category,
       count(distinct Product) as Products
from sales
group by 1, 2
order by 1;

-- CLASSIFICAZIONE STATI definendo range di ricavi annuali
select distinct State_Code as State,
       Year,
       sum(Total_sales) as Revenue,
       case
       	when sum(Total_Sales) < 100000 then 'Low Sales'
       	when sum(Total_Sales) > 100000 and sum(Total_Sales) < 300000 then 'Medium Sales'
       	when sum(Total_Sales) > 300000 and sum(Total_Sales) < 500000 then 'Upper Medium Sales'
       	when sum(Total_Sales) > 500000 and sum(Total_Sales) < 1000000 then 'High Sales'
       	when sum(Total_Sales) > 1000000 then 'Top Sales'
       end as Sales_Performance
from sales 
group by 1, 2 
order by 2;


-- CTE per approfondire quantità acquistate, acquisti ripetuti, e KPIs rilevanti da esportare nella dashboard PowerBI
with customer_segmentation as(
select distinct(State_Code) as State,
       Year,
       Month,
       Category,
       Customer_name,
       sum(Total_Cost) as Total_Cost,
       sum(Total_Sales) as Total_Revenue,
       count(Order_Number) as Total_Orders,
       sum(Quantity) as Total_Quantity,
       sum(Total_Sales)/count(Order_Number) as Average_Order_Spent,
       sum(Total_Cost)/count(Order_Number) as CPO,
       sum(Total_Sales) - sum(Total_Cost) as Profit,
       case
       	when count(distinct Customer_Name) = 1 then 'One Time Customer'
       	when count(distinct Customer_Name) > 1 then 'Repeated Customer'
       end Customer_Type   
from sales
group by 1, 2, 3, 4, 5
order by 2, 3
)
select State,
       Year,
       Month,
       Category,
       Customer_Name,
       Total_Orders,
       Average_Order_Spent,
       CPO,
       Profit,
       Customer_Type,
       Total_Revenue,
       case
       	when Total_Quantity = 1 then '1 item'
       	when Total_Quantity = 2 then '2 items'
       	when Total_Quantity = 3 then '3 items'
       	when Total_Quantity > 3 then '3+ items'
       end Quantity_per_order
from customer_segmentation 
group by 1, 2, 3, 4, 6, 8, 9, 10
order by 2, 3, 4;