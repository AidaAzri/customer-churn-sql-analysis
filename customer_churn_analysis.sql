-- =========================================================
-- Customer Churn Analysis
-- Dataset: IBM Telco Customer Churn
-- Objective: Identify customer characteristics associated
-- with higher churn using SQL.
-- =========================================================

-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Customer Count by Churn Status
SELECT
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Churn;

-- 3. Churn Rate by Contract Type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    
    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 4. Churn Rate by Tenure Group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0–12 months'
        WHEN tenure <= 24 THEN '13–24 months'
        WHEN tenure <= 48 THEN '25–48 months'
        ELSE '49+ months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate

FROM customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- 5. Churn Rate by Payment Method
SELECT
    paymentmethod AS payment_method,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate

FROM customers
GROUP BY payment_method
ORDER BY churn_rate DESC;

-- 6. Churn Rate by Internet Service
SELECT
    internetservice AS internet_service,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate

FROM customers
GROUP BY internet_service
ORDER BY churn_rate DESC;

-- 7. Churn Rate by Senior Citizen Status
SELECT
    CASE
    WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
    ELSE 'Non-Senior Citizen'
END AS customer_segment,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate

FROM customers
GROUP BY customer_segment
ORDER BY churn_rate DESC;

-- 8. Internet Service Churn Among Month-to-Month Customers
SELECT
    internetservice AS internet_service,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate

FROM customers
WHERE contract = 'Month-to-month'
GROUP BY internet_service
ORDER BY churn_rate DESC;

-- 9. Contract Churn Among Customers With 0-12 Months of Tenure
SELECT
    Contract,
	
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    
    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate
FROM customers
WHERE tenure <= 12
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 10. Contract Types With More Than 100 Churned Customers
SELECT
    Contract,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers
    
FROM customers
GROUP BY Contract
HAVING SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) > 100;

-- 11. Supporting Table for JOIN Demonstration
CREATE TABLE contract_info (
    Contract VARCHAR(30),
    contract_description VARCHAR(100)
);

INSERT INTO contract_info (Contract, contract_description)
VALUES
    ('Month-to-month', 'Customers without a long-term contract'),
    ('One year', 'Customers with a one-year contract'),
    ('Two year', 'Customers with a two-year contract');

-- 12. JOIN: Contract Information With Churn Counts
SELECT
    customers.Contract,
    contract_info.contract_description,

    SUM(
        CASE
            WHEN customers.Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers

FROM customers
JOIN contract_info
    ON customers.Contract = contract_info.Contract

GROUP BY
    customers.Contract,
    contract_info.contract_description;

-- 13. Senior Citizen Churn Among Month-to-Month Customers
SELECT
    CASE
    WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
    ELSE 'Non-Senior Citizen'
END AS customer_segment,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS churn_rate

FROM customers
WHERE contract = 'Month-to-month'
GROUP BY customer_segment
ORDER BY churn_rate DESC;