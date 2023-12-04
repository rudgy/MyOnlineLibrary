#DROP DATABASE IF EXISTS MyLibrary;
CREATE DATABASE IF NOT EXISTS MyLibrary;
USE MyLibrary;

CREATE TABLE IF NOT EXISTS Library
(
	UserID INT REFERENCES LUser(UserID),
    BookID INT REFERENCES Book(BookID)
);

CREATE TABLE IF NOT EXISTS LUser
(
	UserID INT NOT NULL AUTO_INCREMENT,
    UName VARCHAR(50),
    ULastName VARCHAR(50),
    UNickName VARCHAR(50),
    UPasswor VARCHAR(50),
    UGroupID INT REFERENCES LGroup(GroupID),
    CONSTRAINT UserPK PRIMARY KEY (UserID)
);

CREATE TABLE IF NOT EXISTS LGroup
(
	GroupID INT NOT NULL AUTO_INCREMENT,
    GName VARCHAR(50),
    CONSTRAINT GroupPK PRIMARY KEY (GroupID)
);

#DROP TABLE IF NOT EXISTS Book;
CREATE TABLE IF NOT EXISTS Book
(
	BookID INT NOT NULL AUTO_INCREMENT,
    AutorID INT,
	BookName varchar(50),
    ReleaseData YEAR,
    CountPage INT,
    TypographyID INT,
    LanguageID INT,
    GenreID INT,
    StatusID INT,
    UploadDate DATE,
    CONSTRAINT BookPK PRIMARY KEY (BookID)
);

#DROP TABLE IF NOT EXISTS Autor;
CREATE TABLE IF NOT EXISTS Autor
(
	AutorID INT NOT NULL AUTO_INCREMENT REFERENCES Book(BookID),
    AutorName VARCHAR(30),
    LastName VARCHAR(30),
    CONSTRAINT AutorPK PRIMARY KEY (AutorID)
);

#DROP TABLE IF NOT EXISTS Typography;
CREATE TABLE IF NOT EXISTS Typography
(
	TypographyID INT NOT NULL AUTO_INCREMENT REFERENCES Book(TypographyID),
    TypographyName VARCHAR(50),
    City VARCHAR(50),
    CONSTRAINT TypografyPK PRIMARY KEY (TypographyID)
);

#DROP TABLE IF NOT EXISTS BookLanguage;
CREATE TABLE IF NOT EXISTS BookLanguage
(
	LanguageID INT NOT NULL AUTO_INCREMENT REFERENCES Book(LanguageID),
    LanguageName VARCHAR(50),
    CONSTRAINT BookLanguagePK PRIMARY KEY (LanguageID)
);

#DROP TABLE IF NOT EXISTS Genre;
CREATE TABLE IF NOT EXISTS Genre
(
	GenreID INT NOT NULL AUTO_INCREMENT REFERENCES Book(GenreID),
    GenreName VARCHAR(50),
    CONSTRAINT GenrePK PRIMARY KEY (GenreID)
);
#DROP TABLE IF NOT EXISTS BookStatus;
CREATE TABLE IF NOT EXISTS BookStatus
(
	StatusID INT NOT NULL AUTO_INCREMENT REFERENCES Book(StatusID),
    StatusName VARCHAR(50),
    CONSTRAINT StatusPK PRIMARY KEY (StatusID)
);


USE MyLibrary;

#INSERT INTO BookStatus VALUES (id, StatusName);
INSERT INTO BookStatus (StatusName) VALUES ('Start');
INSERT INTO BookStatus (StatusName) VALUES ('In Process');
INSERT INTO BookStatus (StatusName) VALUES ('Done');

#INSERT INTO LGroup VALUES (id, GName);
INSERT INTO LGroup (GName) VALUES ('Admin');
INSERT INTO LGroup (GName) VALUES ('User');

#INSERT INTO Autor VALUES (id, AutorName, LastName);
INSERT INTO Autor (AutorName, LastName) VALUES ('Эл', 'Свейгарт');
INSERT INTO Autor (AutorName, LastName) VALUES ('Кеннет', 'Рейтц');
INSERT INTO Autor (AutorName, LastName) VALUES ('Таня', 'Шлюссер');
INSERT INTO Autor (AutorName, LastName) VALUES ('Марк', 'Лутц');
INSERT INTO Autor (AutorName, LastName) VALUES ('Крістофер', 'Ларсен');

