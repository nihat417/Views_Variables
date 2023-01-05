--1. 1-100 diapazonunda olan cüt rəqəmləri ekrana çıxarın
DECLARE @a int = 1, @b int = 100

WHILE (@a <= @b)
BEGIN
	SET @a += 1

	IF (@a % 2 = 0)
		PRINT(@a)
END

----2. Authorların sayını Authors adlı dəyişəndə saxlayın, daha sonra bu dəyişəni 5ə vuraraq ekrana çıxarın

DECLARE @authors int = 122
PRINT(@authors * 5)

--3. 5 rəqəmli ədədin polindrom olub olmadığını tapın.
DECLARE @number int = 1, @num int = 123, @digit int = 1, @rev int = 0

WHILE (@num != 0)
BEGIN
	SET @digit = @num % 10
	SET @rev = (@rev * 10) + @digit
	SET @num = @num / 10
END

IF (@number = @rev)
	PRINT(' palindrome number')
ELSE
	PRINT('not  palindrome number')


--4. İstifadəçinin daxil etdiyi aralıqda (məs 10 və 30) cüt rəqəmlərin cəmini tək rəqəmlərin hasilini hesablayan proqram yazın.

DECLARE @a1 int = 10, 
		@b1  int = 30,
		@sum   int = 0,
		@product int = 1

WHILE (@a1 <= @b1)
BEGIN
	SET @a1 += 1

	IF (@a1 % 2 = 0)
		SET @sum += @a1
	ELSE
		SET @product *= @a1
END

PRINT 'Sum : ' + STR(@sum)
PRINT 'Product : ' + STR(@product)


--5. Ədədin faktorialını tapan proqram yazın. (Məsələn (! - faktorial işarəsidir), 5! = 1*2*3*4*5)

DECLARE @number1 int = 3
DECLARE @factorial int = 1, @i int = 1;

IF (@number1 < 0)
    PRINT('False negative num')
ELSE
	WHILE @i < @number1
	BEGIN
		SET @i += 1
		SET @factorial *= @i
	END
	
PRINT(@factorial)    

--7. Ədədin üstünü hesablayan proqram yazın (istifadəçi iki ədəd daxil edəcək əsas və üst məs. 2 və 3 cavab 8 alınmalıdır)

DECLARE @number_1 int = 5 --ustu
DECLARE @basenumber float = 2
DECLARE @resultnumber int = 1

WHILE (@number_1 != 0) 
BEGIN
    SET @resultnumber *= @basenumber
    SET @number_1 -= 1
END

PRINT(@resultnumber)

