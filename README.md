# Bank Loan Report Project

## Project Overview
The **Bank Loan Report** project is an SQL-based data analysis solution designed to evaluate key performance indicators (KPIs) related to loan applications, funded amounts, repayments, interest rates, and loan status. This project allows banks to monitor loan portfolio performance and gain actionable insights for decision-making.

## Key Features:
1. **Total Loan Applications**: Tracks the total number of loan applications.
2. **Total Funded Amount**: Calculates the total amount disbursed as loans.
3. **Total Amount Received**: Monitors the total amount received from borrowers.
4. **Average Interest Rate**: Computes the average interest rate across loans.
5. **Debt-to-Income (DTI) Ratio**: Analyzes borrower debt capacity.
6. **Good Loans and Bad Loans**: Classifies loans based on their payment status (good or bad loans).

## Technologies Used:
- **SQL**: For querying the data from the loan dataset.
- **Database**: Data stored in the `bank_loan` table containing detailed records of loan applications.
- **Data Analysis**: SQL queries to generate meaningful KPIs and insights.

---

## Steps Followed to Solve the KPI Requirements:

### 1. Data Exploration
- First, I explored the `bank_loan` table to understand the available fields, such as loan application ID (`id`), loan amount (`loan_amount`), payment status (`loan_status`), interest rate (`int_rate`), and debt-to-income ratio (`dti`).

### 2. Designing Queries for Loan Applications
- To calculate **Total Loan Applications**, I used a simple `COUNT(id)` query.
- To get **Month-to-Date (MTD)** and **Prior Month-to-Date (PMTD)** applications, I applied the `MONTH(issue_date)` function to filter results by month.

    ```sql
    -- Total Loan Applications
    SELECT COUNT(id) AS Total_Applications FROM bank_loan;
    
    -- MTD Loan Applications
    SELECT COUNT(id) AS Total_Applications FROM bank_loan WHERE MONTH(issue_date) = 12;

    -- PMTD Loan Applications
    SELECT COUNT(id) AS Total_Applications FROM bank_loan WHERE MONTH(issue_date) = 11;
    ```

### 3. Calculating Funded Amounts
- **Total Funded Amount** is the total sum of all loans disbursed (`SUM(loan_amount)`).
- Similar logic was used to calculate **MTD** and **PMTD** funded amounts.

    ```sql
    -- Total Funded Amount
    SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan;

    -- MTD Funded Amount
    SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan WHERE MONTH(issue_date) = 12;

    -- PMTD Funded Amount
    SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan WHERE MONTH(issue_date) = 11;
    ```

### 4. Tracking Amounts Received
- I calculated the **Total Amount Received** from loan repayments using `SUM(total_payment)`. Again, MTD and PMTD calculations followed the same monthly filter logic.

    ```sql
    -- Total Amount Received
    SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan;

    -- MTD Amount Received
    SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan WHERE MONTH(issue_date) = 12;

    -- PMTD Amount Received
    SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan WHERE MONTH(issue_date) = 11;
    ```

### 5. Calculating Average Interest Rate
- The **Average Interest Rate** was derived using the `AVG(int_rate)` function, multiplied by 100 to convert it into a percentage.

    ```sql
    -- Average Interest Rate
    SELECT AVG(int_rate) * 100 AS Avg_Int_Rate FROM bank_loan;

    -- MTD Average Interest Rate
    SELECT AVG(int_rate) * 100 AS MTD_Avg_Int_Rate FROM bank_loan WHERE MONTH(issue_date) = 12;

    -- PMTD Average Interest Rate
    SELECT AVG(int_rate) * 100 AS PMTD_Avg_Int_Rate FROM bank_loan WHERE MONTH(issue_date) = 11;
    ```

### 6. Evaluating Debt-to-Income (DTI) Ratio
- The **Debt-to-Income (DTI)** ratio was calculated similarly, with the `AVG(dti)` function, providing both the overall DTI and the monthly breakdowns.

    ```sql
    -- Average DTI
    SELECT AVG(dti) * 100 AS Avg_DTI FROM bank_loan;

    -- MTD Average DTI
    SELECT AVG(dti) * 100 AS MTD_Avg_DTI FROM bank_loan WHERE MONTH(issue_date) = 12;

    -- PMTD Average DTI
    SELECT AVG(dti) * 100 AS PMTD_Avg_DTI FROM bank_loan WHERE MONTH(issue_date) = 11;
    ```

### 7. Categorizing Loans: Good vs. Bad
- **Good Loans** were identified by their status as "Fully Paid" or "Current." I calculated both the percentage of good loans and their funded amounts.
- **Bad Loans** were categorized based on the status "Charged Off," and similarly, I calculated percentages and amounts for these.

    ```sql
    -- Good Loan Percentage
    SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / COUNT(id) AS Good_Loan_Percentage FROM bank_loan;

    -- Bad Loan Percentage
    SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage FROM bank_loan;
    ```

### 8. Visualizing Loan Performance
- I further analyzed the data by loan term, employee length, loan purpose, state, and home ownership. These categorizations provided deeper insights into the loan portfolio.

    ```sql
    -- Loan Term Analysis
    SELECT term AS Term, COUNT(id) AS Total_Loan_Applications, SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan GROUP BY term ORDER BY term;
    ```

---

## Key Queries Summary:
Here are the main SQL queries used in this project:

### Loan Applications
```sql
SELECT COUNT(id) AS Total_Applications FROM bank_loan;


## SQL Queries:
- SQL queries are used to calculate all the key performance indicators (KPIs) mentioned above.
- Includes data extraction, transformation, and cleaning.
- Custom SQL queries to categorize loans as "Good" or "Bad."





## Conclusion:
The Bank Loan Report project provides an in-depth analysis of the bank's lending operations through key metrics and detailed visualizations. By tracking trends and categorizing loans as "Good" or "Bad," this project enables data-driven decision-making. It also highlights critical aspects such as loan terms, borrower employment length, and regional differences. The analysis and visualizations offer a clear understanding of the portfolio's performance, supporting strategic adjustments to improve lending practices.




