--################################################################################################################################
CREATE FUNCTION przedModyfikacja()
RETURNS @tablicaPrzed TABLE(PRZED NUMERIC, ID INT)
AS
BEGIN
	DECLARE @przed NUMERIC;
	DECLARE @id1 INT = 1;
	DECLARE @id2 INT = 1;
	
		WHILE (@id1 <= 31)
		BEGIN
			SELECT @przed = TaxRate, @id2 = SalesTaxRateID FROM AdventureWorks2019.Sales.SalesTaxRate WHERE SalesTaxRateID = @id1
			INSERT INTO @tablicaPrzed VALUES (@przed, @id2)
			SET @id1 += 1
		END;

	RETURN
END;
--################################################################################################################################
CREATE FUNCTION poModyfikacji()
RETURNS @tablicaPo TABLE(PO NUMERIC, ID INT)
AS
BEGIN
	DECLARE @po NUMERIC;
	DECLARE @id3 INT = 1;
	DECLARE @id4 INT = 1;

		WHILE (@id3 <= 31)
		BEGIN
			SELECT @po = TaxRate, @id4 = SalesTaxRateID FROM AdventureWorks2019.Sales.SalesTaxRate WHERE SalesTaxRateID = @id3
			INSERT INTO @tablicaPo VALUES (@po, @id4)
			SET @id3 += 1
		END;

	RETURN
END;
--################################################################################################################################
CREATE TRIGGER taxRateMonitoring
ON AdventureWorks2019.Sales.SalesTaxRate
AFTER
UPDATE
AS
BEGIN
	DECLARE @id INT = 1;
	DECLARE @sprawdz NUMERIC;

	WHILE (@id <= 31)
	BEGIN
		
		SET @sprawdz = 0.3*(SELECT PRZED FROM dbo.przedModyfikacja() WHERE ID = @id)
		IF (SELECT PO FROM dbo.poModyfikacji() WHERE ID = @id) > (@sprawdz)
		PRINT 'B£¥D'

		SET @id += 1
	END

END;
--################################################################################################################################

SELECT * FROM dbo.przedModyfikacja()
UPDATE AdventureWorks2019.Sales.SalesTaxRate SET TaxRate = 90 WHERE SalesTaxRateID = 1;
SELECT * FROM dbo.poModyfikacji()