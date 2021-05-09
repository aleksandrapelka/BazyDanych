CREATE TRIGGER nazwisko
ON AdventureWorks2019.Person.Person
AFTER
INSERT, UPDATE
AS
BEGIN
	SELECT BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, UPPER(LastName) AS LastName, Suffix, EmailPromotion, AdditionalContactInfo, Demographics, rowguid, ModifiedDate
	FROM AdventureWorks2019.Person.Person;
END;


UPDATE Person.Person SET FirstName = 'Ken' WHERE BusinessEntityID = 1;
--INSERT INTO Person.Person VALUES(20778, 'em', 0, NULL, 'K', 'J', 'sen', NULL, 0, NULL, NULL, 3, '2009-01-07 00:00:00.000') 
SELECT * FROM Person.Person




