
  
    



create or replace transient  table dbt.xiaobai_marts.eth_activity_per_day
    
    
    
    
    as (

SELECT 
date, 
transaction_category, 
COUNT(*) AS tx_count, 

sum(value)/1e18
 AS sum_eth_value__Trust
FROM dbt.xiaobai.stg_transactions_enriched
group by 1, 2

-- 




    )
;



  