# Customer Churn Analysis — Key Insights

This section summarises the main findings from the SQL analysis and highlights
their business implications.

---

## Insight 1 — Overall churn is non-trivial
**Evidence:** Query 1 — Overall churn snapshot  

The overall churn rate indicates that a meaningful proportion of customers are
leaving the service. This suggests churn is not an edge case and warrants
targeted investigation rather than reactive handling.

**Implication:**  
Churn should be treated as a strategic problem, not just an operational one.

---

## Insight 2 — Churn is highest in early customer tenure
**Evidence:** Query 2 — Churn by tenure bucket  

Customers within their first few months show the highest churn rate, with churn
declining as tenure increases. This pattern suggests that customers who remain
beyond the early lifecycle are significantly more likely to stay long term.

**Implication:**  
Improving onboarding, early engagement, and first-90-day customer experience
could materially reduce overall churn.

---

## Insight 3 — Long-tenured customers are relatively stable
**Evidence:** Query 2 — Churn by tenure bucket  

Customers with longer tenure show consistently lower churn rates, indicating
higher loyalty and switching resistance over time.

**Implication:**  
Retention efforts may yield higher ROI when focused on early-stage customers
rather than long-tenured ones, who already demonstrate stability.

---

## Insight 4 — A meaningful amount of monthly revenue is associated with churned customers
**Evidence:** Query 3 — Monthly revenue at risk  

The sum of monthly charges for churned customers represents a substantial amount
of monthly recurring revenue associated with churn.

**Implication:**  
Reducing churn does not just improve customer counts — it directly protects
recurring revenue.

---

## Insight 5 — Churn behaviour differs by plan type
**Evidence:** Query 4 — Churn by plan type  

Some plan types exhibit noticeably higher churn rates than others. Differences
in average monthly charges across plans suggest that pricing structure and
contract flexibility may influence churn behaviour.

**Implication:**  
Plan design, pricing strategy, and contract terms should be reviewed to identify
whether certain plans unintentionally encourage churn.

---

## Summary
The analysis indicates that churn is driven primarily by early customer lifecycle
factors and varies across plan types. These findings point toward onboarding,
pricing, and early-engagement improvements as the most effective levers for
reducing churn and protecting recurring revenue.
