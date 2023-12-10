SELECT c.customer_name, format(CAST(SUM(i.total_price),6)) AS total_amount
FROM customer c
INNER JOIN invoice i ON c.id=i.customer_id
GROUP BY c.customer_name
HAVING SUM(i.total_price)<0.25*(SELECT AVG(total_price) FROM invoice)
ORDER BY total_amount DESC;
