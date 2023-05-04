
--total rows:112650

--null values :No
  
  select *
  FROM [dbo].[order_items_dataset]
  where order_id is null 
      or order_item_id is null
      or product_id is null
      or seller_id is null
      or shipping_limit_date is null
      or price is null
      or freight_value is null 


--duplicates:No

 select order_id
      ,order_item_id
      ,product_id
      ,seller_id
      ,shipping_limit_date
      ,price
      ,freight_value,count(*)
  FROM [dbo].[order_items_dataset]
  group by order_id
      ,order_item_id
      ,product_id
      ,seller_id
      ,shipping_limit_date
      ,price
      ,freight_value 
	  having count(*)>1
    
 -- special characters:No 
    
  select order_id
  FROM [dbo].[order_items_dataset]
  where order_id like '%[^a-zA-Z0-9]%'
  
   select order_item_id
  FROM [dbo].[order_items_dataset]
  where order_item_id like '%[^a-zA-Z0-9]%'
  
   select product_id
  FROM [dbo].[order_items_dataset]
  where product_id like '%[^a-zA-Z0-9]%'
  
   select seller_id
  FROM [dbo].[order_items_dataset]
  where seller_id like '%[^a-zA-Z0-9]%'
  
   select shipping_limit_date
  FROM [dbo].[order_items_dataset]
  where shipping_limit_date like '%[^a-zA-Z0-9.-:]%'
  
   select price
  FROM [dbo].[order_items_dataset]
  where price like '%[^a-zA-Z0-9.]%'
  
   select freight_value
  FROM [dbo].[order_items_dataset]
  where freight_value like '%[^a-zA-Z0-9.]%'