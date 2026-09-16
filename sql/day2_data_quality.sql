-- ============================================
-- Ziua 2: Data Quality - Identificare Probleme
-- ============================================

-- Creează tabela cu date murdare
DROP TABLE IF EXISTS Customers_Dirty;

CREATE TABLE Customers_Dirty (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT,
    Phone TEXT,
    Country TEXT,
    RegistrationDate TEXT
);

-- Inserează date cu probleme
INSERT INTO Customers_Dirty VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '+49-123-456-789', 'Germany', '2024-01-10'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '+49-987-654-321', 'France', '2024-02-15'),
(3, 'Maria', NULL, 'maria.popescu@email.com', '+40-700-123-456', 'Romania', '2024-03-01'),
(4, 'John', 'Doe', 'john.doe@email.com', '+49-123-456-789', 'Germany', '2024-01-10'),
(5, 'Alex', 'Ionescu', 'alex.ionescu', 'abc123', 'Romania', '2024-04-20'),
(6, 'Emma', 'Wilson', 'emma.wilson@email.com', '+44-20-1234-5678', 'UK', '2023-12-01'),
(7, NULL, 'Brown', 'bob.brown@email.com', '+1-555-0199', 'USA', '2024-05-10'),
(8, 'Sarah', 'Miller', 'sarah.miller@email.com', '+49-111-222-333', 'DEUTSCHLAND', '2024-06-15'),
(9, 'Michael', 'Johnson', 'michael.johnson@email.com', '+49-444-555-666', 'Germany', '2024-07-01'),
(10, 'Lisa', 'Anderson', 'lisa.anderson@email.com', NULL, 'Spain', '2024-08-05');

-- ============================================
-- Query-uri de Identificare Probleme
-- ============================================

-- 1. Găsește toți clienții cu FirstName NULL
SELECT * FROM Customers_Dirty 
WHERE FirstName IS NULL;

-- 2. Găsește toți clienții cu LastName NULL
SELECT * FROM Customers_Dirty 
WHERE LastName IS NULL;

-- 3. Găsește toți clienții cu Email NULL
SELECT * FROM Customers_Dirty 
WHERE Email IS NULL;

-- 4. Găsește toți clienții cu Phone NULL
SELECT * FROM Customers_Dirty 
WHERE Phone IS NULL;

-- 5. Găsește email-uri care NU conțin '@' (invalid)
SELECT * FROM Customers_Dirty 
WHERE Email NOT LIKE '%@%';

-- 6. Găsește telefoane care conțin litere (invalid)
SELECT * FROM Customers_Dirty 
WHERE Phone LIKE '%a%' 
   OR Phone LIKE '%b%' 
   OR Phone LIKE '%c%';

-- 7. Găsește country care conține 'deutsch' (inconsistent)
SELECT * FROM Customers_Dirty 
WHERE UPPER(Country) LIKE '%DEUTSCH%';

-- 8. Identifică duplicate (același email apare de mai multe ori)
SELECT Email, COUNT(*) AS Occurrences 
FROM Customers_Dirty 
WHERE Email IS NOT NULL
GROUP BY Email 
HAVING COUNT(*) > 1;

-- 9. Listează toți clienții sortați după Country, apoi LastName
SELECT CustomerID, FirstName, LastName, Country 
FROM Customers_Dirty 
ORDER BY Country ASC, LastName ASC;

-- 10. Numără câți clienți sunt în fiecare țară
SELECT Country, COUNT(*) AS CustomerCount 
FROM Customers_Dirty 
GROUP BY Country 
ORDER BY CustomerCount DESC;