CREATE DATABASE Geo

CREATE SCHEMA geotabela

CREATE TABLE geotabela.eon(Id_eon VARCHAR(2) PRIMARY KEY, Nazwa_eon VARCHAR(15))
CREATE TABLE geotabela.era(Id_era VARCHAR(3) PRIMARY KEY, Id_eon VARCHAR(2) FOREIGN KEY REFERENCES geotabela.eon, Nazwa_era VARCHAR(15))
CREATE TABLE geotabela.okres(Id_okres VARCHAR(3) PRIMARY KEY, Id_era VARCHAR(3) FOREIGN KEY REFERENCES geotabela.era, Nazwa_okres VARCHAR(15))
CREATE TABLE geotabela.epoka(Id_epoka VARCHAR(4) PRIMARY KEY, Id_okres VARCHAR(3) FOREIGN KEY REFERENCES geotabela.okres, Nazwa_epoka VARCHAR(20))
CREATE TABLE geotabela.pietro(Id_pietro integer PRIMARY KEY, Id_epoka VARCHAR(4) FOREIGN KEY REFERENCES geotabela.epoka, Nazwa_pietro VARCHAR(20))

INSERT INTO geotabela.eon VALUES('1e','Fanerozoik')

INSERT INTO geotabela.era VALUES('1er','1e','Kenozoik')
INSERT INTO geotabela.era VALUES('2er','1e','Mezozoik')
INSERT INTO geotabela.era VALUES('3er','1e','Paleozoik')

INSERT INTO geotabela.okres VALUES('1o','1er','Czwartorzêd')
INSERT INTO geotabela.okres VALUES('2o','1er','Neogen')
INSERT INTO geotabela.okres VALUES('3o','1er','Paleogen')
INSERT INTO geotabela.okres VALUES('4o','1er','Kreda')
INSERT INTO geotabela.okres VALUES('5o','1er','Jura')
INSERT INTO geotabela.okres VALUES('6o','1er','Trias')
INSERT INTO geotabela.okres VALUES('7o','2er','Perm')
INSERT INTO geotabela.okres VALUES('8o','2er','Karbon')
INSERT INTO geotabela.okres VALUES('9o','2er','Dewon')
INSERT INTO geotabela.okres VALUES('10o','3er','Sylur')
INSERT INTO geotabela.okres VALUES('11o','3er','Ordowik')
INSERT INTO geotabela.okres VALUES('12o','3er','Kambr')

INSERT INTO geotabela.epoka VALUES('1ep','1o','Holocen')
INSERT INTO geotabela.epoka VALUES('2ep','1o','Plejstocen')
INSERT INTO geotabela.epoka VALUES('3ep','2o','Pliocen')
INSERT INTO geotabela.epoka VALUES('4ep','2o','Miocen')
INSERT INTO geotabela.epoka VALUES('5ep','3o','Oligocen')
INSERT INTO geotabela.epoka VALUES('6ep','3o','Eocen ')
INSERT INTO geotabela.epoka VALUES('7ep','3o','Paleocen')
INSERT INTO geotabela.epoka VALUES('8ep','4o','PóŸna kreda')
INSERT INTO geotabela.epoka VALUES('9ep','4o','Wczesna kreda')
INSERT INTO geotabela.epoka VALUES('10ep','5o','Jura póŸna')
INSERT INTO geotabela.epoka VALUES('11ep','5o','Jura œrodkowa')
INSERT INTO geotabela.epoka VALUES('12ep','5o','Jura wczesna')
INSERT INTO geotabela.epoka VALUES('13ep','6o','PóŸny trias')
INSERT INTO geotabela.epoka VALUES('14ep','6o','Œrodkowy trias')
INSERT INTO geotabela.epoka VALUES('15ep','6o','Wczesny trias')
INSERT INTO geotabela.epoka VALUES('16ep','7o','Loping')
INSERT INTO geotabela.epoka VALUES('17ep','7o','Gwadalup')
INSERT INTO geotabela.epoka VALUES('18ep','7o','Cisural')
INSERT INTO geotabela.epoka VALUES('19ep','8o','Pensylwan')
INSERT INTO geotabela.epoka VALUES('20ep','8o','Missisip')
INSERT INTO geotabela.epoka VALUES('21ep','8o','PóŸny dewon')
INSERT INTO geotabela.epoka VALUES('22ep','8o','Œrodkowy dewon')
INSERT INTO geotabela.epoka VALUES('23ep','8o','Wczesny dewon')
INSERT INTO geotabela.epoka VALUES('24ep','10o','Przydol')
INSERT INTO geotabela.epoka VALUES('25ep','10o','Ludlow')
INSERT INTO geotabela.epoka VALUES('26ep','10o','Wenlok')
INSERT INTO geotabela.epoka VALUES('27ep','10o','Landower')
INSERT INTO geotabela.epoka VALUES('28ep','11o','Ordowik póŸny')
INSERT INTO geotabela.epoka VALUES('29ep','11o','Ordowik œrodkowy')
INSERT INTO geotabela.epoka VALUES('30ep','11o','Ordowik wczesny')
INSERT INTO geotabela.epoka VALUES('31ep','12o','Furong')
INSERT INTO geotabela.epoka VALUES('32ep','12o','Miaoling')
INSERT INTO geotabela.epoka VALUES('33ep','12o','Oddzia³ 2')
INSERT INTO geotabela.epoka VALUES('34ep','12o','Terenew')

