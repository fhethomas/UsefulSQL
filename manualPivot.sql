SELECT p.name, sum(case d.detail when 'good' then 1 else 0 end) AS good,
sum(case d.detail when 'ok' then 1 else 0 end) AS ok,
sum(case d.detail when 'bad' then 1 else 0 end) AS bad
FROM products p
JOIN details d ON p.id = d.product_id
GROUP BY p.name
ORDER BY p.name;
