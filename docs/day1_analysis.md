| Problemă                                      | Regula de Calitate                               | Dimensiune   |
| --------------------------------------------- | ------------------------------------------------ | ------------ |
| LastName lipsa (CustomerID 3)                 | LastName nu poate fi NULL                        | Completeness |
| Email invalid (CustomerID 5)                  | Email trebuie să conțină '@' și '.'              | Validity     |
| Telefon invalid (CustomerID 5)                | Telefon doar cifre și '+'                        | Validity     |
| Data naștere invalidă (CustomerID 5, 9)       | DateOfBirth între 1900-01-01 și azi              | Validity     |
| Duplicate (CustomerID 1 și 4)                 | Fiecare client unic după Email                   | Uniqueness   |
| Country inconsistent (Germany vs DEUTSCHLAND) | Country standardizat (ISO code sau nume complet) | Consistency  |
| FirstName lipsă (CustomerID 7)                | FirstName nu poate fi NULL                       | Completeness |
| LastName lipsă (CustomerID 3)                 | LastName nu poate fi NULL (opțional)             | Completeness |