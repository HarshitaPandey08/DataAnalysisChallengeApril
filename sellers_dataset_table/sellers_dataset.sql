--Duplicates:No 

select seller_id,seller_zip_code_prefix,seller_city,seller_state,count(*)
from dbo.sellers_dataset
group by seller_id,seller_zip_code_prefix,seller_city,seller_state
having count(*) >1
  
--Null values: No
select *
from dbo.sellers_dataset
where seller_id is Null or seller_zip_code_prefix is null or seller_city is null or  seller_state is null
  
--Special characters:Yes (seller city)
select seller_id
from dbo.sellers_dataset
where seller_id like '%[^a-zA-Z0-9]%'

select seller_zip_code_prefix
from dbo.sellers_dataset
where seller_zip_code_prefix like '%[^a-zA-Z0-9]%'

select seller_city
from dbo.sellers_dataset
where  seller_city like '%[^a-zA-Z0-9 '']%'

select seller_state
from dbo.sellers_dataset
where seller_state like '%[^a-zA-Z0-9]%'
  
/*seller city has 32 entries with special characters which are as follows
lages - sc
auriflama/sp
sao paulo / sao paulo
santa barbara d´oeste
novo hamburgo, rio grande do sul, brasil
cariacica / es
sao miguel d'oeste
sao paulo - sp
sbc/sp
arraial d'ajuda (porto seguro)
santo andre/sao paulo
sp / sp
maua/sao paulo
mogi das cruzes / sp
rio de janeiro \rio de janeiro
barbacena/ minas gerais
sao paulo - sp
andira-pr
rio de janeiro / rio de janeiro
pinhais/pr
santa barbara d'oeste
santa barbara d'oeste
ribeirao preto / sao paulo
santa barbara d'oeste
santa barbara d'oeste
carapicuiba / sao paulo
vendas@creditparts.com.br
santa barbara d´oeste
sao sebastiao da grama/sp
sao paulo - sp
rio de janeiro, rio de janeiro, brasil
jacarei / sao paulo */
  
 update sellers_dataset
 set seller_city='lajes'
 where seller_city='lages - sc'

/*Replacing the below value with '' 
/sp
/ sao paulo
/ es
- sp
/sao paulo
/ sp
/ rio de janeiro
\rio de janeiro
-pr
/pr*/

update sellers_dataset
set seller_city= REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
seller_city, '/sp', ''), '/ sao paulo', ''), '/ es', ''), '- sp', ''), '/sao paulo', ''), '/ sp', ''),
'/ rio de janeiro', ''), '\rio de janeiro', ''), '-pr', ''), '/pr', '')
where seller_city like '%[^a-zA-Z ]%' 

update sellers_dataset
set seller_city='santa barbara d''oeste'
where seller_city='santa barbara d´oeste'

update sellers_dataset
set seller_city='sao paulo'
where seller_city like'sao pau%'

update sellers_dataset
set seller_city= REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
seller_city, '(porto seguro)', ''), '/ minas gerais', ''), ', rio grande do sul, brasil', ''), ', rio de janeiro, brasil', ''), '@creditparts.com.br', '')
where seller_city like '%[^a-zA-Z ]%' 

--there is one value in sller_city column which is '4482255' the zip_code in the table for this seller_City belongs to rio de janeiro
--therefore replacing this value by rio de janeiro
update sellers_dataset
set seller_city='rio de janeiro'
where seller_city='4482255'


