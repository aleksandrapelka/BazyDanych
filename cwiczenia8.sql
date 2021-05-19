--#########################################################################################################################
--ZADANIE 1:

BEGIN
	SELECT AVG(Rate)*2016 AS AverageAnnualRate FROM HumanResources.EmployeePayHistory;

	SELECT HumanResources.EmployeePayHistory.BusinessEntityID, FirstName, LastName, Rate*2016 AS AverageAnnualRate, RateChangeDate
	FROM HumanResources.EmployeePayHistory INNER JOIN Person.Person
	ON HumanResources.EmployeePayHistory.BusinessEntityID = Person.Person.BusinessEntityID
	WHERE Rate*2016 < (SELECT AVG(Rate)*2016 FROM HumanResources.EmployeePayHistory) ORDER BY Rate;
END;

--SELECT * FROM  HumanResources.EmployeePayHistory;
--#########################################################################################################################
--ZADANIE 2:

CREATE OR ALTER FUNCTION dataWysylki(@id VARCHAR(5))
RETURNS DATETIME
AS
BEGIN
	DECLARE @data DATETIME;
	SELECT @data = ShipDate FROM Sales.SalesOrderHeader WHERE SalesOrderID = @id;

	RETURN @data
END;

DECLARE @SalesID VARCHAR(5) = 43659;
SELECT @SalesID AS ID_Wysy³ki, dbo.dataWysylki(@SalesID) AS Data_Wysy³ki;
--#########################################################################################################################
--ZADANIE 3:

CREATE OR ALTER PROCEDURE wyswietlInfoOProdukcie(@nazwaProduktu VARCHAR(100))
AS
BEGIN
	SELECT ProductID, Name, ProductNumber, SafetyStockLevel FROM Production.Product WHERE Name = @nazwaProduktu;
END;

DECLARE @nazwa VARCHAR(100) = 'Blade';
EXEC wyswietlInfoOProdukcie @nazwa;
--#########################################################################################################################
--ZADANIE 4:

CREATE OR ALTER FUNCTION kartaKredytowa(@zamowienie VARCHAR(5))
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @numerKarty VARCHAR(20);

	SELECT @numerKarty = Sales.CreditCard.CardNumber 
	FROM Sales.CreditCard INNER JOIN Sales.SalesOrderHeader 
	ON Sales.CreditCard.CreditCardID = Sales.SalesOrderHeader.CreditCardID 
	WHERE Sales.SalesOrderHeader.SalesOrderID = @zamowienie;

	RETURN @numerKarty
END;

DECLARE @numerZamowienia VARCHAR(5) = 43659;
SELECT @numerZamowienia AS ID_Zamówienia, dbo.kartaKredytowa(@numerZamowienia) AS Numer_Karty_Kredytowej;
--#########################################################################################################################
--ZADANIE 5:

CREATE OR ALTER PROCEDURE liczby(@num1 FLOAT, @num2 FLOAT)
AS 
BEGIN
	DECLARE @wynik FLOAT;

	IF @num1 < @num2
	SELECT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe' AS Komunikat;
	ELSE
	BEGIN
		SET @wynik = @num1/@num2 
		SELECT @wynik AS Wynik_dzielenia
	END;

	--RETURN @wynik
END;

DECLARE @liczba1 FLOAT = 1;
DECLARE @liczba2 FLOAT = 2;
EXEC liczby @liczba1, @liczba2;

---------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION liczby_fun(@num1 FLOAT, @num2 FLOAT)
RETURNS FLOAT
AS 
BEGIN
	DECLARE @wynik FLOAT;
	SET @wynik = @num1/@num2 

	RETURN @wynik
END;

DECLARE @liczba1 FLOAT = 8.8;
DECLARE @liczba2 FLOAT = 2;

	IF @liczba1 < @liczba2
	SELECT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe' AS Komunikat;
	ELSE
	SELECT dbo.liczby_fun(@liczba1, @liczba2) AS Wynik_dzielenia;

--#########################################################################################################################
--ZADANIE 6:

CREATE OR ALTER PROCEDURE pracownik(@id VARCHAR(20))
AS
BEGIN
	SELECT JobTitle AS Stanowisko, ROUND(CAST(VacationHours AS FLOAT)/24, 2) AS Dni_urlopowe, ROUND(CAST(SickLeaveHours AS FLOAT)/24, 2) AS Dni_chorobowe
	FROM AdventureWorks2019.HumanResources.Employee
	WHERE NationalIDNumber = @id; 
END;

DECLARE @idPracownika VARCHAR(20);
SET @idPracownika = 295847284
EXEC pracownik @idPracownika;
--#########################################################################################################################
--ZADANIE 7:

CREATE OR ALTER PROCEDURE kalkulatorWalut(@kwota FLOAT, @walutaZ VARCHAR(10), @walutaNa VARCHAR(10), @data DATETIME)
AS
BEGIN
	DECLARE @przelicz FLOAT = 3.73;
	DECLARE @wynik FLOAT = 0;
	
	IF @walutaZ = 'USD'
	BEGIN
		IF @walutaNa = 'PLN'
			SET @wynik = ROUND(@przelicz * @kwota , 4); 
		ELSE
		BEGIN
			SELECT @przelicz = AverageRate FROM AdventureWorks2019.Sales.CurrencyRate WHERE ToCurrencyCode = @walutaNa AND CurrencyRateDate = @data;
			SET @wynik = ROUND(@przelicz * @kwota , 4); 
		END;
	END;
	ELSE IF @walutaZ = 'PLN'
		IF @walutaNa = 'PLN'
			SET @wynik = @kwota;
		ELSE
			SET @wynik = ROUND(@kwota/@przelicz, 4);
	ELSE
	BEGIN
		SELECT @przelicz = AverageRate FROM AdventureWorks2019.Sales.CurrencyRate WHERE ToCurrencyCode = @walutaZ AND CurrencyRateDate = @data;
		SET @wynik = ROUND(@kwota/@przelicz, 4);
	END;

	DECLARE @tabela TABLE (Kwota FLOAT, WalutaZ VARCHAR(10), WalutaNa VARCHAR(10) ,Przelicznik FLOAT, KwotaKoncowa FLOAT)
	INSERT INTO @tabela VALUES(@kwota, @walutaZ, @walutaNa, @przelicz, @wynik);
	SELECT * FROM @tabela;
END;

DECLARE @waluta1 VARCHAR(10) = 'USD';
DECLARE @waluta2 VARCHAR(10) = 'EUR';
DECLARE @kwotaDoZamiany FLOAT = 100;
DECLARE @dataa DATETIME = '2011-05-31 00:00:00.000'

EXEC kalkulatorWalut @kwotaDoZamiany, @waluta1, @waluta2, @dataa;

--SELECT * FROM AdventureWorks2019.Sales.Currency WHERE CurrencyCode = 'PLN';
--SELECT * FROM AdventureWorks2019.Sales.CurrencyRate WHERE ToCurrencyCode = 'PLN';