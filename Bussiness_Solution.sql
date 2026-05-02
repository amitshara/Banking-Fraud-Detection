      
---- Bussiness problems solution


--cheking for null value
SELECT *
FROM transactions
WHERE amount IS NULL;




--checking for duplicates
SELECT nameOrig, amount, COUNT(*)
FROM transactions
GROUP BY nameOrig, amount
HAVING COUNT(*) > 1;

---Performing Exploratory Data Analysis (EDA)


--1.Retrive first few record
SELECT *
FROM transactions
LIMIT 10;




--2.find of Count of Total Transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;



--3.Find all unique transactions type
SELECT DISTINCT type
FROM transactions;




--4.Find top 5 sigle transaction
SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 5;




--5.Find all count by transaction type
SELECT type, COUNT(*) AS total
FROM transactions
GROUP BY type;



--6.Find Average Transaction Amount
SELECT AVG(amount) AS avg_amount
FROM transactions;





--7.Find Maximum and Minimum Transaction
SELECT 
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM transactions;




--8.Find all fraud transaction
SELECT *
FROM transactions
WHERE isFraud = 1;





--9.Total Transaction and Fraud Transaction 
SELECT 
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_transactions,
    ROUND(SUM(isFraud)*100.0 / COUNT(*), 2) AS fraud_percentage
FROM transactions;





--10.Which Transaction type is most likely to fraud
SELECT 
    type,
    COUNT(*) AS total,
    SUM(isFraud) AS fraud_count,
    ROUND(SUM(isFraud)*100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY type
ORDER BY fraud_rate DESC;





--11.Find High Value transaction
SELECT 
    CASE 
        WHEN amount < 1000 THEN 'Low'
        WHEN amount BETWEEN 1000 AND 10000 THEN 'Medium'
        ELSE 'High'
    END AS transaction_size,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_cases
FROM transactions
GROUP BY transaction_size;





--12.try to find Fraud SIgnal in transaction
SELECT *
FROM transactions
WHERE oldbalanceOrg - amount != newbalanceOrig
AND isFraud = 1;
--(fraud occurs when balance does not mathc)





--13.Find top 10 Fraudulent Accounts
SELECT 
    nameOrig,
    COUNT(*) AS fraud_count
FROM transactions
WHERE isFraud = 1
GROUP BY nameOrig
ORDER BY fraud_count DESC
LIMIT 10;






--14.Give Rank to Customers by their Transaction Amount
SELECT 
    nameOrig,
    SUM(amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS rank
FROM transactions
GROUP BY nameOrig;




--15.create a fraud signal which give probablity for fraud happening
SELECT *,
    CASE 
        WHEN amount > 200000 AND type = 'TRANSFER' THEN 'High Risk'
        WHEN amount > 50000 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM transactions;


