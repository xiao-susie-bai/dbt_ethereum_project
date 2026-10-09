
  
    



create or replace transient  table dbt.xiaobai_marts.link_activity_per_day
    
    
    
    
    as (-- var 'token_name_var', 'token_decimals_var' and 'token_address_var' are defined in dbt_project.yml.


SELECT 
t.date, 
t.token_address,     --specific kind of stablecoins (USDT and USDC here)

sum(t.value/power(10, 18))
 AS total_value        --each kind of coin has its 'decimal value'(e.g. 1e6)
FROM dbt.xiaobai.stg_token_transfers t
WHERE lower(t.token_address) = '0x514910771af9ca656af840dff83e8264ecf986ca'
GROUP BY 
t.date, 
t.token_address
    )
;



  