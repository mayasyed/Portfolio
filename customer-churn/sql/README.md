# SQL Analysis — Customer Churn

This folder contains SQL queries used to analyse customer churn behaviour
using the cleaned Telco Customer Churn dataset.

The queries focus on identifying **who is churning**, **when churn occurs**,
and **which customer segments are most at risk**, with an emphasis on
business-relevant metrics rather than exploratory SQL.

---

## Dataset
The queries are written against a cleaned customer-level table (`customers`)
derived from the Telco Customer Churn dataset.

Key fields used include:
- `churn` – churn status (`Yes` / `No`)
- `tenure_months` – customer tenure in months
- `tenure_bucket` – grouped tenure bands
- `plan_type` – customer contract or plan type
- `monthly_charges` – monthly subscription charges

---

## Files

### `queries.sql`
Contains a set of focused analytical queries, including:
- Overall churn rate
- Churn rate by tenure bucket
- Monthly recurring revenue associated with churned customers
- Churn rate comparison across plan types

Each query is separated by comment blocks describing its purpose.

---

### `insights.md`
Summarises the key findings derived from the SQL queries and translates them
into high-level business implications and recommendations.

Insights are explicitly tied to the corresponding SQL queries to ensure
traceability between analysis and conclusions.

---

## Purpose
The goal of this SQL analysis is not just to calculate metrics, but to
demonstrate how SQL can be used to:
- Answer concrete business questions
- Segment customers meaningfully
- Support data-driven decision making

The outputs from this folder inform both the Python analysis and the
high-level conclusions presented in the project README.
