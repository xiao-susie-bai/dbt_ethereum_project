{% macro random_macro() %}

{% set query %}

SELECT 
DISTINCT 
token_address
FROM {{ ref('stg_token_transfers') }}
LIMIT 10

{% endset %}

{% if execute %}

{% set results = run_query(query) %}
{% set result_list = results.columns[0].values() %}

{% else %}
{% set result_list = [] %}

{% endif %}

-- exploring to reconstruct the results_list values list *in the right formatting ("values list with single quotes/double quotes..", debugging & fixing, etc)*:
{% set sql = [] %}
{% for i in result_list %}
{% do sql.append("'"~i~"'") %}
{% endfor %}

{{ log(sql | join(','), info=True) }}
{{ return(sql | join(',')) }}
--

-- (1st attempt to return the 'result_list' as output, not in the right formatting:)
{#
{{ log(result_list, info=True) }}

{{ return(result_list) }}
#}
--

{% endmacro %}