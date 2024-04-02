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


#1
INSERT Newspaper VALUES
('DKAvisen','2024-3-17',1);

#2
INSERT Topic VALUES
('Sport'),
('Entertainment'),
('Politics'),
('Crime'),
('Tech');

#3
INSERT Journalist VALUES
('012345-1111','Hans','Hanse','Hansen','Avej',1,'Roskilde','4000','12345678' ,'23456789','Hans@DKA.dk'),
('123456-2222','Jens','Jense','Jensen','Bvej',2,'Odense','5000','34567890' ,'45678901','Jens@DKA.dk'),
('234567-3333','Niels','Nielse','Nielsen','Cvej',3,'Køge','4600','56789012' ,'67890123','Niels@DKA.dk'),
('345678-4444','Mike','Micki','Hansen','Dvej',4,'Herfølge','4681','78901234' ,'89012345','Micki@DKA.dk'),
('456789-5555','Poul','Poule','Poulsen','Evej',5,'Vedbæk','2950','90123456' ,'01234567','Poul@DKA.dk'),
('456654-6666','Povl','Povle','Povlsen','Fvej',6,'Solrød','2680','52486523' ,'52789301','Povl@DKA.dk'),
('157896-7777','Anna','Annese','Annesen','Gvej',7,'Trørød','2950','98745102' ,'86358746','Anna@DKA.dk'),
('123456-8888','Peter','Petersen','Peters','ABCvej',12,'Odense','5000', '98765432', '12367678','Peter@DKA.dk'),
('987654-9999','Maria','Mikkelsen','Mikkel','XYZgade',25,'Køge','4600', '12345201','95754321', 'Maria@DKA.dk'),
('429689-0000','Anders','Andersen','Anders','EFGstræde',8,'Lilleby','9012' ,'23456789','98765432','Anders@DKA.dk'),
('345678-1122', 'Louise', 'Larsen', 'Lars', 'HIJvej',19,'Storbyen','3456','34567890' ,'23456789','Louise@DKA.dk'),
('234567-3344','Michael','Madsen','Mads','KLMgade',30,'Udmarken','6789', '45678901','34567890','Michael@DKA.dk'),
('567890-5566','Sofie','Sørensen','Søren','NOPvej',5,'Bakkerne','0123', '56789012','45678901','Sofie@DKA.dk'),
('678901-7788','Jonas','Jensen','Jens','QRSgade',17,'Kystbyen','3456', '67890123','56789012','Jonas@DKA.dk'),
('789012-9900','Mette','Mortensen','Morten','TUVvej',22,'Strandby','7890', '78901234','67890123','Mette@DKA.dk'),
('890123-1234', 'Lars','Lassen','Lasse','WXYgade',3,'Ødeby','8901', '89012345','78901234','Lars@DKA.dk'),
('901234-5678','Camilla','Christensen','Christian','ZABvej',14,'Højby','2345', '90123456','89012345','Camilla@DKA.dk');


#4
INSERT Photo VALUES
('Footbal','2024-1-13','901234-5678'),
('Comedy','2024-1-17','890123-1234'),
('Mor Mette','2024-2-13','789012-9900'),
('Dead person','2024-3-9','678901-7788'),
('Iphone 16','2024-4-1','234567-3344');

#5
INSERT Edition VALUES
('DKAvisen',1,'2024-3-18'),
('DKAvisen',2,'2024-3-25'),
('DKAvisen',3,'2024-4-1'),
('DKAvisen',4,'2024-4-8'),
('DKAvisen',5,'2024-4-15');

