-- 1. Tworzenie nowej bazy danych o nazwie firma3:

CREATE DATABASE firma3;

-- 2. Dodanie nowego schematu o nazwie ksiegowosc:

USE firma3;          
CREATE SCHEMA ksiegowosc;

-- 3. Dodanie tabel do schematu ksiegowosc:
CREATE TABLE ksiegowosc.pracownicy (ID_pracownika INT PRIMARY KEY, imie VARCHAR(40) NOT NULL, nazwisko VARCHAR(40) NOT NULL, adres VARCHAR(50) NOT NULL, telefon VARCHAR(11));
CREATE TABLE ksiegowosc.godziny (ID_godziny INT PRIMARY KEY, _data DATE NOT NULL, liczba_godzin INT NOT NULL, ID_pracownika INT NOT NULL);
CREATE TABLE ksiegowosc.pensja (ID_pensji VARCHAR(2) PRIMARY KEY, stanowisko VARCHAR(20), kwota MONEY NOT NULL);
CREATE TABLE ksiegowosc.premia (ID_premii VARCHAR(3) PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY);
CREATE TABLE ksiegowosc.wynagrodzenie(ID_wynagrodzenia VARCHAR(4) PRIMARY KEY, _data DATE NOT NULL, ID_pracownika INT NOT NULL, ID_godziny INT NOT NULL, ID_pensji VARCHAR(2) NOT NULL, ID_premii VARCHAR(3) NOT NULL);

-- Dodanie komentarzy do tabel:
EXEC sp_addextendedproperty 'Pracownicy', 'Tabela przedstawiajaca informacje o pracownikach', 'SCHEMA', 'ksiegowosc', 'TABLE', 'pracownicy' ;
EXEC sp_addextendedproperty 'Godziny', 'Tabela przedstawiajaca informacje o godzinach pracy pracowników', 'SCHEMA', 'ksiegowosc', 'TABLE', 'godziny' ;
EXEC sp_addextendedproperty 'Pensja', 'Tabela przedstawiajaca informacje o pensji i stanowisku pracowników', 'SCHEMA', 'ksiegowosc', 'TABLE', 'pensja' ;
EXEC sp_addextendedproperty 'Premia', 'Tabela przedstawiajaca informacje o rodzaju ewentualnej premii pracowników i jej wysokoœci', 'SCHEMA', 'ksiegowosc', 'TABLE', 'premia' ;
EXEC sp_addextendedproperty 'Wynagrodzenie', 'Tabela ³¹cz¹ca pozosta³e tabele', 'SCHEMA', 'ksiegowosc', 'TABLE', 'wynagrodzenie' ;
SELECT * FROM sys.extended_properties;

ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (ID_pracownika) REFERENCES ksiegowosc.pracownicy(ID_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_pracownika) REFERENCES ksiegowosc.pracownicy(ID_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_godziny) REFERENCES ksiegowosc.godziny(ID_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_pensji) REFERENCES ksiegowosc.pensja(ID_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_premii) REFERENCES ksiegowosc.premia(ID_premii);

-- 4. Wype³nienie tabel rekordami:

INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Mateusz', 'Nowak', 'ul. Œl¹ska 10, 42-200 Czêstochowa', '683237114');
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Janina', 'Kowalska', 'ul. Katedralna 56, 42-200 Czêstochowa', '571882725');
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Daniel', 'Gawron', 'ul. Focha 13, 42-200 Czêstochowa', '583782444');
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Jêdrzej', 'Matyja', 'ul. Sportowa 203, 42-200 Czêstochowa', '639662909');
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Karolina', 'Zêbik', 'ul. Zielona 84, 42-200 Czêstochowa', '662971835');
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Lucyna', 'Morawiec', 'ul. Czêstochowska 26, 42-200 Czêstochowa', '592595862');
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Genowefa', 'ŒledŸ', 'ul. Sosnowa 48, 42-200 Czêstochowa', '672792440');
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Mi³osz', 'Polak', 'ul. Mi³a 15, 42-200 Czêstochowa', '791222972');
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Bart³omiej', 'Leszcz', 'ul. Szczupaka 59, 42-200 Czêstochowa', '690808257');
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Irena', 'Skiba', 'ul. Wolnoœci 201, 42-200 Czêstochowa', '655917636');

