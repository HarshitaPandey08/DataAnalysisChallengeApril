--initially total rows 71

--null values: 0 rows
select * 
from product_category_name_translation
where product_category_name is null or product_category_name_english is null

--duplicates: 0 rows
select product_category_name , product_category_name_english ,count(*)
from product_category_name_translation
group by product_category_name , product_category_name_english 
having count(*)>1
 
--replacing '_' in rows with values like 'health_beauty' to health beauty
update [dbo].[product_category_name_translation]
set product_category_name_english=replace(product_category_name_english,'_',' ')
,product_category_name=replace(product_category_name,'_',' ')


/*when comapring the product_category_name columns of product_category_name_translation and products_dataset table the results shows that
there were 3 category records in the products table we didn't find in the translation table.
They are :
1. pc_gamer
2. portateis_cozinha_e_preparadores_de_alimentos 
3. the Null record 
from the products_dataset table.*/


select distinct product_category_name from products_dataset p
where product_category_name not in
(select distinct [product_category_name] from [product_category_name_translation])

--adding the three rows into the product_category_name_translation
insert into  [product_category_name_translation]
values('pc gamer','gaming pc')
insert into  [product_category_name_translation]
values('portateis cozinha e preparadores de alimentos','Portable kitchen and food preparers
')
insert into  [product_category_name_translation]
values('N/A','N/A')

--total rows:74
