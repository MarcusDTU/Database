CREATE DATABASE DKAvisen;
USE DKAvisen;

CREATE TABLE Newspaper (
    Newspaper_Title VARCHAR(100) PRIMARY KEY,
    Founding_Date DATE NOT NULL,
    Periodicity INT NOT NULL
);

CREATE TABLE Topic (
    Name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE Article (
    Article_Title VARCHAR(100),
	Newspaper_Title VARCHAR(100),
    Edition_Number INT,
    Text TEXT,
    Number_Of_Readers INT,
    Topic VARCHAR(20),
    PRIMARY KEY(Article_Title, Newspaper_Title, Edition_Number)
);

CREATE TABLE Includes (
    Article_Title VARCHAR(100),
	Newspaper_Title VARCHAR(100),
    Edition_Number INT,
    Photo_Title VARCHAR(50),
    PRIMARY KEY(Article_Title, Newspaper_Title, Edition_Number, Photo_Title)
);

CREATE TABLE Editor (
    Newspaper_Title VARCHAR(100),
    Edition_Number INT,
    CPR_No CHAR(11),
    PRIMARY KEY(Newspaper_Title, Edition_Number, CPR_No)
);

CREATE TABLE Journalist (
    CPR_No CHAR(11),
    First_Name VARCHAR(20) NOT NULL,
    Middle_Name VARCHAR(20),
    Last_Name VARCHAR(20) NOT NULL,
    Street VARCHAR(50),
    Civic_No INT,
    City VARCHAR (60),
    ZIP_code CHAR(4),
    WorkPhone_No VARCHAR(15),
    PrivatePhone_No VARCHAR(15),
    Email VARCHAR(100),
    PRIMARY KEY(CPR_No)
);

CREATE TABLE Photo (
    Photo_Title VARCHAR(50) PRIMARY KEY,
    Photo_Date DATE NOT NULL,
    CPR_No CHAR(11)
);

CREATE TABLE Writer (
    CPR_No CHAR(11),
    Article_Title VARCHAR(100),
	Newspaper_Title VARCHAR(100),
    Edition_Number INT,
    Role VARCHAR(20) NOT NULL,
    PRIMARY KEY(CPR_No, Article_Title, Newspaper_Title, Edition_Number)
);


CREATE TABLE Edition (
    Newspaper_Title VARCHAR(100),
    Edition_Number INT,
    Publish_Date DATE NOT NULL,
    PRIMARY KEY(Newspaper_Title, Edition_Number)
);

ALTER TABLE Article
    ADD FOREIGN KEY(Topic) REFERENCES Topic(Name)
        ON UPDATE CASCADE,
    ADD FOREIGN KEY(Newspaper_Title, Edition_Number) REFERENCES Edition(Newspaper_Title, Edition_Number)
        ON UPDATE CASCADE;

ALTER TABLE Includes
    ADD FOREIGN KEY(Article_Title, Newspaper_Title, Edition_Number) REFERENCES Article(Article_Title, Newspaper_Title, Edition_Number)
        ON UPDATE CASCADE,
	ADD FOREIGN KEY(Photo_Title) REFERENCES Photo(Photo_Title)
        ON UPDATE CASCADE;


ALTER TABLE Editor
    ADD FOREIGN KEY (Newspaper_Title, Edition_Number) REFERENCES Edition(Newspaper_Title, Edition_Number)
        ON UPDATE CASCADE,
    ADD FOREIGN KEY (CPR_No) REFERENCES Journalist(CPR_No)
        ON UPDATE CASCADE;

ALTER TABLE Photo
    ADD FOREIGN KEY (CPR_No) REFERENCES Journalist(CPR_No)
        ON UPDATE CASCADE;

ALTER TABLE Writer
    ADD FOREIGN KEY (CPR_No) REFERENCES Journalist(CPR_No)
        ON UPDATE CASCADE,
    ADD FOREIGN KEY (Article_Title, Newspaper_Title, Edition_Number) REFERENCES Article(Article_Title, Newspaper_Title, Edition_Number)
        ON UPDATE CASCADE;


ALTER TABLE Edition
    ADD FOREIGN KEY (Newspaper_Title) REFERENCES Newspaper(Newspaper_Title)
        ON UPDATE CASCADE;



#VIEW 1:-
#JournalistVIEW without roll :


CREATE VIEW JournalistView AS
SELECT
    j.First_Name,
    j.Middle_Name,
    j.Last_Name,
    a.Article_Title,
    a.Newspaper_Title,
    a.Edition_Number,
    a.Text as Article_Text,
    a.Number_Of_Readers,
    a.Topic,
    e.Publish_Date as Edition_Publish_Date,
    w.Role FROM Journalist j
                    JOIN Writer w ON j.CPR_No = w.CPR_No
                    JOIN Article a ON w.Article_Title = a.Article_Title
    AND w.Newspaper_Title = a.Newspaper_Title
    AND w.Edition_Number = a.Edition_Number
                    JOIN Edition e ON a.Newspaper_Title = e.Newspaper_Title
    AND a.Edition_Number = e.Edition_Number;






#VIEW 2:-
#Editor VIEW

CREATE VIEW EditorView AS
SELECT
    e.Newspaper_Title,
    e.Edition_Number,
    e.Publish_Date,
    a.Article_Title,
    a.Topic
FROM Editor ed
         JOIN Edition e ON ed.Newspaper_Title = e.Newspaper_Title
    AND ed.Edition_Number = e.Edition_Number
         JOIN Article a ON e.Newspaper_Title = a.Newspaper_Title
    AND e.Edition_Number = a.Edition_Number;



#VIEW 3:-
#Reporter VIEW

CREATE VIEW ReporterView AS
SELECT
    a.Article_Title,
    a.Newspaper_Title,
    a.Edition_Number,
    a.Text as Article_Text,
    a.Topic,
    e.Publish_Date as Edition_Publish_Date
FROM Includes i
         JOIN Article a ON i.Article_Title = a.Article_Title
    AND i.Newspaper_Title = a.Newspaper_Title
    AND i.Edition_Number = a.Edition_Number
         JOIN Edition e ON i.Newspaper_Title = e.Newspaper_Title
    AND i.Edition_Number = e.Edition_Number;




#VIEW 4:-
#hrVIEW

CREATE VIEW HRView AS
SELECT
    CPR_No,
    First_Name,
    Middle_Name,
    Last_Name,
    Street,
    Civic_No,
    City,
    ZIP_code,
    WorkPhone_No,
    PrivatePhone_No,
    Email
FROM Journalist;