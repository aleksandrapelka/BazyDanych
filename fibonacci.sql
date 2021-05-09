CREATE FUNCTION Fib(@a INT)
RETURNS @tablica TABLE(CI¥G_FIBONACCIEGO INT)
AS
BEGIN
	DECLARE @pierwszy INT = 0
	DECLARE @drugi INT = 1
	DECLARE @i INT = 0

	INSERT INTO @tablica VALUES (@pierwszy),(@drugi)

	WHILE (@i <= @a-2)
	BEGIN
		INSERT INTO @tablica VALUES (@drugi + @pierwszy)
		SET @drugi = @drugi + @pierwszy
		SET @pierwszy = @drugi - @pierwszy
		SET @i += 1
	END

RETURN

END;

-------------------------------------------------------------------
 CREATE OR ALTER PROCEDURE Fibonacci(@a INT)
 AS
 BEGIN
	SELECT * FROM dbo.Fib(@a)
 END;
-------------------------------------------------------------------

DECLARE @liczba INT;
SET @liczba = 15;

EXECUTE Fibonacci @liczba;