-- Rank orders
SELECT order_id, amount,
RANK() OVER(ORDER BY amount DESC) AS rank1
FROM orders;

-- Dense rank
SELECT order_id, amount,
DENSE_RANK() OVER(ORDER BY amount DESC) AS dense_rank1
FROM orders;

-- Previous order amount
SELECT order_id, amount,
LAG(amount) OVER(ORDER BY amount DESC) AS previous_amount
FROM orders;

-- Compare difference
SELECT order_id, amount,
LAG(amount) OVER(ORDER BY order_id) AS prev_amount,
amount - LAG(amount) OVER(ORDER BY order_id) AS difference 
FROM orders;

-- Rank all orders
SELECT order_id, amount,
RANK() OVER(ORDER BY amount DESC) AS rank1
FROM orders;

-- Identify tied ranking
SELECT order_id, amount,
DENSE_RANK() OVER(ORDER BY amount DESC) AS rank1
FROM orders;

-- Sales trend (increase/decrease)
SELECT order_id, amount,
LAG(amount) OVER(ORDER BY order_id) AS prev_amount,
amount - LAG(amount) OVER(ORDER BY order_id) AS changes
FROM orders;

-- Highest growth order
SELECT *
FROM (
    SELECT order_id, amount,
    amount - LAG(amount) OVER(ORDER BY order_id) AS growth 
    FROM orders
) t 
ORDER BY growth DESC
LIMIT 1;