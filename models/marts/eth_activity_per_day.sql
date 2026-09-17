{{ config(materialized='table', tags=['daily']) }}

SELECT 
date, 
transaction_category, 
COUNT(*) AS tx_count, 
{{ethereum_conversion('value')}} AS sum_eth_value
FROM {{ ref('stg_transactions_enriched') }}
group by 1, 2

-- {{ temporary_macro() }}
