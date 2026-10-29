{% test assert_value_amount_positive(model, column_name) %}

select sum({{ column_name }}) as total_amount
from {{ model }}

having sum({{ column_name }}) < 0

{% endtest %}