#INSERT INTO Genre VALUES (id, GenreName);
INSERT INTO Genre (GenreName) VALUES ('Non—fiction');
INSERT INTO Genre (GenreName) VALUES ('Light fiction');
INSERT INTO Genre (GenreName) VALUES ('Science-fiction');
INSERT INTO Genre (GenreName) VALUES ('Cook—books');
INSERT INTO Genre (GenreName) VALUES ('Dictionary');
INSERT INTO Genre (GenreName) VALUES ('Series');
INSERT INTO Genre (GenreName) VALUES ('Fantasy');

#INSERT INTO Typography VALUES (id, TypographyName, City);
INSERT INTO Typography (TypographyName, City) VALUES ('Диалектика', 'Санкт-Петербург');
INSERT INTO Typography (TypographyName, City) VALUES ('Питер', 'Санкт-Петербург');
INSERT INTO Typography (TypographyName, City) VALUES ('Українське видання', 'Україна');
INSERT INTO Typography (TypographyName, City) VALUES ('Академія Cisco', 'Europe');

#INSERT INTO Book VALUES (id, AutorID, BookName, ReleaseData, CountPage, TypographyID, LanguageID, GenreID, StatusID, UploadDate);
INSERT INTO Book (AutorID, BookName, ReleaseData, CountPage, TypographyID, LanguageID, GenreID, StatusID, UploadDate) VALUES (1, 'Book1', '2021', 350, 1, 3, 3, 1, DATE '2023-12-04');
INSERT INTO Book (AutorID, BookName, ReleaseData, CountPage, TypographyID, LanguageID, GenreID, StatusID, UploadDate) VALUES (2, 'Book2', '2020', 350, 1, 3, 3, 1, DATE '2023-12-04');
INSERT INTO Book (AutorID, BookName, ReleaseData, CountPage, TypographyID, LanguageID, GenreID, StatusID, UploadDate) VALUES (3, 'Book3', '2022', 350, 1, 3, 3, 1, DATE '2023-12-04');
INSERT INTO Book (AutorID, BookName, ReleaseData, CountPage, TypographyID, LanguageID, GenreID, StatusID, UploadDate) VALUES (4, 'Book3', '2022', 350, 1, 3, 3, 1, DATE '2023-12-04');

#INSERT INTO BookLanguage VALUES (id,LanguageName);
INSERT INTO BookLanguage (LanguageName) VALUES ('Ukraine');
INSERT INTO BookLanguage (LanguageName) VALUES ('English');
INSERT INTO BookLanguage (LanguageName) VALUES ('Russian');


#INSERT INTO LUser VALUES (id, UName, ULastName, UNickName, UPasswor, UGroupID);
INSERT INTO LUser (UName, ULastName,UNickName, UPasswor, UGroupID) VALUES ('admin','admin','admin','admin',1);
INSERT INTO LUser (UName, ULastName,UNickName, UPasswor, UGroupID) VALUES ('user1','user1','user1','asdwsx',2);
INSERT INTO LUser (UName, ULastName,UNickName, UPasswor, UGroupID) VALUES ('user2','user2','user2','asdwsx',2);
INSERT INTO LUser (UName, ULastName,UNickName, UPasswor, UGroupID) VALUES ('user3','user3','user3','asdwsx',2);

#INSERT INTO Library VALUES (UserID, BookID);
INSERT INTO Library (UserID, BookID) VALUES (1, 1);
INSERT INTO Library (UserID, BookID) VALUES (2, 2);
INSERT INTO Library (UserID, BookID) VALUES (2, 3);




#UPDATE DATA IN TABLES
#UPDATE Book SET ReleaseData = '1995';


#SELECT * FROM BookStatus;
#SELECT * FROM LGroup;
#SELECT * FROM Autor;
#SELECT * FROM Genre;
#SELECT City, COUNT(City) as 'Count of sity' FROM Typography GROUP BY City;

#SELECT * FROM Book;
