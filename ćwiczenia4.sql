-- 1. Tworzenie nowej bazy danych o nazwie firma:

CREATE DATABASE firma;

-- 2. Dodanie nowego schematu o nazwie rozliczenia:

USE firma;

CREATE SCHEMA rozliczenia;

-- 3. Dodanie tabel do schematu rozliczenia:

CREATE TABLE rozliczenia.pracownicy (ID_pracownika INT PRIMARY KEY, imie VARCHAR(40) NOT NULL, nazwisko VARCHAR(40) NOT NULL, adres VARCHAR(50) NOT NULL, telefon VARCHAR(11));
CREATE TABLE rozliczenia.godziny (ID_godziny INT PRIMARY KEY, _data DATE NOT NULL, liczba_godzin INT NOT NULL, ID_pracownika INT NOT NULL);
CREATE TABLE rozliczenia.pensje (ID_pensji VARCHAR(2) PRIMARY KEY, stanowisko VARCHAR(20), kwota MONEY NOT NULL, ID_premii VARCHAR(3) NOT NULL);
CREATE TABLE rozliczenia.premie (ID_premii VARCHAR(3) PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY);

ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (ID_pracownika) REFERENCES rozliczenia.pracownicy(ID_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (ID_premii) REFERENCES rozliczenia.premie(ID_premii);

-- 4. Wype³nienie tabel rekordami:

INSERT INTO rozliczenia.pracownicy VALUES (1, 'Mateusz', 'Nowak', 'ul. Œl¹ska 10, 42-200 Czêstochowa', '683-237-114');
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Janina', 'Kowalska', 'ul. Katedralna 56, 42-200 Czêstochowa', '571-882-725');
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Daniel', 'Gawron', 'ul. Focha 13, 42-200 Czêstochowa', '583-782-444');
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Jêdrzej', 'Matyja', 'ul. Sportowa 203, 42-200 Czêstochowa', '639-662-909');
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Karolina', 'Zêbik', 'ul. Zielona 84, 42-200 Czêstochowa', '662-971-835');
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Lucyna', 'Morawiec', 'ul. Czêstochowska 26, 42-200 Czêstochowa', '592-595-862');
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Genowefa', 'ŒledŸ', 'ul. Sosnowa 48, 42-200 Czêstochowa', '672-792-440');
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Mi³osz', 'Polak', 'ul. Mi³a 15, 42-200 Czêstochowa', '791-222-972');
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Bart³omiej', 'Leszcz', 'ul. Szczupaka 59, 42-200 Czêstochowa', '690-808-257');
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Irena', 'Skiba', 'ul. Wolnoœci 201, 42-200 Czêstochowa', '655-917-636');

INSERT INTO rozliczenia.godziny VALUES (11, '2021-03-15', 40, 1);
INSERT INTO rozliczenia.godziny VALUES (22, '2021-03-15', 38, 2);
INSERT INTO rozliczenia.godziny VALUES (33, '2021-03-15', 48, 3);
INSERT INTO rozliczenia.godziny VALUES (44, '2021-03-15', 40, 4);
INSERT INTO rozliczenia.godziny VALUES (55, '2021-03-15', 40, 5);
INSERT INTO rozliczenia.godziny VALUES (66, '2021-03-15', 48, 6);
INSERT INTO rozliczenia.godziny VALUES (77, '2021-03-15', 39, 7);
INSERT INTO rozliczenia.godziny VALUES (88, '2021-03-10', 40, 8);
INSERT INTO rozliczenia.godziny VALUES (99, '2021-03-10', 36, 9);
INSERT INTO rozliczenia.godziny VALUES (101, '2021-03-10', 48, 10);

INSERT INTO rozliczenia.premie VALUES ('P1a', 'regulaminowa', 100.00);
INSERT INTO rozliczenia.premie VALUES ('P1b', NULL, NULL);
INSERT INTO rozliczenia.premie VALUES ('P1c', 'uznaniowa', 500.00);
INSERT INTO rozliczenia.premie VALUES ('P2a', 'regulaminowa', 100.00);
INSERT INTO rozliczenia.premie VALUES ('P2b', 'regulaminowa', 100.00);
INSERT INTO rozliczenia.premie VALUES ('P2c', 'uznaniowa', 500.00);
INSERT INTO rozliczenia.premie VALUES ('P3a', NULL, NULL);
INSERT INTO rozliczenia.premie VALUES ('P3b', 'regulaminowa', 100.00);
INSERT INTO rozliczenia.premie VALUES ('P3c', NULL, NULL);
INSERT INTO rozliczenia.premie VALUES ('P3d', 'uznaniowa', 1000.00);

INSERT INTO rozliczenia.pensje VALUES ('1a', 'marketing manager', 4000.00, 'P1a');
INSERT INTO rozliczenia.pensje VALUES ('1b', 'administrator IT', 5200.00, 'P1b');
INSERT INTO rozliczenia.pensje VALUES ('1c', 'asystent', 3300.00, 'P1c');
INSERT INTO rozliczenia.pensje VALUES ('2a', 'kierownik projektu', 4000.00, 'P2a');
INSERT INTO rozliczenia.pensje VALUES ('2b', 'architekt systemu', 5200.00, 'P2b');
INSERT INTO rozliczenia.pensje VALUES ('2c', 'asystent', 3300.00, 'P2c');
INSERT INTO rozliczenia.pensje VALUES ('3a', 'analityk', 4000.00, 'P3a');
INSERT INTO rozliczenia.pensje VALUES ('3b', 'administrator IT', 5200.00, 'P3b');
INSERT INTO rozliczenia.pensje VALUES ('3c', 'asystent', 3300.00, 'P3c');
INSERT INTO rozliczenia.pensje VALUES ('3d', 'prezes zarz¹du', 7000.00, 'P3d');

-- 5. Wyœwietlenie nazwisk i adresów pracowników:

SELECT  nazwisko, adres FROM rozliczenia.pracownicy;

-- 6. Konwersja daty z tabeli godziny:

SELECT  DATEPART(MONTH, '2021-03-10') [month], DATEPART(WEEKDAY, '2021-03-10') [weekday];
SELECT  DATEPART(MONTH, '2021-03-15') [month], DATEPART(WEEKDAY, '2021-03-15') [weekday];

-- 7. Dodanie i obliczenie kwoty_netto, zmiana kwoty na kwota_brutto:

sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto MONEY;
UPDATE rozliczenia.pensje SET kwota_netto = ROUND(kwota_brutto/1.23, 2);
SELECT * FROM rozliczenia.pensje;
