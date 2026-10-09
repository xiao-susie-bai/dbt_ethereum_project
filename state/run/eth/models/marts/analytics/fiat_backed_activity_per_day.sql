
  
    



create or replace transient  table dbt.xiaobai_marts.fiat_backed_activity_per_day
    
    
    
    
    as (SELECT *
FROM dbt.xiaobai_marts.stablecoin_activity_per_day_v1
WHERE type = 'Fiat-backed'
    )
;



  