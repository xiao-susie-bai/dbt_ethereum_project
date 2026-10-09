
  create or replace   view dbt.xiaobai_marts.stablecoin_activity_per_day
  
  
  
  
  as (
    SELECT * FROM dbt.xiaobai_marts.stablecoin_activity_per_day_v1
  );