#6
INSERT Article VALUES
('Super bowl winner','DKAvisen',1, 'kansas wins the super bowl',15351,'Tech'),
('New tv show has 0 viewers','DKAvisen',2, 'The new tv show who wants to be a loser, has 0 viewers after sending 2 episodes',22465,'Tech'),
('Ye wins the American election','DKAvisen',3, 'Ye, former knowns as Kanye west won the American election, with 99% of the votes',78952,'Tech'),
('Ye killed','DKAvisen',4, 'After winning the American election, Ye was found dead,wearing a make America great again cap',51358,'Tech'),
('The new Iphone 16','DKAvisen',5, 'Apple launched the new Iphone 16, yesterday with some cool new tech in it',6585,'Tech'),
('World Health Organization Declares Global Pandemic','DKAvisen',1, 'The World Health Organization has officially declared the outbreak of a new virus as a global pandemic.',65281,'Entertainment'),
('Scientists Discover New Species in Amazon Rainforest','DKAvisen',2,'A team of scientists has discovered a previously unknown species of amphibian in the depths of the Amazon Rainforest',22222,'Entertainment'),
('SpaceX Successfully Lands Crewed Mission on Mars','DKAvisen',3,'SpaceX has achieved a historic milestone by successfully landing a crewed mission on the surface of Mars.',35236,'Entertainment'),
('Government Imposes Strict Measures to Combat Air Pollution','DKAvisen',4,'In response to alarming levels of air pollution, the government has imposed strict measures including vehicle restrictions and industrial regulations to combat the environmental crisis',41548,'Politics'),
('Breakthrough in Cancer Treatment Research','DKAvisen',5,'Researchers have announced a major breakthrough in cancer treatment research, unveiling a promising new therapy that targets specific cancer cells while minimizing side effects',55123,'Politics'),
('Tourists flock to Denmark at Easter','DKAvisen',3,'New figures from Hotels.com and Momondo predict that Denmark will receive significantly more international guests over Easter 2024 than last year.' , 43254,'Politics'),
('The earth is apparently flat','DKAvisen',1, 'Scientists have found that earth is flat but also has a hole in the middle like a donut.', 52341, 'Crime'),
('Barack Obama drops in on Rishi Sunak on London trip','DKAvisen',4,'Former US president understood to have discussed AI and other subjects with PM on informal courtesy visit', 65456,'Crime'),
('Photo of Queen Elizabeth II and family was enhanced at source, agency says','DKAvisen',2,'Getty Images flags second royal photo days after storm over image of Princess of Wales' , 34532,'Sport'),
('Global warming solved!','DKAvisen',1, 'Global warming has been solved with this new machine' , 23456,'Sport'),
('Sunak braces for backlash as smoking ban bill to be introduced in Commons','DKAvisen',5, 'Libertarian faction of Conservatives expected to stage a rebellion but measure has widespread support', 76854,'Sport');



#7 
INSERT Includes VALUES
('Super bowl winner','DKAvisen',1,'Footbal'),
('New tv show has 0 viewers','DKAvisen',2,'Footbal'),
('Ye killed','DKAvisen',4,'Dead person'),
('The new Iphone 16','DKAvisen',5,'Iphone 16');

#8
INSERT Editor VALUES
('DKAvisen',1,'456789-5555'),
('DKAvisen',2,'234567-3333'),
('DKAvisen',3,'012345-1111'),
('DKAvisen',4,'234567-3344'),
('DKAvisen',5,'987654-9999');

#9
INSERT Writer VALUES
('012345-1111','Super bowl winner','DKAvisen',1,'writer'),
('123456-2222','New tv show has 0 viewers','DKAvisen',2,'writer'),
('234567-3333','Ye wins the American election','DKAvisen',3,'editor'),
('345678-4444','Ye killed','DKAvisen',4,'writer'),
('456789-5555','The new Iphone 16','DKAvisen',5,'editor'),
('456654-6666','Tourists flock to Denmark at Easter','DKAvisen',3,'writer'),
('157896-7777','The earth is apparently flat','DKAvisen',1,'writer'),
('123456-8888','Global warming solved!','DKAvisen',1,'writer'),
('987654-9999','Sunak braces for backlash as smoking ban bill to be introduced in Commons','DKAvisen',5,'writer'),
('345678-1122','Barack Obama drops in on Rishi Sunak on London trip','DKAvisen',4,'editor'),
('234567-3344','Photo of Queen Elizabeth II and family was enhanced at source, agency says','DKAvisen',2,'writer');






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