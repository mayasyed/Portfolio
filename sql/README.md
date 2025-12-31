customer-churn-analysis
git clone https://github.com/yourusername/customer-churn-analysis.git
cd customer-churn-analysis
mkdir -p sql/customer_churn_analysis
mkdir -p python/customer_churn_analysis
mkdir -p dashboards/customer_churn_dashboard
python/customer_churn_analysis/data/churn.csv

CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    tenure_months INTEGER,
    plan_type TEXT,
    monthly_charges REAL,
    churn TEXT
);

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

import pandas as pd

def clean_churn_data(df):
    df = df.copy()

    df.columns = df.columns.str.lower().str.replace(" ", "_")

    df['tenure_months'] = df['tenure_months'].fillna(0)
    df['monthly_charges'] = df['monthly_charges'].astype(float)

    df['churn'] = df['churn'].str.strip()

    return df

