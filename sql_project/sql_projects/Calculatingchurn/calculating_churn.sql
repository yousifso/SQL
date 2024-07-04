-- Define monthly intervals for analysis in a CTE (Common Table Expression)
WITH months AS (
    SELECT '2017-01-01' as first_day, '2017-01-31' as last_day
    UNION
    SELECT '2017-02-01' as first_day, '2017-02-28' as last_day
    UNION
    SELECT '2017-03-01' as first_day, '2017-03-31' as last_day
),
-- Cross join subscriptions with months to align subscription data within monthly intervals
cross_join AS (
    SELECT *
    FROM subscriptions
    CROSS JOIN months
),

-- Define subscriber status within each month, identifying active and canceled subscriptions
status AS (
    SELECT id, first_day AS month,
    CASE
      WHEN (subscription_start < first_day)
      AND (subscription_end > first_day OR subscription_end IS NULL) THEN 1
      ELSE 0
    END as is_active_87,
    CASE
      WHEN (subscription_start < first_day)
      AND (subscription_end > first_day OR subscription_end IS NULL) THEN 1
      ELSE 0
    END as is_active_30,
    CASE
      WHEN subscription_end BETWEEN first_day AND last_day
      AND (segment = 87) THEN 1
      ELSE 0
    END as is_canceled_87,
    CASE
      WHEN subscription_end BETWEEN first_day AND last_day
      AND (segment = 30) THEN 1
      ELSE 0
    END as is_canceled_30
    FROM cross_join
),

-- Aggregate the statuses to compute the total number of active and canceled subscriptions for each month
status_aggregate AS (
    SELECT month,
    SUM(is_active_87) as sum_active_87,
    SUM(is_active_30) as sum_active_30,
    SUM(is_canceled_87) as sum_canceled_87,
    SUM(is_canceled_30) as sum_canceled_30
    FROM status
    GROUP BY month
)

-- Calculate the churn rate for each segment (87 and 30) by dividing the number of cancellations by the number of active subscriptions
SELECT month,
  1.0 * sum_canceled_87 / sum_active_87 as churn_rate_87,
  1.0 * sum_canceled_30 / sum_active_30 as churn_rate_30
FROM status_aggregate;
