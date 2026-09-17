{{ config(tags=['stablecoin']) }}

SELECT 
transaction_hash, 
date, 
token_address, 
value
FROM {{ source('eth', 'token_transfers') }}
