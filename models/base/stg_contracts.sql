{{ config(materialized='view') }}

SELECT 
address, 
block_number, 
block_timestamp, 
bytecode, 
date, 
last_modified
FROM {{ source('eth', 'contracts') }}
