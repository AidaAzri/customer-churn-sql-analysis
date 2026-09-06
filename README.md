# Customer Churn Analysis Using SQL

## Project Overview

This project analyses customer churn patterns using SQL and PostgreSQL. The analysis explores customer characteristics associated with higher churn rates and identifies segments that may warrant further investigation for customer retention efforts.

## Objective

The objective of this project is to use SQL to:

- Analyse customer churn patterns
- Calculate churn rates across different customer segments
- Identify customer characteristics associated with higher churn
- Generate findings that could support customer retention analysis

## Dataset

The project uses the **IBM Telco Customer Churn sample dataset**, which represents a fictional telecommunications company serving 7,043 customers.

The dataset contains customer information including:

- Demographics
- Tenure
- Contract type
- Internet service
- Payment method
- Monthly charges
- Total charges
- Churn status

## Tools Used

- PostgreSQL
- SQL
- pgAdmin

## Data Preparation

During the import process, whitespace values in the `TotalCharges` column were treated as missing values (`NULL`) because the column was stored as a numeric field.

## SQL Analysis

The analysis includes:

1. Customer and churn overview
2. Churn rate by contract type
3. Churn rate by tenure group
4. Churn rate by payment method
5. Churn rate by internet service
6. Churn rate by senior citizen status
7. Segment-level churn analysis
8. Filtering and aggregation using `WHERE` and `HAVING`
9. A `JOIN` demonstration using a supporting contract information table

## Key Findings

- Overall customer churn rate was **26.5%**.
- Month-to-month customers had the highest churn rate at **42.7%**.
- Customers with 0–12 months of tenure had the highest churn rate at **47.4%**.
- Customers using electronic checks had the highest churn rate among payment methods at **45.3%**.
- Fiber optic customers had the highest churn rate among internet service types at **41.9%**.
- Senior citizen customers had a higher churn rate than non-senior citizen customers (**41.5% vs. 23.6%**).
- Among month-to-month customers, fiber optic users had a churn rate of **54.6%**.
- Among customers with 0–12 months of tenure, month-to-month customers had a churn rate of **51.4%**.
- Among month-to-month customers, senior citizen customers had a churn rate of **54.6%**, compared with **39.6%** among non-senior citizen customers.

## Business Implications

The analysis suggests that newer customers and customers on month-to-month contracts may warrant particular attention in customer retention efforts. Other high-churn segments, including electronic check users, fiber optic users and senior citizen customers, could also be investigated further.

These findings represent associations in the dataset and do not establish causal relationships.

## Limitations

- The dataset represents a fictional telecommunications company and should not be interpreted as real company data.
- The analysis is descriptive and does not predict which individual customers will churn.
- The observed relationships do not establish causation.
- Further analysis would be required to understand the reasons behind the observed churn patterns.

## Future Improvements

Potential extensions to the project include:

- Combining the SQL analysis with the Power BI dashboard
- Conducting deeper customer segmentation
- Investigating interactions between additional customer characteristics
- Developing a predictive churn model
- Exploring customer lifetime value and retention strategies

## Skills Demonstrated

- SQL querying
- Data aggregation
- Conditional logic using `CASE`
- Data filtering using `WHERE`
- Group-level filtering using `HAVING`
- SQL calculations
- Relational data analysis using `JOIN`
- Business-oriented data interpretation
