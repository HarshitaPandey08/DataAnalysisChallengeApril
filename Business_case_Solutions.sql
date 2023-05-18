--1: What is the total revenue generated by Olist, and how has it changed over time?

select round(sum(p.payment_value),2) as Total_revenue
from order_payments_dataset p
join orders_dataset o on p.order_id=o.order_id
where o.order_status!='cancelled' ;

--by year
select round(sum(p.payment_value),2) as Total_revenue,year(o.order_purchase_timestamp) as Year
from order_payments_dataset p
join orders_dataset o on p.order_id=o.order_id
where o.order_status!='cancelled'
group by year(o.order_purchase_timestamp) ;

--by month
select round(sum(p.payment_value),2) as Total_revenue,year(o.order_purchase_timestamp) as Year,month(o.order_purchase_timestamp) as month
from order_payments_dataset p
join orders_dataset o on p.order_id=o.order_id
where o.order_status!='cancelled'
group by year(o.order_purchase_timestamp),month(o.order_purchase_timestamp)
order by 2,3;

--by quarter
select round(sum(p.payment_value),2) as Total_revenue,year(o.order_purchase_timestamp) as Year,
datepart(quarter,o.order_purchase_timestamp) as quarter
from order_payments_dataset p
join orders_dataset o on p.order_id=o.order_id
where o.order_status!='cancelled'
group by year(o.order_purchase_timestamp),datepart(quarter,o.order_purchase_timestamp)
order by 2,3;


--2: How many orders were placed on Olist, and how does this vary by month or season?

--total orders
select distinct count(order_id) as Order_count
from  dbo.orders_dataset 


--distribution of order by months
select distinct count(order_id) as Order_count,month(order_purchase_timestamp) as Month,year(order_purchase_timestamp) as Year
from  dbo.orders_dataset 
group  by year(order_purchase_timestamp),month(order_purchase_timestamp)
order by year(order_purchase_timestamp),month(order_purchase_timestamp)  


--3: What are the most popular product categories on Olist, and how do their sales volumes
compare to each other?

select c.product_category_name_english as Category,count(o.order_id) as Count_of_orders,round(sum(pa.payment_value),2) as Revenue
from products_dataset p 
join order_items_dataset o on p.product_id=o.product_id
join order_payments_dataset pa on  o.order_id=pa.order_id
join product_category_name_translation c on p.product_category_name=c.product_category_name
group by c.product_category_name_english
order by 2 DESC


--4: What is the average order value (AOV) on Olist, and how does this vary by product category or payment method?

--by category
select c.product_category_name_english as Category,round(avg(pa.payment_value),2) as AOV
from products_dataset p 
join order_items_dataset o on p.product_id=o.product_id
join order_payments_dataset pa on  o.order_id=pa.order_id
join product_category_name_translation c on p.product_category_name=c.product_category_name
group by c.product_category_name_english
order by 2 DESC

--by payement type
select pa.payment_type,round(avg(pa.payment_value),2) as AOV
from products_dataset p 
join order_items_dataset o on p.product_id=o.product_id
join order_payments_dataset pa on  o.order_id=pa.order_id
group by pa.payment_type
order by 2 DESC


5: How many sellers are active on Olist, and how does this number change over time?

--total sellers over the span of two years
select distinct count(s.seller_id) as sellers
from sellers_dataset s
join order_items_dataset i on  s.seller_id=i.seller_id
join orders_dataset o on i.order_id=o.order_id
where o.order_status!='canceled'


--active sellers per year
select distinct count(s.seller_id) as Active_sellers,year(o.order_purchase_timestamp) as Year
from sellers_dataset s
join order_items_dataset i on  s.seller_id=i.seller_id
join orders_dataset o on i.order_id=o.order_id
where o.order_status!='canceled'
group by year(o.order_purchase_timestamp)


6: What is the distribution of seller ratings on Olist, and how does this impact sales
performance


