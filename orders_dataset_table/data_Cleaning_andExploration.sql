--total rows 99441

--null values(2980 rows)
  --order_approved_at], [order_delivered_carrier_date],[order_delivered_customer_date] is null 
  select * 
  from[dbo].[orders_dataset]
  where [order_id] is null or [customer_id] is null or[order_status]is null or[order_purchase_timestamp]
      is null or [order_approved_at] is null or [order_delivered_carrier_date]
	  is null or[order_delivered_customer_date]is null or[order_estimated_delivery_date] is null

 --duplicate value:NIL
  select  [order_id], [customer_id],[order_status],[order_purchase_timestamp]
     , [order_approved_at], [order_delivered_carrier_date]
	  ,[order_delivered_customer_date],[order_estimated_delivery_date],count(* )
  from[dbo].[orders_dataset]
  group by  [order_id], [customer_id],[order_status],[order_purchase_timestamp]
     , [order_approved_at], [order_delivered_carrier_date]
	  ,[order_delivered_customer_date],[order_estimated_delivery_date]
  having count(*)>1

  --special characters NIL
  select  [order_id]
  from[dbo].[orders_dataset]
  where [order_id] like '%[^a-zA-Z0-9]%'

  select  [customer_id]
  from[dbo].[orders_dataset]
  where [customer_id] like '%[^a-zA-Z0-9]%'

  select [order_status]
  from[dbo].[orders_dataset]
  where [order_status] like '%[^a-zA-Z0-9]%'

  select  [order_purchase_timestamp]
  from[dbo].[orders_dataset]
  where [order_purchase_timestamp] like '%[^a-zA-Z0-9-.:]%'

  select  [order_approved_at]
  from[dbo].[orders_dataset]
  where [order_approved_at] like '%[^a-zA-Z0-9-.:]%'

  select  [order_delivered_carrier_date]
  from[dbo].[orders_dataset]
  where [order_delivered_carrier_date] like '%[^a-zA-Z0-9-.:]%'

  select  [order_delivered_customer_date]
  from[dbo].[orders_dataset]
  where [order_delivered_customer_date] like '%[^a-zA-Z0-9-.:]%'

  select  [order_estimated_delivery_date]
  from[dbo].[orders_dataset]
  where [order_estimated_delivery_date] like '%[^a-zA-Z0-9-.:]%'
  
 -- instead of replacing null values in order_approved_at,order_delivered_carrier_date order_delivered_customer_date leave it as it is
