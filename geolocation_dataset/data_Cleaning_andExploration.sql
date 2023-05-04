 --Total rows:10,00,163

  --Null values:nil
  select * from geolocation_dataset
  where geolocation_zip_code_prefix is null or geolocation_lat is null or geolocation_lng
  is null or geolocation_city is null or geolocation_state is null

--repeated values/duplicates: 128174 rows
 select geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state ,count(*) 
  from [dbo].[geolocation_dataset]
  group by geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state 
  having count(*)>1;

  --removing duplicates
  with cte as (select geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state ,row_number() over (partition by geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state order by geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state ) as count_of_duplicate_values
  from [dbo].[geolocation_dataset])
  delete from  cte
where count_of_duplicate_values>1

--checking again if duplicates have been removed or not
--number of duplicate rows :0
select geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state ,count(*) 
  from [dbo].[geolocation_dataset]
  group by geolocation_zip_code_prefix , geolocation_lat , geolocation_lng
  , geolocation_city , geolocation_state 
  having count(*)>1;

  --checking for special characters: Yes (geolocation city has characters like Ã £ 64382 rows)
  select geolocation_zip_code_prefix from [dbo].[geolocation_dataset]
  where geolocation_zip_code_prefix like '%[^0-9]%'

  select  geolocation_lat from [dbo].[geolocation_dataset]
  where  geolocation_lat like '%[^A-Z0-9-.]%'

  select  geolocation_lng from [dbo].[geolocation_dataset]
  where  geolocation_lng like '%[^0-9-.]%'

  select  geolocation_city from [dbo].[geolocation_dataset]
  where  geolocation_city like '%[^a-zA-Z ]%'

  select  geolocation_state from [dbo].[geolocation_dataset]
  where  geolocation_state like '%[^a-zA-Z ]%'