INSERT INTO geotabela.pietro VALUES(1,'1ep','Megalaj')
INSERT INTO geotabela.pietro VALUES(2,'1ep','Northgrip')
INSERT INTO geotabela.pietro VALUES(3,'1ep','Grenland')
INSERT INTO geotabela.pietro VALUES(4,'2ep','PóŸny')
INSERT INTO geotabela.pietro VALUES(5,'2ep','Chiban')
INSERT INTO geotabela.pietro VALUES(6,'2ep','Kalabr')
INSERT INTO geotabela.pietro VALUES(7,'2ep','Gelas')
INSERT INTO geotabela.pietro VALUES(8,'3ep','Piacent')
INSERT INTO geotabela.pietro VALUES(9,'3ep','Zankl')
INSERT INTO geotabela.pietro VALUES(10,'4ep','Messyn')
INSERT INTO geotabela.pietro VALUES(11,'4ep','Torton')
INSERT INTO geotabela.pietro VALUES(12,'4ep','Serrawal')
INSERT INTO geotabela.pietro VALUES(13,'4ep','Lang')
INSERT INTO geotabela.pietro VALUES(14,'4ep','Burdyga³')
INSERT INTO geotabela.pietro VALUES(15,'4ep','Akwitan')
INSERT INTO geotabela.pietro VALUES(16,'5ep','Szat')
INSERT INTO geotabela.pietro VALUES(17,'5ep','Rupel')
INSERT INTO geotabela.pietro VALUES(18,'6ep','Priabon')
INSERT INTO geotabela.pietro VALUES(19,'6ep','Barton')
INSERT INTO geotabela.pietro VALUES(20,'6ep','Lutet')
INSERT INTO geotabela.pietro VALUES(21,'6ep','Iprez')
INSERT INTO geotabela.pietro VALUES(22,'7ep','Tanet')
INSERT INTO geotabela.pietro VALUES(23,'7ep','Zeland')
INSERT INTO geotabela.pietro VALUES(24,'7ep','Dan')
INSERT INTO geotabela.pietro VALUES(25,'8ep','Mastrycht')
INSERT INTO geotabela.pietro VALUES(26,'8ep','Kampan')
INSERT INTO geotabela.pietro VALUES(27,'8ep','Santon')
INSERT INTO geotabela.pietro VALUES(28,'8ep','Koniak')
INSERT INTO geotabela.pietro VALUES(29,'8ep','Turon')
INSERT INTO geotabela.pietro VALUES(30,'8ep','Cenoman')
INSERT INTO geotabela.pietro VALUES(31,'9ep','Alb')
INSERT INTO geotabela.pietro VALUES(32,'9ep','Apt')
INSERT INTO geotabela.pietro VALUES(33,'9ep','Barrem')
INSERT INTO geotabela.pietro VALUES(34,'9ep','Hoteryw')
INSERT INTO geotabela.pietro VALUES(35,'9ep','Walan¿yn')
INSERT INTO geotabela.pietro VALUES(36,'9ep','Berrias')
INSERT INTO geotabela.pietro VALUES(37,'10ep','Tyton')
INSERT INTO geotabela.pietro VALUES(38,'10ep','Kimeryd')
INSERT INTO geotabela.pietro VALUES(39,'10ep','Oksford')
INSERT INTO geotabela.pietro VALUES(40,'11ep','Kelowej')
INSERT INTO geotabela.pietro VALUES(41,'11ep','Baton')
INSERT INTO geotabela.pietro VALUES(42,'11ep','Bajos')
INSERT INTO geotabela.pietro VALUES(43,'11ep','Aalen')
INSERT INTO geotabela.pietro VALUES(44,'12ep','Toark')
INSERT INTO geotabela.pietro VALUES(45,'12ep','Pliensbach')
INSERT INTO geotabela.pietro VALUES(46,'12ep','Synemur')
INSERT INTO geotabela.pietro VALUES(47,'12ep','Hettang')
INSERT INTO geotabela.pietro VALUES(48,'13ep','Retyk')
INSERT INTO geotabela.pietro VALUES(49,'13ep','Noryk')
INSERT INTO geotabela.pietro VALUES(50,'13ep','Karnik')
INSERT INTO geotabela.pietro VALUES(51,'14ep','Ladyn')
INSERT INTO geotabela.pietro VALUES(52,'14ep','Anizyk')
INSERT INTO geotabela.pietro VALUES(53,'15ep','Olenek')
INSERT INTO geotabela.pietro VALUES(54,'15ep','Ind')
INSERT INTO geotabela.pietro VALUES(55,'16ep','Czangsing')
INSERT INTO geotabela.pietro VALUES(56,'16ep','Wucziaping')
INSERT INTO geotabela.pietro VALUES(57,'17ep','Kapitan')
INSERT INTO geotabela.pietro VALUES(58,'17ep','Word')
INSERT INTO geotabela.pietro VALUES(59,'17ep','Road')
INSERT INTO geotabela.pietro VALUES(60,'18ep','Kungur')
INSERT INTO geotabela.pietro VALUES(61,'18ep','Artinsk')
INSERT INTO geotabela.pietro VALUES(62,'18ep','Sakmar')
INSERT INTO geotabela.pietro VALUES(63,'18ep','Assel')
INSERT INTO geotabela.pietro VALUES(64,'19ep','G¿el')
INSERT INTO geotabela.pietro VALUES(65,'19ep','Kasimow')
INSERT INTO geotabela.pietro VALUES(66,'19ep','Moskow')
INSERT INTO geotabela.pietro VALUES(67,'19ep','Baszkir')
INSERT INTO geotabela.pietro VALUES(68,'20ep','Serpuchow')
INSERT INTO geotabela.pietro VALUES(69,'20ep','Wizen')
INSERT INTO geotabela.pietro VALUES(70,'20ep','Turnej')
INSERT INTO geotabela.pietro VALUES(71,'21ep','Famen')
INSERT INTO geotabela.pietro VALUES(72,'21ep','Fran')
INSERT INTO geotabela.pietro VALUES(73,'22ep','¯ywet')
INSERT INTO geotabela.pietro VALUES(74,'22ep','Eifel')
INSERT INTO geotabela.pietro VALUES(75,'23ep','Ems')
INSERT INTO geotabela.pietro VALUES(76,'23ep','Prag')
INSERT INTO geotabela.pietro VALUES(77,'23ep','Lochkow')
INSERT INTO geotabela.pietro VALUES(78,'24ep','NULL')
INSERT INTO geotabela.pietro VALUES(79,'25ep','Ludford')
INSERT INTO geotabela.pietro VALUES(80,'25ep','Gorst')
INSERT INTO geotabela.pietro VALUES(81,'26ep','Homer')
INSERT INTO geotabela.pietro VALUES(82,'26ep','Szejnwud')
INSERT INTO geotabela.pietro VALUES(83,'27ep','Telicz')
INSERT INTO geotabela.pietro VALUES(84,'27ep','Aeron')
INSERT INTO geotabela.pietro VALUES(85,'27ep','Ruddan')
INSERT INTO geotabela.pietro VALUES(86,'28ep','Hirnant')
INSERT INTO geotabela.pietro VALUES(87,'28ep','Kat')
INSERT INTO geotabela.pietro VALUES(88,'28ep','Sandb')
INSERT INTO geotabela.pietro VALUES(89,'29ep','Darriwil')
INSERT INTO geotabela.pietro VALUES(90,'29ep','Daping')
INSERT INTO geotabela.pietro VALUES(91,'30ep','Flo')
INSERT INTO geotabela.pietro VALUES(92,'30ep','Tremadok')
INSERT INTO geotabela.pietro VALUES(93,'31ep','Piêtro 10')
INSERT INTO geotabela.pietro VALUES(94,'31ep','Dziangszan')
INSERT INTO geotabela.pietro VALUES(95,'31ep','Paib')
INSERT INTO geotabela.pietro VALUES(96,'32ep','Gu¿ang')
INSERT INTO geotabela.pietro VALUES(97,'32ep','Drum')
INSERT INTO geotabela.pietro VALUES(98,'32ep','Wuliuan')
INSERT INTO geotabela.pietro VALUES(99,'33ep','Piêtro 4')
INSERT INTO geotabela.pietro VALUES(100,'33ep','Pietro 3')
INSERT INTO geotabela.pietro VALUES(101,'34ep','Piêtro 2')
INSERT INTO geotabela.pietro VALUES(102,'34ep','Fortun')


