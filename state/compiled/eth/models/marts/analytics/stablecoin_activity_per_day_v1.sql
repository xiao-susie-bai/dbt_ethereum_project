

SELECT 
t.date, 
t.token_address,     --specific kind of stablecoins (USDT and USDC here)
s.type, 
s.symbol, 

sum(t.value/power(10, s.decimals))
 AS total_usd_value         --each kind of coin has its 'decimal value'(1e6 here)
FROM dbt.xiaobai.stg_token_transfers t
  LEFT JOIN seeds.xiaobai_static.Stablecoins s
    ON t.token_address = s.contract_address

WHERE s.contract_address IS NOT NULL 
GROUP BY 
t.date, 
t.token_address, 
s.type, 
s.symbol