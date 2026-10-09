

SELECT 
hash, 
block_number, 
date, 
from_address, 
to_address, 
value, 
receipt_contract_address, 
input
FROM "ETH"."ETH_SCHEMA".transactions



where date >= (select max(date) from dbt.xiaobai.stg_transactions)

