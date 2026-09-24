{{ config(tags=['stablecoin'], grants={'+select': ['TESTER']}) }}

SELECT 
t.date, 
s.type, 
{{conversion('t.value', 's.decimals')}} AS total_usd_value         --each kind of coin has its 'decimal value'(1e6 here)
FROM {{ ref('stg_token_transfers') }} t
  LEFT JOIN {{ ref('Stablecoins') }} s
    ON t.token_address = s.contract_address
WHERE s.contract_address IS NOT NULL 
GROUP BY 
t.date, 
s.type
