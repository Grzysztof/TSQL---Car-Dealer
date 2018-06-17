--projekt bazy danych - Krzysztof Myjak
--nr indeksu 11071

CREATE DATABASE Projekt_11071;
GO
USE Projekt_11071;
GO

CREATE TABLE marki(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		nazwa VARCHAR(25),
		kraj VARCHAR(35),
		rokZalozenia SMALLINT
		);
GO

CREATE TABLE modele(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		nazwa VARCHAR(25),
		generacja TINYINT,
		segment CHAR(1),
		marka INT NOT NULL,
		FOREIGN KEY(marka) REFERENCES marki(id) 
		);
GO

CREATE TABLE cennik(
		idmodel INT NOT NULL,
		cena MONEY CHECK(cena>0) NOT NULL,
		obowiazujeOd DATE NOT NULL,
		obowiazujeDo DATE NOT NULL,
		FOREIGN KEY(idModel) REFERENCES modele(id)
		);
GO

CREATE TABLE pracownik(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		imie VARCHAR(25) NOT NULL,
		nazwisko VARCHAR(25) NOT NULL,
		numerTelefonu CHAR(9),
		pesel CHAR(11) UNIQUE NOT NULL,
		);
GO

CREATE TABLE klient(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		imie VARCHAR(25) NOT NULL,
		nazwisko VARCHAR(25) NOT NULL,
		numerDowodu VARCHAR(9) UNIQUE NOT NULL,
		);
GO

CREATE TABLE zamowienia(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		idKlient INT NOT NULL,
		idPracownik INT NOT NULL,
		idModel INT NOT NULL,
		cenaSprzedazy MONEY NOT NULL CHECK(cenaSprzedazy>0),
		dataZamowienia DATE NOT NULL,
		dataOdbioru DATE,
		oplacone BIT NOT NULL DEFAULT 0,
		zrealizowane BIT NOT NULL DEFAULT 0,
		FOREIGN KEY(idKlient) REFERENCES klient(id),
		FOREIGN KEY(idPracownik) REFERENCES pracownik(id),
		FOREIGN KEY(idModel) REFERENCES modele(id)
		);
GO

INSERT INTO marki VALUES 
	('Mecedes-Benz', 'Niemcy', 1926),
	('Volkswagen', 'Niemcy', 1937),
	('Audi', 'Niemcy', 1910),
	('Toyota', 'Japonia', 1937),
	('Ford', 'USA', 1903);
GO

INSERT INTO modele VALUES 
	('A4', 3, 'D', 3),
	('A8', 4, 'f', 3),
	('A160', 3, 'B', 1),
	('A250', 3, 'B', 1),
	('Golf', 6, 'c', 2),
	('Passat', 8, 'D', 2),
	('Hilux', 8, 'I', 4),
	('Prius', 4, 'C', 4),
	('Focus', 3, 'C', 5),
	('Fiesta', 6, 'B', 5);
GO

INSERT INTO pracownik VALUES
	('Andrzej', 'Nowak', 123456123, 90111276984),
	('Tomasz', 'Nowak', 345432678, 89101523127),
	('Tomasz', 'Kowalski', 934548768, 78032170543)
GO

INSERT INTO cennik VALUES
		(1, 161000, '2017-01-02', '2017-02-01'),
		(2, 340000, '2017-01-02', '2017-02-01'),
		(3, 140000, '2017-01-18', '2017-03-02'),
		(4, 210300, '2017-03-02', '2017-04-30'),
		(5, 80200, '2017-02-01', '2017-05-2'),
		(6, 190000, '2017-04-10', '2017-06-30'),
		(7, 290000, '2017-01-15', '2017-03-31'),
		(8, 125000, '2017-02-12', '2017-04-30'),
		(9, 110000, '2017-03-10', '2017-05-31'),
		(10, 85300, '2017-03-10', '2017-06-30'),
		(1, 151000, '2017-02-02', '2018-01-02'),
		(2, 304000, '2017-02-02', '2018-02-01'),
		(3, 127000, '2017-03-03', '2018-03-02'),
		(4, 190300, '2017-05-01', '2018-04-30'),
		(5, 70900, '2017-05-03', '2018-05-02' ),
		(6, 174000, '2017-07-01', '2018-06-30'),
		(7, 262000, '2017-04-02', '2018-04-01'),
		(8, 103000, '2017-05-01', '2018-04-30'),
		(9, 105000, '2017-06-01', '2018-05-31'),
		(10, 82400, '2017-07-01', '2018-06-30'),
		(1, 178000, '2018-01-02','2018-08-10'),
		(2, 338000, '2018-02-01', '2018-07-03'),
		(3, 110000, '2018-03-02', '2018-06-30'),
		(4, 206600, '2018-04-30', '2018-07-12'),
		(5, 70200, '2018-05-02', '2018-08-22'),
		(6, 150000, '2018-06-30', '2018-09-10'),
		(7, 257000, '2018-04-01', '2018-07-05'),
		(8, 98000, '2018-04-30', '2018-08-31'),
		(9, 91000, '2018-05-31', '2018-10-21'),
		(10, 73600, '2018-06-30', '2018-08-27')
