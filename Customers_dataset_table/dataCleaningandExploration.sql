--total rows 99441

--null values:No
  select *
  from [dbo].[customers_dataset]
  where customer_id is null or customer_unique_id is null or
  customer_zip_code_prefix is null or customer_city is null
or customer_state is null


--special characters:NO
select customer_id
from  [dbo].[customers_dataset]
where  customer_id like '%[^a-z0-9]%'

select customer_unique_id 
from  [dbo].[customers_dataset]
where  customer_unique_id like '%[^a-z0-9]%'

select customer_zip_code_prefix
from  [dbo].[customers_dataset]
where  customer_zip_code_prefix like '%[^a-z0-9]%'

select customer_city
from  [dbo].[customers_dataset]
where customer_city like '%[^a-zA-Z0-9'' -]%'  

select customer_state
from  [dbo].[customers_dataset]
where  customer_state like '%[^a-z0-9]%'


--duplicate values:NO

select customer_id,customer_unique_id ,
  customer_zip_code_prefix ,customer_city , customer_state 
,count(*)
  from [dbo].[customers_dataset]
  group by customer_id,customer_unique_id ,
  customer_zip_code_prefix ,customer_city , customer_state 
  having count(*) >1
  
 