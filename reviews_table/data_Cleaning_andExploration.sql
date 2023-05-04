--total rows:1,00,000
 
 --Duplicates:No (when grouping columns that means there is no duplicate rows with similar values considering all the columns together)
 select review_id,order_id,review_score,review_comment_title,
  review_comment_message,review_creation_date,review_answer_timestamp,count(*)
  from dbo.order_reviews
  group by review_id,order_id,review_score,review_comment_title,
  review_comment_message,review_creation_date,review_answer_timestamp
  having count(*) >1
  
  
  --Null values: Yes (in columns review_comment_title and review_comment_message no of rows:90015)
  select *
  from dbo.order_reviews
  where review_id is null or order_id is null or review_score is null or review_comment_title is null or 
  review_comment_message is null or review_creation_date is null or review_answer_timestamp is null
  
  --replacing null values with N/A or 0 depending on the data type
   update dbo.order_reviews
  set review_comment_title=coalesce(review_comment_title,'N/A'),
  review_comment_message=coalesce(review_comment_message,'N/A')
  
  --special characters: yes (review_comment_title,review_comment_message)
  --since for this case study the abpve two columns are not importance,therefore leave these twp columns as it is.
  --review_comment_title 3513 rows
  --review_comment_message 33527 rows
  
  
  select review_id
  from dbo.order_reviews
 where  review_id like '%[^a-zA-Z0-9]%'

  select order_id
  from dbo.order_reviews
 where  order_id like '%[^a-zA-Z0-9]%'
  
   select review_score
  from dbo.order_reviews
 where  review_score like '%[^a-zA-Z0-9]%'

  select review_comment_title
  from dbo.order_reviews
 where  review_comment_title like '%[^a-zA-Z0-9 /]%' 

  select review_comment_message
  from dbo.order_reviews
 where  review_comment_message like '%[^a-zA-Z0-9 /]%' 

  select review_creation_date
  from dbo.order_reviews
 where  review_creation_date like '%[^a-zA-Z0-9-:.]%'

 select review_answer_timestamp
  from dbo.order_reviews
 where  review_answer_timestamp like '%[^a-zA-Z0-9-:.]%'


 
