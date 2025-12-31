import pandas as pd

# Load the dataset
df = pd.read_csv('../../datasets/WA_Fn-UseC_-Telco-Customer-Churn.csv')

# Select relevant columns and rename
df_clean = df[['customerID', 'tenure', 'Contract', 'MonthlyCharges', 'Churn']].copy()
df_clean.columns = ['customer_id', 'tenure_months', 'plan_type', 'monthly_charges', 'churn']

# Clean data
# Handle missing values (though this dataset has few)
df_clean = df_clean.dropna()

# Ensure data types
df_clean['tenure_months'] = df_clean['tenure_months'].astype(int)
df_clean['monthly_charges'] = df_clean['monthly_charges'].astype(float)

# Save cleaned data
df_clean.to_csv('cleaned_customer_churn.csv', index=False)

print("Data cleaned and saved to cleaned_customer_churn.csv")