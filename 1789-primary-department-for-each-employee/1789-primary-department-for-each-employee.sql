SELECT employee_id,
       -- If the primary department exists (primary_flag = 'Y'), use that
       COALESCE(
           (SELECT department_id
            FROM Employee e2
            WHERE e2.employee_id = e1.employee_id AND e2.primary_flag = 'Y' LIMIT 1),
           (SELECT department_id
            FROM Employee e2
            WHERE e2.employee_id = e1.employee_id LIMIT 1)
       ) AS department_id
FROM Employee e1
GROUP BY e1.employee_id;


