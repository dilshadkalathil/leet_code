 WITH ordered_queue AS (
    SELECT person_name, weight, turn
    FROM Queue
    ORDER BY turn
),
cumulative_weight AS (
    SELECT person_name,
           weight,
           SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM ordered_queue
)
SELECT person_name
FROM cumulative_weight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

    