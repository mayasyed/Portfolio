import pandas as pd

# Load the dataset
df = pd.read_csv('../../datasets/telco_customer_churn_raw.csv')

# Select relevant columns and rename
df_clean = df[['customerID', 'gender', 'SeniorCitizen', 'Partner', 'Dependents', 'tenure', 'PhoneService', 'MultipleLines', 'InternetService', 'OnlineSecurity', 'OnlineBackup', 'DeviceProtection', 'TechSupport', 'StreamingTV', 'StreamingMovies', 'Contract', 'PaperlessBilling', 'PaymentMethod', 'MonthlyCharges', 'TotalCharges', 'Churn']].copy()
df_clean.columns = ['customer_id', 'gender', 'senior_citizen', 'partner', 'dependents', 'tenure_months', 'phone_service', 'multiple_lines', 'internet_service', 'online_security', 'online_backup', 'device_protection', 'tech_support', 'streaming_tv', 'streaming_movies', 'plan_type', 'paperless_billing', 'payment_method', 'monthly_charges', 'total_charges', 'churn']

# Clean data
# Handle missing values (though this dataset has few)
df_clean['total_charges'] = pd.to_numeric(
    df_clean['total_charges'],
    errors='coerce'
)
df_clean['churn_flag'] = (df_clean['churn'] == 'Yes').astype(int)

initial_rows = len(df_clean)
df_clean = df_clean.dropna()


# Ensure data types
df_clean['tenure_months'] = df_clean['tenure_months'].astype(int)
df_clean['monthly_charges'] = df_clean['monthly_charges'].astype(float)

# Save cleaned data
df_clean.to_csv('../../datasets/telco_customer_churn_clean.csv', index=False)
final_rows = len(df_clean)
print(f"Dropped {initial_rows - final_rows} rows during cleaning")
print("Data cleaned and saved to telco_customer_churn_clean.csv")