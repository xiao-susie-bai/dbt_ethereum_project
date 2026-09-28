  

select 
transaction_hash, 
COUNT(*) AS token_transfer_count
from dbt.xiaobai.stg_token_transfers
group by 1