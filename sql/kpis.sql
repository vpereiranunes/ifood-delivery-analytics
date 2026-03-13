-- KPI 1: Volume e receita total de pedidos entregues
SELECT
    COUNT(DISTINCT o.order_id)                          AS total_pedidos,
    COUNT(DISTINCT o.customer_id)                       AS clientes_unicos,
    ROUND(SUM(oi.price + oi.freight_value), 2)          AS receita_total,
    ROUND(AVG(oi.price + oi.freight_value), 2)          AS ticket_medio
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';

-- KPI 2: Pedidos por mês (sazonalidade)
SELECT
    strftime('%Y-%m', o.order_purchase_timestamp)       AS mes,
    COUNT(DISTINCT o.order_id)                          AS pedidos,
    ROUND(SUM(oi.price + oi.freight_value), 2)          AS receita
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

-- KPI 3: Top 10 estados por receita
SELECT
    c.customer_state                                    AS estado,
    COUNT(DISTINCT o.order_id)                          AS pedidos,
    ROUND(SUM(oi.price + oi.freight_value), 2)          AS receita,
    ROUND(AVG(oi.price + oi.freight_value), 2)          AS ticket_medio
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY receita DESC
LIMIT 10;

-- KPI 4: Top 10 categorias por receita
SELECT
    COALESCE(ct.string_field_1, p.product_category_name, 'sem_categoria') AS categoria,
    COUNT(DISTINCT o.order_id)                          AS pedidos,
    ROUND(SUM(oi.price + oi.freight_value), 2)          AS receita,
    ROUND(AVG(oi.price + oi.freight_value), 2)          AS ticket_medio
FROM orders o
JOIN order_items oi  ON o.order_id = oi.order_id
JOIN products p      ON oi.product_id = p.product_id
LEFT JOIN category_translation ct ON p.product_category_name = ct.string_field_0
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY receita DESC
LIMIT 10;

-- KPI 5: Tempo médio de entrega por estado (em dias)
SELECT
    c.customer_state                                    AS estado,
    ROUND(AVG(
        julianday(o.order_delivered_customer_date) -
        julianday(o.order_purchase_timestamp)
    ), 1)                                               AS dias_entrega_medio,
    COUNT(*)                                            AS pedidos
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY 1
ORDER BY dias_entrega_medio;