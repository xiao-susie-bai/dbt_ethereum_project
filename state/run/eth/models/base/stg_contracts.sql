
  create or replace   view dbt.xiaobai.stg_contracts
  
  
  
  
  as (
    

SELECT 
address, 
block_number, 
block_timestamp, 
bytecode, 
date, 
last_modified
FROM "ETH"."ETH_SCHEMA".cnt
  );