SELECT Id_pietro,Nazwa_pietro,geotabela.epoka.Id_epoka ,Nazwa_epoka,geotabela.okres.Id_okres,Nazwa_okres,geotabela.era.Id_era,Nazwa_era, geotabela.eon.Id_eon,Nazwa_eon  
INTO GeoTabela
FROM  geotabela.pietro 
INNER JOIN geotabela.epoka 
INNER JOIN geotabela.okres 
INNER JOIN geotabela.era 
INNER JOIN geotabela.eon
ON geotabela.era.Id_eon = geotabela.eon.Id_eon
ON geotabela.okres.Id_era = geotabela.era.Id_era
ON geotabela.epoka.Id_okres = geotabela.okres.Id_okres
ON geotabela.pietro.Id_epoka =geotabela.epoka.Id_epoka;

ALTER TABLE GeoTabela ADD PRIMARY KEY (ID_pietro) 

CREATE TABLE Dziesiec(cyfra INT, bit BIT)

INSERT INTO Dziesiec VALUES(0,8)
INSERT INTO Dziesiec VALUES(1,8)
INSERT INTO Dziesiec VALUES(2,8)
INSERT INTO Dziesiec VALUES(3,8)
INSERT INTO Dziesiec VALUES(4,8)
INSERT INTO Dziesiec VALUES(5,8)
INSERT INTO Dziesiec VALUES(6,8)
INSERT INTO Dziesiec VALUES(7,8)
INSERT INTO Dziesiec VALUES(8,8)
INSERT INTO Dziesiec VALUES(9,8)

