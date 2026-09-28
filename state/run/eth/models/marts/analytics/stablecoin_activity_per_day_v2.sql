
  
    



create or replace transient  table dbt.xiaobai_marts.stablecoin_activity_per_day_v2
    
  (
    date date,
    type varchar,
    total_usd_value float
    
    )

    
    
    
    
    as (
    select date, type, total_usd_value
    from (
        

SELECT 
t.date, 
s.type, 

sum(t.value/power(10, s.decimals))
 AS total_usd_value         --each kind of coin has its 'decimal value'(1e6 here)
FROM dbt.xiaobai.stg_token_transfers t
  LEFT JOIN seeds.xiaobai_static.Stablecoins s
    ON t.token_address = s.contract_address
WHERE s.contract_address IS NOT NULL 
GROUP BY 
t.date, 
s.type
    ) as model_subq
    )
;



  