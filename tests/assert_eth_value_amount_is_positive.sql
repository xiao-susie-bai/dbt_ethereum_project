select sum(value) as total_amount
from {{ ref('stg_transactions_enriched') }}
having sum(value) < 0