INSERT INTO ksiegowosc.godziny VALUES (11, '2021-03-15', 160, 1);
INSERT INTO ksiegowosc.godziny VALUES (22, '2021-03-15', 140, 2);
INSERT INTO ksiegowosc.godziny VALUES (33, '2021-03-15', 175, 3);
INSERT INTO ksiegowosc.godziny VALUES (44, '2021-03-15', 160, 4);
INSERT INTO ksiegowosc.godziny VALUES (55, '2021-03-15', 160, 5);
INSERT INTO ksiegowosc.godziny VALUES (66, '2021-03-15', 185, 6);
INSERT INTO ksiegowosc.godziny VALUES (77, '2021-03-15', 150, 7);
INSERT INTO ksiegowosc.godziny VALUES (88, '2021-03-10', 160, 8);
INSERT INTO ksiegowosc.godziny VALUES (99, '2021-03-10', 140, 9);
INSERT INTO ksiegowosc.godziny VALUES (101, '2021-03-10', 180, 10);

INSERT INTO ksiegowosc.premia VALUES ('P1a', 'regulaminowa', 100.00);
INSERT INTO ksiegowosc.premia VALUES ('P1b', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES ('P1c', 'uznaniowa', 500.00);
INSERT INTO ksiegowosc.premia VALUES ('P2a', 'regulaminowa', 100.00);
INSERT INTO ksiegowosc.premia VALUES ('P2b', 'regulaminowa', 100.00);
INSERT INTO ksiegowosc.premia VALUES ('P2c', 'uznaniowa', 500.00);
INSERT INTO ksiegowosc.premia VALUES ('P3a', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES ('P3b', 'regulaminowa', 100.00);
INSERT INTO ksiegowosc.premia VALUES ('P3c', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES ('P3d', 'uznaniowa', 1000.00);

INSERT INTO ksiegowosc.pensja VALUES ('1a', 'marketing manager', 4000.00);
INSERT INTO ksiegowosc.pensja VALUES ('1b', 'administrator IT', 5200.00);
INSERT INTO ksiegowosc.pensja VALUES ('1c', 'asystent', 3300.00);
INSERT INTO ksiegowosc.pensja VALUES ('2a', 'kierownik projektu', 4000.00);
INSERT INTO ksiegowosc.pensja VALUES ('2b', 'architekt systemu', 5200.00);
INSERT INTO ksiegowosc.pensja VALUES ('2c', 'asystent', 3300.00);
INSERT INTO ksiegowosc.pensja VALUES ('3a', 'analityk', 4000.00);
INSERT INTO ksiegowosc.pensja VALUES ('3b', 'administrator IT', 5200.00);
INSERT INTO ksiegowosc.pensja VALUES ('3c', 'asystent', 3300.00);
INSERT INTO ksiegowosc.pensja VALUES ('3d', 'prezes zarz¹du', 7000.00);

INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP1a', '2021-04-01', 1, 11, '1a', 'P1a');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP1b', '2021-04-01', 2, 22, '1b', 'P1b');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP1c', '2021-04-01', 3, 33, '1c', 'P1c');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP2a', '2021-04-01', 4, 44, '2a', 'P2a');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP2b', '2021-04-01', 5, 55, '2b', 'P2b');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP2c', '2021-04-01', 6, 66, '2c', 'P2c');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP3a', '2021-04-01', 7, 77, '3a', 'P3a');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP3b', '2021-04-01', 8, 88, '3b', 'P3b');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP3c', '2021-04-01', 9, 99, '3c', 'P3c');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('WP3d', '2021-04-01', 10, 101, '3d', 'P3d');

--ÆWICZENIE 6B

--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48):
ALTER TABLE ksiegowosc.pracownicy 
ALTER COLUMN telefon VARCHAR(17);

UPDATE ksiegowosc.pracownicy 
SET telefon = '(+48) ' + telefon;

