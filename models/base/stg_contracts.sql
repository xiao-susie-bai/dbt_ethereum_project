{{ config(materialized='incremental', 
          incremental_strategy='microbatch', 
          begin='2026-10-20', 
          event_time='date', 
          batch_size='day', 
          lookback = 2, 
          concurrent_batches=false
   ) }}

SELECT 
address, 
block_number, 
block_timestamp, 
bytecode, 
date, 
last_modified
FROM {{ source('eth', 'contracts') }}
