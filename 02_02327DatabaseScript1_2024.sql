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