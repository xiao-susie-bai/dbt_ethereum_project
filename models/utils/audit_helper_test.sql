
--audit_helper: compare two sources
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
