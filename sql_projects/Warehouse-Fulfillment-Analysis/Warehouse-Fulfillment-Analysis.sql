-- Select warehouse details and calculate order counts and fulfillment summary
SELECT
  Warehous.warehouse_id,  -- Select warehouse ID for grouping
  CONCAT(Warehous.state, ": ", Warehous.warehouse_alias) AS warehouse_name,  -- Combine state and alias for a descriptive name
  COUNT(Orders.order_id) AS number_of_orders,  -- Count number of orders per warehouse
  (SELECT COUNT(*) FROM `my-second-project-429115.Warehouse_data.orders` AS Orders) AS total_orders,  -- Subquery to get total orders for percentage calculation
  CASE
    -- Calculate fulfillment rate and categorize into three buckets
    WHEN COUNT(Orders.order_id) / (SELECT COUNT(*) FROM `my-second-project-429115.Warehouse_data.orders`) <= 0.20
    THEN 'Fulfilled 0-20% of orders'
    WHEN COUNT(Orders.order_id) / (SELECT COUNT(*) FROM `my-second-project-429115.Warehouse_data.orders`) > 0.20
    AND COUNT(Orders.order_id) / (SELECT COUNT(*) FROM `my-second-project-429115.Warehouse_data.orders`) <= 0.60
    THEN 'Fulfilled 21-60% of orders'
    ELSE 'Fulfilled more than 60% of orders'
  END AS `Fulfillment Summary`
FROM 
  `my-second-project-429115.Warehouse_data.orders` AS Orders  -- Main orders table
LEFT JOIN
  `my-second-project-429115.Warehouse_data.warehouse` AS Warehous  -- Join with warehouse table
ON
  Orders.warehouse_id = Warehous.warehouse_id  -- Join condition on warehouse ID
GROUP BY
  Warehous.warehouse_id,
  warehouse_name  -- Group by warehouse to summarize data
HAVING
  COUNT(Orders.order_id) > 0;  -- Only include warehouses with orders
