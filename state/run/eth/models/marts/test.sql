
  
    



create or replace transient  table dbt.xiaobai_marts.test
    
    
    
    
    as (

SELECT *
FROM dbt.xiaobai_marts.confirmed_frauds
    )
;



  