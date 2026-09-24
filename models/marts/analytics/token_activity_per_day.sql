{{ config(tags=['token'], alias=var('token_name_var')~'_activity_per_day') }}

SELECT 
t.date, 
t.token_address,     --specific kind of stablecoins (USDT and USDC here)
{{conversion('t.value', var('token_decimals_var')) }} AS total_value        --each kind of coin has its 'decimal value'(e.g. 1e6)
FROM {{ ref('stg_token_transfers') }} t
WHERE lower(t.token_address) = '{{ var("token_address_var") }}'
GROUP BY 
t.date, 
t.token_address
