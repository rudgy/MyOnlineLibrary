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
	UserID INT NOT NULL,
    UName VARCHAR(50),
    ULastName VARCHAR(50),
    UNickName VARCHAR(50),
    UPasswor VARCHAR(50),
    UGroupID INT REFERENCES LGroup(GroupID),
    CONSTRAINT UserPK PRIMARY KEY (UserID)
);

CREATE TABLE IF NOT EXISTS LGroup
(
	GroupID INT NOT NULL,
    GName VARCHAR(50),
    CONSTRAINT GroupPK PRIMARY KEY (GroupID)
);

#DROP TABLE IF NOT EXISTS Book;
CREATE TABLE IF NOT EXISTS Book
(
	BookID INT NOT NULL,
    AutorID INT,
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
	AutorID INT NOT NULL REFERENCES Book(BookID),
    AutorName VARCHAR(30),
    LastName VARCHAR(30),
    CONSTRAINT AutorPK PRIMARY KEY (AutorID)
);

#DROP TABLE IF NOT EXISTS Typography;
CREATE TABLE IF NOT EXISTS Typography
(
	TypographyID INT NOT NULL REFERENCES Book(TypographyID),
    TypographyName VARCHAR(50),
    City VARCHAR(50),
    CONSTRAINT TypografyPK PRIMARY KEY (TypographyID)
);

#DROP TABLE IF NOT EXISTS BookLanguage;
CREATE TABLE IF NOT EXISTS BookLanguage
(
	LanguageID INT NOT NULL REFERENCES Book(LanguageID),
    LanguageName VARCHAR(50),
    CONSTRAINT BookLanguagePK PRIMARY KEY (LanguageID)
);

#DROP TABLE IF NOT EXISTS Genre;
CREATE TABLE IF NOT EXISTS Genre
(
	GenreID INT NOT NULL REFERENCES Book(GenreID),
    GenreName VARCHAR(50),
    CONSTRAINT GenrePK PRIMARY KEY (GenreID)
);
#DROP TABLE IF NOT EXISTS BookStatus;
CREATE TABLE IF NOT EXISTS BookStatus
(
	StatusID INT NOT NULL REFERENCES Book(StatusID),
    StatusName VARCHAR(50),
    CONSTRAINT StatusPK PRIMARY KEY (StatusID)
);


USE MyLibrary;

#INSERT INTO BookStatus VALUES (, '');
INSERT INTO BookStatus VALUES (1, 'Start');
INSERT INTO BookStatus VALUES (2, 'In Process');
INSERT INTO BookStatus VALUES (3, 'Done');

#INSERT INTO LGroup VALUES (, '');
INSERT INTO LGroup VALUES (1, 'Admin');
INSERT INTO LGroup VALUES (2, 'User');

#INSERT INTO Autor VALUES (, '', '');
INSERT INTO Autor VALUES (1, 'Эл', 'Свейгарт');
INSERT INTO Autor VALUES (2, 'Кеннет', 'Рейтц');
INSERT INTO Autor VALUES (3, 'Таня', 'Шлюссер');


#SELECT * FROM BookStatus;
#SELECT * FROM LGroup;
#SELECT * FROM Autor;