# Olist E-commerce Data Analysis


**- Harshita Pandey**

<p align="center">
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/ea25cc12-2f63-4845-8657-a4f56942a491"  >
</p>


**Introduction:**



Olist is a Brazilian e-commerce platform that connects small and medium-sized businesses to
customers across Brazil. The platform operates as a marketplace, where merchants can list
their products and services and customers can browse and purchase them online.
The Olist sales dataset available on Kaggle is a collection of anonymized data about orders
placed on the Olist platform between January 2017 and August 2018. It contains a wide range
of information about each order, including the order date, product details, payment and shipping
information, customer and seller IDs, and customer reviews. The dataset also includes
information about the sellers who list their products on Olist, as well as data on customer
behavior and demographics. The dataset is designed to help analysts and researchers better
understand the e-commerce landscape in Brazil and identify opportunities for growth and
optimization.

 https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

**Data Schema**
![1_aXTlOcs3-l0L4Bi_pyiADA](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/62ee1576-c296-4a39-b2f4-12b9267cae28)

The Data analysis involves 

1.Data Exploration

2.Data cleaning

3.Answer Business case Solutions 


## Data Exploration 

I discovered the following issues from the 9 tables:

- Null values

- Unwanted special characters

- Irrelevant columns

- spelling Errors

## 1.  What is the total revenue generated by Olist, and how has it changed over time?
<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236662543-1e1c3be8-3ef5-472a-a4f3-00db2889657e.png" height="200" width="200" >
</p>

To calculate the total revenue generated by Olist over the span of two years(2016-2018) I considered orders which had order status as 'delivered'.
The total revenue generated was around $15.87M.

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236662751-5ef37aa6-f3a7-4fbc-9159-31feaa7e5281.png" height="500" width="500" >
  </p>

When the revenue is compared with year there is a consistent rise in the revenue

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236665702-fa1e4bcb-12f3-42af-bc8e-56098a20ac91.png" height="500" width="500" >
</p>

Based on the above chart, it can be concluded that Olist had its best sales performance in the second quarter of 2018, and the least revenue was generated in the third quarter of 2016, which marks the beginning of the dataset, and the fourth quarter of 2018, which marks the end of the dataset. However, it is important to note that drawing conclusions about the performance of these specific quarters requires more information


<p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236663337-18ac7034-fbf5-461f-bf5d-38a263f10d6f.png)
          
 </p>
The comparison between revenue generated by year and month shows that november of 2017 has best sales in the two years.
 


## 2.How many orders were placed on Olist, and how does this vary by month or season?

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236663526-107388e8-96fe-4784-a0ce-534c46a47f34.png" height="200" width="200" >
 </p>
  
  The Total orders placed on Olist is 99441.
  Below we see the comparison of orders by month and year
  
<p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236663825-3b93a90a-004b-4a36-8c87-7e6f6db6e6ab.png)
  
</p>

The graph shows how the number of orders placed has changed over time. There have been constant fluctuations in the data. The highest peak was achieved in November 2017, followed by January 2018. The least number of orders were recorded at the beginning of the dataset, which is september 2016 and September 2018, where the dataset ends.
The Information obtained can be used to stock inventory and manage staffing levels during the peak months.



## 3. What are the most popular product categories on Olist, and how do their sales volumes compare to each other?

<p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236664692-2b7b66a5-d10a-4651-8d94-01ed6dc6155a.png)
  
</p>

The most popular product category on Olist is bed bath table with total number of orders of 9.4K apporximately with health beauty as the second most poular product category.But higher number of orders does not really imply that these product category have higher sales.
  
<p align="center">  
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/fc533e07-491f-4f48-a677-eb17c19c04b5" height="500" width="500" >
  </p>




## 4. What is the average order value (AOV) on Olist, and how does this vary by product category or payment method?

The average order value (AOV) is metirc used in ecommerce that measures  the average total of every order placed .
The formula for AOV calculation is total revenue/total orders.

<p align="center">  
<img src="https://user-images.githubusercontent.com/53274845/236682313-e6eee299-f6e8-446e-9fc7-8a0c425dc498.png" height="500" width="500" >
</p>


<p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236682252-b1d0f4a9-3419-494f-976e-c38c2ebd7b72.png)
  
</p>

From the information given above it can be seen the highest Average order value is for product category computers.

<p align="center">
  
<img src="https://user-images.githubusercontent.com/53274845/236665854-6a5220ad-73a0-4793-9457-b26a5e57b34a.png" height="500" width="500" >
  
 </p>
Credit card has the highest AOV among the 4 payment types followed by boleto.
Boleto bancário, simply referred to as boleto (English: bank ticket) is a payment method in Brazil regulated by Brazilian Federation of Banks [pt] (FEBRABAN).
A boleto can be paid at ATMs, branch facilities and internet banking of any bank, post office, lottery agent and some supermarkets until its due date.




## 5.How many sellers are active on Olist, and how does this number change over time?

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236682638-1d3c027b-c58e-4541-800e-7b9ad7da77f1.png" height="200" width="200" >
</p>
There are 3056 sellers active on Olist.

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236682958-9f62917e-1dfa-4940-a7fc-2149a39b2c59.png" height="200" width="200">
</p>
In 2016 the number of sellers were least in the enitre duration of dataset.There has been a increase in the number every year,with 2018 reaching the maximum of 2354 sellers.




