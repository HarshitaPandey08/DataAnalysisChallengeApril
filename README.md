# Olist E-commerce Data Analysis


**- Harshita Pandey**



![p2](https://user-images.githubusercontent.com/53274845/236129119-c458b1b9-e0e8-490d-b28a-5fcb2bb1857d.jpg)


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


![1_aXTlOcs3-l0L4Bi_pyiADA](https://user-images.githubusercontent.com/53274845/236130348-69a03e11-4d35-48f5-b3cf-37abb1994d20.jpg)

The Data analysis involves 

1.Data Exploration

2.Data cleaning

3.Answer Business case Solutions 

4.Insights


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

  
<p align="center">  
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/fc533e07-491f-4f48-a677-eb17c19c04b5" height="500" width="500" >
  </p>



## 4. What is the average order value (AOV) on Olist, and how does this vary by product category or payment method?

<p align="center">  
<img src="https://user-images.githubusercontent.com/53274845/236682313-e6eee299-f6e8-446e-9fc7-8a0c425dc498.png" height="500" width="500" >
</p>


<p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236682252-b1d0f4a9-3419-494f-976e-c38c2ebd7b72.png)
  
</p>

<p align="center">
  
<img src="https://user-images.githubusercontent.com/53274845/236665854-6a5220ad-73a0-4793-9457-b26a5e57b34a.png" height="500" width="500" >
  
 </p>


## 5.How many sellers are active on Olist, and how does this number change over time?**

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236682638-1d3c027b-c58e-4541-800e-7b9ad7da77f1.png" height="200" width="200" >
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236682958-9f62917e-1dfa-4940-a7fc-2149a39b2c59.png" height="200" width="200">
</p>


## 6.What is the distribution of seller ratings on Olist, and how does this impact sales performance**


<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236683676-665fbcf2-5c3d-4fd3-ac82-70a8c17d2de9.png" height="500" width="500" >
 </p>

  
<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236683823-c751943a-b9c4-4dcf-9caa-74fc1bd8f831.png" height="500" width="500" >
</p>

## 8. What is the average customer rating for products sold on Olist, and how does this impact sales performance?**

Average of Review Score vs. average of Payment Value and sum of Payment Value.  Details are shown for Product Category Name English. The data is filtered on Order Status, which excludes canceled.

  
<p align="center">
<img src="https://user-images.githubusercontent.com/53274845/236753397-308a004c-eb28-4131-8c9e-857d1b068fc5.png" height="500" width="500" >
</p>

## 9. What is the average order cancellation rate on Olist, and how does this impact seller
performance?**

  
<p align="center">
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/f856b000-dd7f-4a51-9c25-85bbbd2f43a2" height="200" width="200" >
 </p>

## 10.What are the top-selling products on Olist, and how have their sales trends changed over time?**

 <p align="center">
  
![image](https://user-images.githubusercontent.com/53274845/236757406-d23d7821-c09e-4f5a-a8fe-e55a2d597bfe.png)
  
  </p>

<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/6889ffb5-339b-4c2b-b388-a136357c8c84)
  
 </p>

<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/b21b1e55-ebed-43fe-bd0d-2909c6c69e02)
  
  </p>

  
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/fdc86a2d-3e6c-4a61-a8c1-f640b46e7c9b)
  
  </p>

<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/e9f1cddb-e949-4dd3-a98f-d29b9ae696f4)
  
  </p>


## 11.Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?**

<p align="center">
  
<img src="https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/e99d19a2-58f1-4deb-a8a6-8f43d9d89dd5" height="500" width="500" >
  
  </p>

  
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/57862c44-db7a-40f6-b806-46ca05faa84c)
  
  </p>

  
<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/419d2d10-0f57-4218-b70c-6fcf4b41dbe4)
  
</p>



## 13.Which product categories have the highest profit margins on Olist, and how can the company increase profitability across different categories?**

<p align="center">
  
![image](https://github.com/HarshitaPandey08/DataAnalysisChallengeApril/assets/53274845/0f0975a5-db63-45fc-aa57-0f22b157a306)
  
  </p>