GO
INSERT INTO klient VALUES
	('Miros³aw', 'Wajda', 'ABC438016'),
	('Wojciech', 'Nowak', 'BCA094763'),
	('Adam', 'Kowalski', 'CAB471321'),
	('Karol', 'Kwiatkowski', 'BCD543267')
GO

INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (4,2,3,117900,'2017-04-15', '2017-06-01', 1, 1);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (3,3,10,80000,'2017-08-02', '2017-09-05', 1, 1);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (2,1,4,18700,'2017-09-10', '2018-10-13', 1,1);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (4,2,8,99900, '2017-10-15', '2017-12-1', 1,1);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (1,1,6,150000,'2017-12-02', '2018-01-08', 1, 1);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (2,3,7,235000,'2018-04-01', '2018-08-27', 0, 0);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (1,1,5,68000,'2018-05-05', '2018-07-4', 1, 0);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (4,3,4,199900,'2018-05-07', '2018-06-30', 1,1);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (3,2,8, 98000, '2018-06-20', '2018-08-10',1,0);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (1,3,8,	97000,'2018-06-27', '2018-08-17', 1,0);
INSERT INTO zamowienia(idKlient, idPracownik, idModel, cenaSprzedazy, dataZamowienia, dataOdbioru, oplacone, zrealizowane) VALUES (4,3,10, 70200, '2018-07-01', '2018-09-20',0,0);
GO

CREATE SCHEMA czescB;
GO

-- Lista wszystkich marek wraz z informacj¹ o iloœci zamówieñ samochodów danej marki oraz sumaryczn¹ kwot¹ sprzeda¿
CREATE VIEW czescB.zad1
AS
	SELECT 
		mod.nazwa,
		COUNT(*) AS 'liczbaZamowien',
		SUM(cenaSprzedazy) AS 'Suma'
		FROM zamowienia AS zam
	INNER JOIN modele AS mod ON mod.id = zam.id
	GROUP BY mod.nazwa;

GO
-- Lista wszystkich zamówieñ wraz z informacj¹ o udzielonym rabacie (cena katalogowa obowi¹zuj¹ca w danym okresie minus cena sprzeda¿y dzielone przez cenê katalogow¹)

CREATE VIEW czescB.zad2
AS
	SELECT 
		zam.idModel, 
		((cen.cena-zam.cenaSprzedazy)/cen.cena)*100 AS 'znizka'
	FROM Cennik AS cen
	INNER JOIN zamowienia AS zam ON zam.idModel = cen.idmodel
	WHERE (zam.dataZamowienia BETWEEN cen.obowiazujeOd AND cen.obowiazujeDo);

GO
--Lista modeli samochodów, które nie pojawiaj¹ siê na ¿adnym z zamówieñ (nie zosta³y ani razu zamówione)
CREATE VIEW czescB.zad3
AS
	SELECT *
	FROM modele WHERE NOT EXISTS (SELECT * FROM zamowienia WHERE modele.id = zamowienia.idModel);
GO
--Lista pracowników, wraz z informacj¹ o tym ile zamówieñ zrealizowali oraz ³¹czn¹ kwot¹ tych zamówieñ

CREATE VIEW czescB.zad4
AS
	SELECT 
		prac.id,
		COUNT(*) AS 'liczba zamowien',
		SUM(cenaSprzedazy) AS 'suma zamowien'
	FROM pracownik AS prac
	INNER JOIN zamowienia AS zam ON zam.idPracownik = prac.id
	GROUP BY prac.id;
GO

--Select(y)
-- Lista wszystkich marek wraz z informacj¹ o iloœci zamówieñ samochodów danej marki oraz sumaryczn¹ kwot¹ sprzeda¿
SELECT * FROM czescB.zad1;
GO
-- Lista wszystkich zamówieñ wraz z informacj¹ o udzielonym rabacie (cena katalogowa obowi¹zuj¹ca w danym okresie minus cena sprzeda¿y dzielone przez cenê katalogow¹)
SELECT * FROM czescB.zad2;
GO

--Lista modeli samochodów, które nie pojawiaj¹ siê na ¿adnym z zamówieñ (nie zosta³y ani razu zamówione)
SELECT * FROM czescB.zad3;
GO
--Lista pracowników, wraz z informacj¹ o tym ile zamówieñ zrealizowali oraz ³¹czn¹ kwot¹ tych zamówieñ
SELECT * FROM czescB.zad4;
GO