## 6.What is the distribution of seller ratings on Olist, and how does this impact sales performance

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236683823-c751943a-b9c4-4dcf-9caa-74fc1bd8f831.png" height="500" width="500" >
</p>

In Olist most of sellers belong to the rating 5 category followed by rating 4,which is a good thing as customers are satisfied with the products purchased from most of the sellers.This satisfaction can be due to many factors such as quality of product,price of product,delivery time etc.The third highest sellers belong to the rating 1 category.

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236683676-665fbcf2-5c3d-4fd3-ac82-70a8c17d2de9.png" height="500" width="500" >
 </p>

 Similar trend  can be observed in the revenue generated as sellers with higher rating have more sales and hence more revenue.
 When both the charts are compared there is similairty when in comes to rating in terms of number of sellers and the revenue.




 ## 7.How many customers have made repeat purchases on Olist, and what percentage of total sales do they account for?
 
 ![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/42567e48-4488-488a-82dc-4c867951f763)
 
 The total number of repeat customers in Olist are 2924 and the total customers in Olist are 99441.
 
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/2e197673-032a-4980-b20f-e6be85e7ce22)

The repeat customers in Olist account for about 8.55% of sales approximately.




## 8. What is the average customer rating for products sold on Olist, and how does this impact sales performance?

The graph below depicts the Average of Review Score vs. average of Payment Value and sum of Payment Value. 
Details are shown for Product Category Name English. The data is filtered on Order Status, which excludes canceled.

  
<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236753397-308a004c-eb28-4131-8c9e-857d1b068fc5.png" height="500" width="500" >
</p>

From the plot it is clear that the average customer rating for most of the products sold is 4 and it has a positive impact on the sales.



## 9. What is the average order cancellation rate on Olist, and how does this impact seller performance?

  
<p align="center">
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/f856b000-dd7f-4a51-9c25-85bbbd2f43a2" height="200" width="200" >
 </p>
 
 The average cacellation rate on Olist is 0.63% which is a good thing that there are more customers that are happy with the products they are buying.
 This is a good indicator as it builds the brand value and increases the customer loyalty for the platform.
 
 
 

## 10.What are the top-selling products on Olist, and how have their sales trends changed over time?

 <p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236757406-d23d7821-c09e-4f5a-a8fe-e55a2d597bfe.png)
  
  </p>
Overall the the product with highest sales from 2016-2018 is health beauty,while the most sold product belong to the bed bath table catogory.
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/6889ffb5-339b-4c2b-b388-a136357c8c84)
  
 </p>

<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/b21b1e55-ebed-43fe-bd0d-2909c6c69e02)
  
  </p>
  In 2016 health beauty was the product category with sales greater than 1400k 
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/e9f1cddb-e949-4dd3-a98f-d29b9ae696f4)
  
  </p>
  
 In 2017 bed bath table overtook health beauty category in sales.
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/fdc86a2d-3e6c-4a61-a8c1-f640b46e7c9b)
  
  </p>

In 2018 heath beauty was again the top selling product with most revenue.




## 11.Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?

<p align="center">
  
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/e99d19a2-58f1-4deb-a8a6-8f43d9d89dd5" height="500" width="500" >
  
  </p>
  The most used payment method by Olist customers is credit card with more than 70K orders placed,follwed by boleto with approx 20k orders placed.The least used 
  method was debit card with orders less than 5K.Certain offers or discounts can be offered on the payment type to boost the sales.

  
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/57862c44-db7a-40f6-b806-46ca05faa84c)
  
  </p>

  The table above depicts that even category wise,credit surpasses all other payment methods in terms of preference by customers of Olist.The same trend can be  for the goegraphical regions as shown below.
  
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/419d2d10-0f57-4218-b70c-6fcf4b41dbe4)
  
</p>




## 12: How do customer reviews and ratings affect sales and product performance on Olist?
Answer for the above question can be interpreted from answer of Question 6.



## 13.Which product categories have the highest profit margins on Olist, and how can the company increase profitability across different categories?

<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/0f0975a5-db63-45fc-aa57-0f22b157a306)
  
  </p>
The product category with highest profit margin greater than 70% is  home_comfort_2 .The lowest is small home appliances. 



## 14: How does Olist's marketing spend and channel mix impact sales and customer acquisition costs, and how can the company optimize its marketing strategy to increase ROI?

To increase sales and become more profitable Olist can:
1.Implememnt better marketing strategies
2.offer and discounts on proudcts which are selling well to increase the revneue 
3.Introduce new products in the most profitable category



## 15: Geolocation having high customer density.

![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/29f344fc-2012-469b-b5af-ec1288f56f2a)

Most of the Olist customers are from Sao Paulo followed by Rio de Janeiro.


## References:
1.https://en.wikipedia.org/wiki/Boleto

2.https://www.optimizely.com/optimization-glossary/average-order-value/

3.https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

4.https://marketing4ecommerce.mx/el-ecommerce-crecera-en-mexico-un-32-cada-ano-hacia-2026/  -Image Source