CREATE TABLE Milion(liczba INT,cyfra INT, bit INT);
INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6 ;

CREATE TABLE Milion2(liczba int PRIMARY KEY,cyfra INT, bit INT);
INSERT INTO Milion2 SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6 ;


SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON
( (Milion.liczba%68)=(GeoTabela.Id_pietro));

SELECT COUNT(*) FROM Milion2 INNER JOIN GeoTabela ON
( (Milion2.liczba%68)=(GeoTabela.Id_pietro));

SELECT COUNT(*) FROM Milion 
INNER JOIN geotabela.pietro 
INNER JOIN geotabela.epoka 
INNER JOIN geotabela.okres 
INNER JOIN geotabela.era 
INNER JOIN geotabela.eon
ON geotabela.era.Id_eon = geotabela.eon.Id_eon
ON geotabela.okres.Id_era = geotabela.era.Id_era
ON geotabela.epoka.Id_okres = geotabela.okres.Id_okres
ON geotabela.pietro.Id_epoka =geotabela.epoka.Id_epoka
ON ((Milion.liczba%68)=geotabela.pietro.Id_pietro);

SELECT COUNT(*) FROM Milion2 
INNER JOIN geotabela.pietro 
INNER JOIN geotabela.epoka 
INNER JOIN geotabela.okres 
INNER JOIN geotabela.era 
INNER JOIN geotabela.eon
ON geotabela.era.Id_eon = geotabela.eon.Id_eon
ON geotabela.okres.Id_era = geotabela.era.Id_era
ON geotabela.epoka.Id_okres = geotabela.okres.Id_okres
ON geotabela.pietro.Id_epoka =geotabela.epoka.Id_epoka
ON ((Milion2.liczba%68)=geotabela.pietro.Id_pietro);

SELECT COUNT(*) FROM Milion WHERE Milion.liczba%68=
(SELECT Id_pietro FROM GeoTabela WHERE Milion.liczba%68 = (Id_pietro));

SELECT COUNT(*) FROM Milion2 WHERE Milion2.liczba%68=
(SELECT Id_pietro FROM GeoTabela WHERE Milion2.liczba%68 = (Id_pietro));

SELECT COUNT(*) FROM Milion WHERE (Milion.liczba%68) IN (SELECT geotabela.pietro.Id_pietro 
FROM geotabela.pietro 
INNER JOIN geotabela.epoka 
INNER JOIN geotabela.okres 
INNER JOIN geotabela.era 
INNER JOIN geotabela.eon
ON geotabela.era.Id_eon = geotabela.eon.Id_eon
ON geotabela.okres.Id_era = geotabela.era.Id_era
ON geotabela.epoka.Id_okres = geotabela.okres.Id_okres
ON geotabela.pietro.Id_epoka =geotabela.epoka.Id_epoka)

SELECT COUNT(*) FROM Milion2 WHERE (Milion2.liczba%68) IN (SELECT geotabela.pietro.Id_pietro 
FROM geotabela.pietro 
INNER JOIN geotabela.epoka 
INNER JOIN geotabela.okres 
INNER JOIN geotabela.era 
INNER JOIN geotabela.eon
ON geotabela.era.Id_eon = geotabela.eon.Id_eon
ON geotabela.okres.Id_era = geotabela.era.Id_era
ON geotabela.epoka.Id_okres = geotabela.okres.Id_okres
ON geotabela.pietro.Id_epoka =geotabela.epoka.Id_epoka)