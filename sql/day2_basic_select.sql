-- 1. Selectează toți clienții
SELECT * FROM Customer;

-- 2. Selectează doar FirstName, LastName, Email
SELECT FirstName, LastName, Email FROM Customer;

-- 3. Selectează clienții din Brazilia
SELECT FirstName, LastName, Email, Country 
FROM Customer 
WHERE Country = 'Brazil';

-- 4. Selectează clienții care NU sunt din USA
SELECT FirstName, LastName, Country 
FROM Customer 
WHERE Country <> 'USA';

-- 5. Selectează clienții cu Email care conține 'gmail'
SELECT FirstName, LastName, Email 
FROM Customer 
WHERE Email LIKE '%gmail%';

-- 6. Selectează clienții sortați alfabetic după LastName
SELECT FirstName, LastName, Email 
FROM Customer 
ORDER BY LastName ASC;

-- 7. Selectează clienții din Germany sau France, sortați după Country
SELECT FirstName, LastName, Country, Email 
FROM Customer 
WHERE Country IN ('Germany', 'France')
ORDER BY Country ASC, LastName ASC;

-- 8. Numără câți clienți sunt în fiecare țară
SELECT Country, COUNT(*) AS CustomerCount 
FROM Customer 
GROUP BY Country 
ORDER BY CustomerCount DESC;

-- 9. Găsește clienții fără fax (Fax IS NULL)
SELECT FirstName, LastName, Fax 
FROM Customer 
WHERE Fax IS NULL;

-- 10. Găsește clienții care au fax (Fax IS NOT NULL)
SELECT FirstName, LastName, Fax 
FROM Customer 
WHERE Fax IS NOT NULL;