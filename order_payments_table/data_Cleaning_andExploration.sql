--total rows:103886

 --Removing leading and trailing spaces   in payment_installments,payment_value
 
 update [dbo].[order_payments_dataset]
  set payment_installments=RTRIM(LTRIM(payment_installments)),
   payment_value=RTRIM(LTRIM(payment_value))
   
   
    --null values :NIL
  select *
  from [dbo].[order_payments_dataset]
  where order_id is null or
      payment_sequential is null or
      payment_type is null or
      payment_installments is null or
      payment_value is null 

	  --duplicates:nil
	  select order_id ,
      payment_sequential ,
      payment_type ,
      payment_installments ,
      payment_value ,count(*)
	  from [dbo].[order_payments_dataset]
	  group by order_id ,
      payment_sequential ,
      payment_type ,
      payment_installments ,
      payment_value 
	  having count(*)>1


--special characters:NIL
select order_id
  from [dbo].[order_payments_dataset]
  where order_id like '%[^a-zA-z0-9]%'

  select payment_sequential
  from [dbo].[order_payments_dataset]
  where payment_sequential like '%[^a-zA-z0-9]%'

  select payment_type
  from [dbo].[order_payments_dataset]
  where payment_type like '%[^a-zA-z0-9_]%'

  select payment_installments
  from [dbo].[order_payments_dataset]
  where payment_installments like '%[^a-zA-z0-9]%'

  select payment_value
  from [dbo].[order_payments_dataset]
  where payment_value like '%[^a-zA-z0-9.]%'