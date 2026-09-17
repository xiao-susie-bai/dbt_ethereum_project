{{ config(materialized='incremental', incremental_strategy='append') }}

WITH token_transfer_aggs AS (
select 
    transaction_hash, 
    COUNT(*) AS token_transfer_count
from {{ ref('stg_token_transfers') }}
group by 1
), 

transactions_enriched AS (
SELECT 
t.hash, 
t.block_number, 
t.date, 
t.from_address, 
t.to_address, 
t.value, 
t.receipt_contract_address, 
t.input, 
token_transfer_count, 
CASE 
    WHEN t.receipt_contract_address != '' THEN 'contract_creation'
    WHEN tt.transaction_hash IS NOT NULL THEN 'token_transfer'
    WHEN t.input = '0x' AND t.value > 0 THEN 'plain_eth_transfer'
    ELSE 'other'
END AS transaction_category
FROM {{ ref('stg_transactions') }} t
LEFT JOIN token_transfer_aggs tt 
    /*
    {{ ref('eth', 'token_transfers_agg') }} tt       --'ephemeral' model
    */
ON t.hash = tt.transaction_hash


{% if is_incremental() %}
where date >= (select max(date) from {{ this }})
{% endif %}

)

SELECT *
FROM transactions_enriched