select review_score,count(i.seller_id) as Number_of_sellers,round(sum(p.payment_value),2) as Total_Revenue
,round(avg(p.payment_value),2) as Average_Revenue
from order_reviews r
join order_items_dataset i on r.order_id=i.order_id
join order_payments_dataset p on r.order_id=p.order_id
join orders_dataset o on r.order_id=o.order_id
where o.order_status<> 'canceled'
group by review_score
order by 1 DESC


7. How many customers have made repeat purchases on Olist, and what percentage of total
sales do they account for?



--count of repeat customers
with rp as (select distinct c.customer_unique_id as unique_id,count( o.order_id) as count_of_repeat_purchases
from orders_dataset o
join customers_dataset c on o.customer_id=c.customer_id
where o.order_status<>'canceled'
group by c.customer_unique_id
)
select count(rp.unique_id) as repeat_customer_count
from rp
where count_of_repeat_purchases>1;

--count of total customers
select count(customer_unique_id) as Total_customers
from customers_dataset;

--sales 
with rp as (select distinct c.customer_unique_id as unique_id,count( o.order_id) as count_of_repeat_purchases,sum(payment_value) as revenue
from orders_dataset o
join customers_dataset c on o.customer_id=c.customer_id
join order_payments_dataset p on o.order_id=p.order_id
where o.order_status<>'canceled'  and o.order_approved_at is not null
group by c.customer_unique_id
),
 ts as (select round(sum(payment_value),2) as total_revenue
from order_payments_dataset p
join orders_dataset o on p.order_id=o.order_id
where  o.order_status<>'canceled' and o.order_approved_at is not null)

select round((round(sum(revenue),2)/total_revenue)*100,2) as Percentage_of_sales_by_repeat_customers
from rp,ts
where count_of_repeat_purchases>1
group by total_revenue;


--8. What is the average customer rating for products sold on Olist, and how does this impact sales performance?

select round(avg(review_score),2) as average_ratings,p.product_category_name_english,
round(sum(op.payment_value),2) as Total_revnue,round(avg(op.payment_value),2) as Average_revnue
from order_reviews r
join orders_dataset o on r.order_id=o.order_id
join order_items_dataset i on o.order_id=i.order_id
join products_dataset pa on  i.product_id=pa.product_id
join product_category_name_translation p on pa.product_category_name=p.product_category_name
join order_payments_dataset op on o.order_id=op.order_id
where o.order_status<> 'canceled'
group by p.product_category_name_english
order by 1 DESC

--9: What is the average order cancellation rate on Olist, and how does this impact seller
performance?

select (sum(case when order_status='canceled' then 1 end)*1.0 /count(order_id) )*100 as Order_cancellation_rate
from orders_dataset

select distinct seller_id,sum(case when order_status='canceled' then 1 else 0 end) as Canceled_order_count,
sum(case when order_status<>'canceled' then 1 else 0 end) as Delivered_order_count,sum(payment_value) as Revenue
from orders_dataset o
join order_payments_dataset p on o.order_id=p.order_id
join order_items_dataset i on o.order_id=i.order_id
where o.order_approved_at is not null
group by seller_id,order_status
order by 4 DESC





10.What are the top-selling products on Olist, and how have their sales trends changed over time?


--top selling products over the entire duration
select p.product_category_name_english,round(sum(pa.payment_value),2) as Total_revenue
from order_items_dataset i
join orders_dataset o on i.order_id=o.order_id
join order_payments_dataset pa on i.order_id=pa.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation p on pr.product_category_name=p.product_category_name
where o.order_status<>'canceled' and o.order_approved_at is not null
group by p.product_category_name_english
order by 2 DESC

--2016 top selling products
select p.product_category_name_english,round(sum(pa.payment_value),2) as Revenue
from order_items_dataset i
join orders_dataset o on i.order_id=o.order_id
join order_payments_dataset pa on i.order_id=pa.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation p on pr.product_category_name=p.product_category_name
where o.order_status<>'canceled'and year(o.order_purchase_timestamp)='2016' and o.order_approved_at is not null
group by p.product_category_name_english
order by 2 DESC

