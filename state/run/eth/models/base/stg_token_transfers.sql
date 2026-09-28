
  
    



create or replace transient  table dbt.xiaobai.stg_token_transfers
    
    
    
    
    as (

SELECT 
transaction_hash, 
date, 
token_address, 
value
FROM "ETH"."ETH_SCHEMA".token_transfers
    )
;



  