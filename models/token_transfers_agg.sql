{{ config(materialized='ephemeral') }}  

select 
transaction_hash, 
COUNT(*) AS token_transfer_count
from {{ ref('stg_token_transfers') }}
group by 1