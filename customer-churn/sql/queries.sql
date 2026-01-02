/* =========================================================
   Query 1: Overall churn snapshot
   Purpose: High-level churn rate across all customers
   ========================================================= */
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS churn_rate_pct
FROM customers;



/* =========================================================
   Query 2: Churn by tenure bucket
   Purpose: Identify when customers are most likely to churn
   ========================================================= */
SELECT
  CASE
    WHEN tenure_months <= 3 THEN '0–3'
    WHEN tenure_months <= 6 THEN '4–6'
    WHEN tenure_months <= 12 THEN '7–12'
    WHEN tenure_months <= 24 THEN '13–24'
    WHEN tenure_months <= 60 THEN '25–60'
    ELSE '60+'
  END AS tenure_bucket,
  COUNT(*) AS customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS churn_rate_pct
FROM customers
GROUP BY tenure_bucket
ORDER BY
  CASE tenure_bucket
    WHEN '0–3' THEN 1
    WHEN '4–6' THEN 2
    WHEN '7–12' THEN 3
    WHEN '13–24' THEN 4
    WHEN '25–60' THEN 5
    WHEN '60+' THEN 6
  END;



/* =========================================================
   Query 3: Monthly revenue at risk from churned customers
   Purpose: Estimate MRR associated with churned customers
   ========================================================= */
SELECT
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    SUM(CASE WHEN churn = 'Yes' THEN monthly_charges ELSE 0 END),
    2
  ) AS churned_mrr_at_risk
FROM customers;



/* =========================================================
   Query 4: Churn by plan type
   Purpose: Compare churn rates across different plans
   ========================================================= */
SELECT
  plan_type,
  COUNT(*) AS customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS churn_rate_pct,
  ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM customers
GROUP BY plan_type
ORDER BY churn_rate_pct DESC;
