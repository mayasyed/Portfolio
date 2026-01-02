# Python Analysis — Customer Churn

This folder contains Python scripts and notebooks used to clean, explore,
and analyse customer churn data from the Telco Customer Churn dataset.

The Python analysis complements the SQL queries by providing deeper
exploratory analysis, visualisation, and validation of churn patterns
identified in SQL.

---

## Purpose
Python is used in this project to:
- Clean and prepare raw customer data for analysis
- Explore churn behaviour through exploratory data analysis (EDA)
- Visualise relationships between customer attributes and churn
- Support and validate insights derived from SQL analysis

---

## Files

### `data_cleaning.py`
A standalone script responsible for:
- Loading the raw dataset
- Selecting and renaming relevant columns
- Handling data type issues and missing values
- Producing a cleaned, analysis-ready dataset

The raw dataset is treated as immutable, and all transformations are applied
programmatically to ensure reproducibility.

---

### `churn_analysis.ipynb`
A Jupyter notebook that performs exploratory data analysis on the cleaned
dataset, including:
- High-level churn metrics
- Analysis of churn across tenure, plan types, and pricing
- Visualisation of churn patterns using charts and summary tables
- Interpretation of findings to support business conclusions

The notebook is structured to prioritise readability and clear narrative
over exhaustive experimentation.

---

## Relationship to SQL Analysis
The Python analysis builds on the same cleaned dataset used in the SQL
analysis. While SQL focuses on metric-driven segmentation, Python is used
to explore trends, validate findings, and provide additional context through
visual analysis.

Together, the SQL and Python analyses form a cohesive end-to-end workflow
from data preparation to insight generation.

---

## Output
The outputs from this folder inform the key insights documented in:
- `sql/insights.md`
- `customer-churn/README.md`

This ensures alignment between code, analysis, and final conclusions.
