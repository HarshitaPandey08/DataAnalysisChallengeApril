--total rows:32951

--removing leading and trailing spaces
  update [dbo].[products_dataset] 
  set product_description_lenght =rtrim(ltrim(product_description_lenght)),
  product_photos_qty =rtrim(ltrim(product_photos_qty)),product_weight_g =rtrim(ltrim(product_weight_g)),
  product_length_cm =rtrim(ltrim(product_length_cm)),product_height_cm =rtrim(ltrim(product_height_cm)),
  product_width_cm=rtrim(ltrim(product_width_cm))

  --correcting and renaming column names
  EXEC sp_rename '[dbo].[products_dataset].[product_name_lenght]', 'product_name_length', 'COLUMN';
  EXEC sp_rename '[dbo].[products_dataset].[product_description_lenght]', 'product_description_length', 'COLUMN';
	
--Null values (611 rows where product_category_name, product_name_length, product_description_length, product_photos_qty is null,product_weight_g product_length_cm, product_height_cm, product_width_cm )
select * from [dbo].[products_dataset]
where product_id is null or
      product_category_name
      is null or product_name_length
      is null or product_description_length
      is null or product_photos_qty
      is null or product_weight_g
      is null or product_length_cm
      is null or product_height_cm
      is null or product_width_cm is null 
      
 --replacing null values with N/A and 0 according to type of data
 update [dbo].[products_dataset] 
set product_category_name=coalesce(product_category_name,'N/A'),
product_name_length=coalesce(product_name_length,0),
product_description_length=coalesce(product_description_length,0),
product_photos_qty=coalesce(product_photos_qty,0),
product_weight_g=coalesce(product_weight_g,0),
product_length_cm=coalesce(product_length_cm,0),
product_height_cm=coalesce(product_height_cm,0),
product_width_cm=coalesce(product_width_cm,0)

--duplicate values:NIL
select product_id ,product_category_name,product_name_length,product_description_length
      ,product_photos_qty,product_weight_g,product_length_cm,product_height_cm
     ,product_width_cm ,count(*) from [dbo].[products_dataset]
	 group by product_id ,product_category_name,product_name_length,product_description_length
      ,product_photos_qty,product_weight_g,product_length_cm,product_height_cm
     ,product_width_cm 
	 having count(*)>1

--special characters (Yes product_category_name has rows with values esporte_lazer)
select product_id  from [dbo].[products_dataset]
where product_id like '%[^a-zA-Z0-9]%'

select product_category_name  from [dbo].[products_dataset]
where product_category_name like '%[^a-zA-Z0-9]%'

select product_name_length  from [dbo].[products_dataset]
where product_name_length like '%[^a-zA-Z0-9]%'

select product_description_length  from [dbo].[products_dataset]
where product_description_length like '%[^a-zA-Z0-9]%'

select product_photos_qty from [dbo].[products_dataset]
where product_photos_qty like '%[^a-zA-Z0-9]%'

select product_weight_g  from [dbo].[products_dataset]
where product_weight_g like '%[^a-zA-Z0-9]%'

select product_length_cm  from [dbo].[products_dataset]
where product_length_cm like '%[^a-zA-Z0-9]%'

select product_height_cm  from [dbo].[products_dataset]
where product_height_cm like '%[^a-zA-Z0-9]%'

select product_width_cm  from [dbo].[products_dataset]
where product_width_cm like '%[^a-zA-Z0-9]%'

--replacing special characters in product_category_name column from esporte_lazer to esporte lazer
update [dbo].[products_dataset]
set product_category_name=replace(product_category_name,'_',' ')

