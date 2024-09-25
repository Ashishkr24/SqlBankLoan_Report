
/*-- BANK LOAN REPORT | SUMMARY

--Total Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan;

-- MTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan
WHERE MONTH(issue_date) = 12
-- PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan
WHERE MONTH(issue_date) = 11
-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan
--MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan
WHERE MONTH(issue_date) = 12
-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan
WHERE MONTH(issue_date) = 11

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan
--MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan
WHERE MONTH(issue_date) = 12
--PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan
WHERE MONTH(issue_date) = 11
--Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan
--MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan
WHERE MONTH(issue_date) = 12
--PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan
WHERE MONTH(issue_date) = 11

--Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan
--MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan
WHERE MONTH(issue_date) = 12
--PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan
WHERE MONTH(issue_date) = 11
--GOOD LOAN ISSUED
--Good Loan Percentage
SELECT
(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id
END) * 100.0) / COUNT(id) AS Good_Loan_Percentage FROM bank_loan
--Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
--BAD LOAN ISSUED
--Bad Loan Percentage
SELECT
(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /
COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan
--Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan
WHERE loan_status = 'Charged Off'
--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Charged Off'
--Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Charged Off'

--LOAN STATUS
SELECT
loan_status,
COUNT(id) AS LoanCount,
SUM(total_payment) AS Total_Amount_Received,
SUM(loan_amount) AS Total_Funded_Amount,
AVG(int_rate * 100) AS Interest_Rate,
AVG(dti * 100) AS DTI
FROM bank_loan GROUP BY
loan_status

SELECT
loan_status,
SUM(total_payment) AS MTD_Total_Amount_Received,
SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

--B. BANK LOAN REPORT | OVERVIEW
--MONTH
SELECT
MONTH(issue_date) AS Month_Munber,
DATENAME(MONTH, issue_date) AS Month_name,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--STATE
SELECT
address_state AS State,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY address_state
ORDER BY address_state

--TERM
SELECT
term AS Term,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY term
ORDER BY term


--EMPLOYEE LENGTH
SELECT
emp_length AS Employee_Length,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY emp_length
ORDER BY emp_length

--PURPOSE
SELECT
purpose AS PURPOSE,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY purpose
ORDER BY purpose

--HOME OWNERSHIP
SELECT
home_ownership AS Home_Ownership,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY home_ownership
ORDER BY home_ownership
--Note: We have applied multiple Filters on all the dashboards. You can check the results for
--the filters as well by modifying the query and comparing the results.
--For e.g
--See the results when we hit the Grade A in the filters for dashboards.
SELECT
purpose AS PURPOSE,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose


# Bank Loan Report Project

## Project Overview
This SQL-based project aims to analyze and monitor the key performance metrics of a bank's loan portfolio. It provides detailed insights into loan applications, funded amounts, amounts received, interest rates, and loan status, enabling the bank to make data-driven decisions.

## Features and Metrics:
- **Total Loan Applications**: Tracks the total number of loan applications.
- **Total Funded Amount**: Calculates the total amount disbursed as loans.
- **Total Amount Received**: Monitors the total amount received from borrowers.
- **Average Interest Rate**: Calculates the average interest rate across loans.
- **Debt-to-Income (DTI) Ratio**: Evaluates the financial health of borrowers.
- **Good Loans**: Identifies loans that are fully paid or current.
- **Bad Loans**: Tracks loans categorized as charged off.

## Key Queries:
### Loan Applications
- **Total Loan Applications**: `SELECT COUNT(id) AS Total_Applications FROM bank_loan;`
- **MTD Loan Applications**: `SELECT COUNT(id) AS Total_Applications FROM bank_loan WHERE MONTH(issue_date) = 12;`
- **PMTD Loan Applications**: `SELECT COUNT(id) AS Total_Applications FROM bank_loan WHERE MONTH(issue_date) = 11;`

### Funded Amount
- **Total Funded Amount**: `SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan;`
- **MTD Funded Amount**: `SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan WHERE MONTH(issue_date) = 12;`
- **PMTD Funded Amount**: `SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan WHERE MONTH(issue_date) = 11;`

### Amount Received
- **Total Amount Received**: `SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan;`
- **MTD Amount Received**: `SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan WHERE MONTH(issue_date) = 12;`
- **PMTD Amount Received**: `SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan WHERE MONTH(issue_date) = 11;`

### Loan Categories
- **Good Loan Percentage**: `SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / COUNT(id) AS Good_Loan_Percentage FROM bank_loan;`
- **Bad Loan Percentage**: `SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage FROM bank_loan;`

## How to Use:
1. **Set Up**: Ensure the database is properly set up and the `bank_loan` table is populated with the necessary data.
2. **Run Queries**: Use the provided SQL queries to analyze different metrics such as loan applications, funded amounts, amounts received, and loan statuses.
3. **Modify Filters**: You can modify the queries to apply filters, for instance, by loan grade or purpose, to narrow down your results.

## Conclusion:
This project provides a comprehensive overview of a bank’s lending activities. By using SQL queries to calculate key metrics, it offers a detailed analysis of loan performance, borrower behavior, and risk assessment. The insights gained from this project can support data-driven decision-making, helping banks optimize their lending strategies and manage loan portfolios more effectively.

## License:
This project is licensed under the MIT License.

