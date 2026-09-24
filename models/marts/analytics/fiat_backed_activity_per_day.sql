SELECT *
FROM {{ ref('stablecoin_activity_per_day') }}
WHERE type = 'Fiat-backed'