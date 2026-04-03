CREATE TABLE transactions (
    step INT,
    type VARCHAR(20),
    amount DECIMAL(12,2),
    nameOrig VARCHAR(50),
    oldbalanceOrg DECIMAL(12,2),
    newbalanceOrig DECIMAL(12,2),
    nameDest VARCHAR(50),
    oldbalanceDest DECIMAL(12,2),
    newbalanceDest DECIMAL(12,2),
    isFraud INT,
    isFlaggedFraud INT
);


select * from transactions