{{ config(group='fraud_risk', access='protected') }}

SELECT *
FROM {{ ref('confirmed_frauds') }}
