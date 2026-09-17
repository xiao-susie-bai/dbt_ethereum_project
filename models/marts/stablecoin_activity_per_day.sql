{{ config(tags=['stablecoin']) }}

SELECT 
t.date, 
t.token_address,     --specific kind of stablecoins (USDT and USDC here)
s.type, 
s.symbol, 
{{conversion('t.value', 's.decimals')}} AS total_usd_value         --each kind of coin has its 'decimal value'(1e6 here)
FROM {{ ref('stg_token_transfers') }} t
  LEFT JOIN {{ ref('Stablecoins') }} s
    ON t.token_address = s.contract_address
{#
WHERE lower(token_address) IN ('0xdac17f958d2ee523a2206206994597c13d831ec7', '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48')
  OR lower(token_address) IN ( {{ random_macro() }} )
#}
WHERE s.contract_address IS NOT NULL 
GROUP BY 
t.date, 
t.token_address, 
s.type, 
s.symbol
