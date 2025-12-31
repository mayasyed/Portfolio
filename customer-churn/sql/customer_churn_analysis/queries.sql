SELECT
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers;

SELECT
    CASE
        WHEN tenure_months <= 3 THEN '0-3 months'
        WHEN tenure_months <= 6 THEN '4-6 months'
        WHEN tenure_months <= 12 THEN '7-12 months'
        ELSE '12+ months'
    END AS tenure_bucket,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY tenure_bucket;

SELECT
    ROUND(SUM(monthly_charges), 2) AS monthly_revenue_lost
FROM customers
WHERE churn = 'Yes';

SELECT
    plan_type,
    AVG(monthly_charges) AS avg_monthly_charge,
    COUNT(*) AS churned_customers
FROM customers
WHERE churn = 'Yes'
GROUP BY plan_type
ORDER BY churned_customers DESC;