SELECT * FROM ksiegowosc.pracownicy;

--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’:
UPDATE ksiegowosc.pracownicy 
SET telefon = SUBSTRING(telefon, 1, 9) + '-' + SUBSTRING(telefon, 9, 3) + '-' + SUBSTRING(telefon, 12, 3);

--c) Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter:

--SELECT ID_pracownika, UPPER(imie) AS IMIÊ, UPPER(nazwisko) AS NAZWISKO FROM ksiegowosc.pracownicy GROUP BY pracownicy.ID_pracownika, pracownicy.imie, pracownicy.nazwisko HAVING MAX(LEN(nazwisko)) = 8;
--SELECT UPPER(imie) AS IMIÊ, UPPER(nazwisko) AS NAZWISKO FROM ksiegowosc.pracownicy GROUP BY pracownicy.imie, pracownicy.nazwisko HAVING LEN(nazwisko) = MAX(LEN(nazwisko));

SELECT ID_pracownika, UPPER(imie) AS IMIÊ, UPPER(nazwisko) AS NAZWISKO
FROM ksiegowosc.pracownicy
WHERE LEN(nazwisko) = (
SELECT MAX(LEN(nazwisko))
FROM ksiegowosc.pracownicy);

--d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5:
ALTER TABLE ksiegowosc.pensja 
ALTER COLUMN kwota VARCHAR(20);

SELECT 
HASHBYTES('MD5', pracownicy.imie) AS imiê, 
HASHBYTES('MD5', pracownicy.nazwisko) AS nazwisko, 
HASHBYTES('MD5', pensja.kwota) AS pensja
FROM ksiegowosc.pracownicy 
INNER JOIN (ksiegowosc.pensja 
INNER JOIN ksiegowosc.wynagrodzenie 
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika;

--e) Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne:
SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota AS pensja, premia.kwota AS premia 
FROM ksiegowosc.pracownicy 
LEFT JOIN (ksiegowosc.pensja 
LEFT JOIN (ksiegowosc.premia 
LEFT JOIN ksiegowosc.wynagrodzenie 
ON premia.ID_premii = wynagrodzenie.ID_premii) 
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika;

--f) Wygeneruj raport (zapytanie), które zwróci w wyniki treœæ wg poni¿szego szablonu:

--Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma³ pensjê ca³kowit¹ na kwotê 7540 z³, gdzie 
--wynagrodzenie zasadnicze wynosi³o: 5000 z³, premia: 2000 z³, nadgodziny: 540 z³

ALTER TABLE ksiegowosc.godziny 
ADD nadgodziny MONEY;

UPDATE ksiegowosc.godziny 
SET nadgodziny = (liczba_godzin - 160)*25 
WHERE liczba_godzin > 160;

SELECT * FROM ksiegowosc.godziny;

SELECT CONCAT('Pracownik ', pracownicy.imie , ' ', pracownicy.nazwisko, ' w dniu ' , wynagrodzenie._data , ' otrzyma³ pensjê ca³kowit¹ na kwotê ', 
CAST(pensja.kwota + (CASE WHEN premia.kwota IS NOT NULL THEN premia.kwota ELSE 0 END) + (CASE WHEN nadgodziny IS NOT NULL THEN nadgodziny ELSE 0 END) AS VARCHAR) , 'z³, gdzie wynagrodzenie zasadnicze wynosi³o: ', 
pensja.kwota , 'z³, premia: ', CASE WHEN premia.kwota IS NOT NULL THEN premia.kwota ELSE 0 END , 'z³, nadgodziny ' , CAST(CASE WHEN nadgodziny IS NOT NULL THEN nadgodziny ELSE 0 END AS VARCHAR), 'z³')
FROM ksiegowosc.pracownicy  
INNER JOIN (ksiegowosc.pensja 
INNER JOIN (ksiegowosc.godziny
INNER JOIN (ksiegowosc.premia 
INNER JOIN ksiegowosc.wynagrodzenie 
ON premia.ID_premii = wynagrodzenie.ID_premii)  
ON godziny.id_godziny = wynagrodzenie.ID_godziny)
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika;