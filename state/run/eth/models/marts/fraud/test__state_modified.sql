
  
    



create or replace transient  table dbt.xiaobai_marts.test__state_modified
    
    
    
    
    as (SELECT *
FROM dbt.xiaobai_marts.eth_activity_per_day
    )
;



  