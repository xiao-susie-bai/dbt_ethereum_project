{{ config(group='fraud_risk', access='private') }}

SELECT *
FROM {{ ref('stg_transactions_enriched') }}
WHERE from_address IN ('0x16F09B37b20bfBB07130bBA8226299926E39b488', 
                       '0x80D04079Ffc53eb14edBEeB37279D126F45552df'
                      )
