
{{ codegen.generate_source(schema_name='eth_schema', database_name='eth', generate_columns=True) }}     --generate source schema yaml content

{{ codegen.generate_model_yaml(['stg_transactions', 'stg_transactions_enriched', 'stablecoin_activity_per_day']) }}      --generate model schema yaml content


select {{ dbt_utils.star(from=ref('stg_transactions_enriched'), except=['new_field'], quote_identifiers=False) }}
from {{ ref('stg_transactions_enriched') }}


-- audit_helper: compare two sources
{{ audit_helper.compare_relations(source('eth', 'contracts'), source('eth', 'contracts_clone')) }}


{#
{% if execute %}
  {{ audit_helper.compare_relations (
      a_relation=source('eth', 'contracts'), 
      b_relation=source('eth', 'contracts_clone'), 
      primary_key="ADDRESS"
  ) }}
{% endif %}
#}