--2017 top selling products
select p.product_category_name_english,round(sum(pa.payment_value),2) as Revenue
from order_items_dataset i
join orders_dataset o on i.order_id=o.order_id
join order_payments_dataset pa on i.order_id=pa.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation p on pr.product_category_name=p.product_category_name
where o.order_status<>'canceled'and year(o.order_purchase_timestamp)='2017' and o.order_approved_at is not null
group by p.product_category_name_english
order by 2 DESC

--2018 top selling products
select p.product_category_name_english,round(sum(pa.payment_value),2) as Revenue
from order_items_dataset i
join orders_dataset o on i.order_id=o.order_id
join order_payments_dataset pa on i.order_id=pa.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation p on pr.product_category_name=p.product_category_name
where o.order_status<>'canceled'and year(o.order_purchase_timestamp)='2018' and o.order_approved_at is not null
group by p.product_category_name_english
order by 2 DESC

--11: Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?

--most Commonly used payements methods
select pa.payment_type,count(o.order_id) as Number_of_orders
from orders_dataset o 
join order_payments_dataset pa on o.order_id=pa.order_id
where o.order_status<>'canceled' and o.order_approved_at is not null
group by pa.payment_type
order by 2 DESC

----most Commonly used payements methods by product category
select pc.product_category_name_english as category_name, sum(case when pa.payment_type='debit_card' then 1 else 0 end) as debit_card,
sum(case when pa.payment_type='credit_card' then 1 else 0 end) as credit_card,
sum(case when pa.payment_type='boleto' then 1 else 0 end) as boleto,
sum(case when pa.payment_type='voucher' then 1 else 0 end) as voucher
from orders_dataset o 
join order_payments_dataset pa on o.order_id=pa.order_id
join order_items_dataset i on o.order_id=i.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation pc on pr.product_category_name=pc.product_category_name_english
where o.order_status<>'canceled' and o.order_approved_at is not null 
group by pc.product_category_name_english

--most Commonly used payements methods by state
select  c.customer_state,sum(case when pa.payment_type='debit_card' then 1 else 0 end) as debit_card,
sum(case when pa.payment_type='credit_card' then 1 else 0 end) as credit_card,
sum(case when pa.payment_type='boleto' then 1 else 0 end) as boleto,
sum(case when pa.payment_type='voucher' then 1 else 0 end) as voucher
from orders_dataset o 
join order_payments_dataset pa on o.order_id=pa.order_id
join customers_dataset c on o.customer_id=c.customer_id
join order_items_dataset i on o.order_id=i.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation pc on pr.product_category_name=pc.product_category_name_english
where o.order_status<>'canceled' and o.order_approved_at is not null 
group by c.customer_state

--12: How do customer reviews and ratings affect sales and product performance on Olist?
Answer from the above question can be interpreted from answer of Question 6.


--13: Which product categories have the highest profit margins on Olist, and how can the company increase profitability across different categories?

select pc.product_category_name_english,
round(sum(p.payment_value)+sum(i.freight_value)-sum(i.price)/sum(p.payment_value)*100,2) as profit_margins
from order_items_dataset i
join order_payments_dataset p on i.order_id=p.order_id
join  orders_dataset o on i.order_id=o.order_id
join products_dataset pr on i.product_id=pr.product_id
join product_category_name_translation pc on pr.product_category_name=pc.product_category_name
where o.order_approved_at is not null and o.order_status<>'canceled'
group by pc.product_category_name_english
order by 2 DESC

--14: : How does Olist's marketing spend and channel mix impact sales and customer acquisition costs, and how can the company optimize its marketing strategy to increase ROI?

--better marketing
--offer and discounts
--new products


--15 Geolocation having high customer density. Calculate customer retention rate according to geolocations

select  c.customer_state,count(distinct c.customer_id) as  customer_density
from customers_dataset c
join geolocation_dataset g on c.customer_state=g.geolocation_state
join orders_dataset o on c.customer_id=o.customer_id
group by c.customer_state
order by 2 DESC






