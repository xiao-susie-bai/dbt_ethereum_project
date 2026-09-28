

SELECT 
t.from_address, 
c.bytecode, 
count(c.bytecode) bytecode_count
FROM dbt.xiaobai.stg_transactions_enriched t
  LEFT JOIN dbt.xiaobai.stg_contracts c
    ON t.receipt_contract_address = c.address
WHERE t.transaction_category = 'contract_creation'
  AND c.bytecode IS NOT NULL
GROUP BY 1, 2