USE DKAvisen;
#Modifications
#1
INSERT Journalist (CPR_No, First_Name, Middle_Name, Last_Name, Street, Civic_No, City, ZIP_Code, WorkPhone_No, PrivatePhone_No, Email) 
VALUES ('220787-2123', 'Mikkel', NULL, 'Nielsen', 'Bredgade', 45, 'Copenhagen', 1260, '33456789', '78781234', 'mikkel.j.nielsen@DKA.dk');

#2
UPDATE Journalist
SET PrivatePhone_No = '56913013'
WHERE CPR_No = '220787-2123';

#3
UPDATE Journalist
SET Email = REPLACE(Email, '@DKA.dk', '@journalist.DKA.dk')
WHERE Email LIKE '%@DKA.dk';

#4
DELETE FROM Includes 
WHERE Photo_Title = 'Footbal';

DELETE FROM Photo
WHERE Photo_Title = 'Footbal';

#Queries
#1
SELECT Article_Title, Number_Of_Readers
FROM Article
WHERE Number_Of_Readers = (SELECT MAX(Number_Of_Readers) FROM Article)
GROUP BY Topic;

#2
SELECT j.First_Name, j.Last_Name, SUM(a.Number_Of_Readers) AS Total_Reads
FROM Journalist as j
JOIN Writer as w ON j.CPR_No = w.CPR_No
JOIN Article as a ON w.Article_Title = a.Article_Title 
    AND w.Newspaper_Title = a.Newspaper_Title 
    AND w.Edition_Number = a.Edition_Number
GROUP BY j.CPR_No
ORDER BY Total_Reads DESC
LIMIT 10;

#3
SELECT j.First_Name, j.Last_Name
FROM Journalist j
JOIN Photo p ON j.CPR_No = p.CPR_No
WHERE p.Photo_Title IN (
    SELECT i.Photo_Title
    FROM Includes i
    GROUP BY i.Photo_Title
    HAVING COUNT(i.Photo_Title) = 1
);

#4
SELECT Name, Number_Of_Readers
FROM Topic as t
JOIN Article as a ON t.Name = a.Topic
WHERE (
SELECT AVG(Number_Of_Readers) FROM Topic as t
JOIN Article as a ON t.Name = a.Topic
) > Number_Of_Readers;

#5
SELECT j.First_Name, j.Last_Name
FROM Journalist as j
JOIN Writer as w
JOIN Article as a ON w.Article_Title = a.Article_Title 
    AND w.Newspaper_Title = a.Newspaper_Title 
    AND w.Edition_Number = a.Edition_Number
JOIN Includes as i ON i.Article_Title = a.Article_Title
JOIN Photo as p ON p.CPR_No = j.CPR_No
WHERE j.CPR_No = w.CPR_No AND p.Photo_Title = i.Photo_Title
GROUP BY j.CPR_No;

#Functions
DELIMITER //
CREATE FUNCTION GetNumberOfReaders(articleTitle VARCHAR(100), newspaperTitle VARCHAR(100), editionNumber INT)
RETURNS INT
BEGIN
    DECLARE readers INT;
    SELECT Number_Of_Readers INTO readers FROM Article
    WHERE Article_Title = articleTitle AND Newspaper_Title = newspaperTitle AND Edition_Number = editionNumber;
    RETURN readers;
END;

#Testing Functions
SELECT 
    Article_Title, 
    Newspaper_Title, 
    Edition_Number, 
    GetNumberOfReaders(Article_Title, Newspaper_Title, Edition_Number) AS Readers
FROM Article
WHERE Edition_Number = 1
AND GetNumberOfReaders(Article_Title, Newspaper_Title, Edition_Number) > 10000;


#Procedures
DELIMITER //
CREATE PROCEDURE AddJournalist(
	IN vCPR_No CHAR(11), 
	IN vFirst_Name VARCHAR(20), 
	IN vMiddle_Name VARCHAR(20), 
	IN vLast_Name VARCHAR(20), 
	IN vStreet VARCHAR(50),
    IN vCivic_No INT,
    IN vCity VARCHAR (60),
    IN vZIP_code CHAR(4),
    IN vWorkPhone_No VARCHAR(15),
    IN vPrivatePhone_No VARCHAR(15),
    IN vEmail VARCHAR(100)
    )
BEGIN
	INSERT Journalist VALUES
    (vCPR_No,vFirst_Name,vMiddle_Name,vLast_Name,
    vStreet,vCivic_No,vCity,vZIP_code,
    vWorkPhone_No,vPrivatePhone_No,vEmail);
END //
DELIMITER ;

CALL AddJournalist('323456-8901', 'John', 'Robert', 'Doe',
'123 Main Street', 101, 'Anytown', 
'1234', '555-123-4567', 
'555-987-6543', 'john.doe@example.com');

#Testing Procedures
Select *
From Journalist;

#Triggers
DELIMITER //

CREATE TRIGGER BeforeArticleInsert BEFORE INSERT ON Article FOR EACH ROW
BEGIN
    IF NEW.Number_Of_Readers IS NULL THEN
        SET NEW.Number_Of_Readers = 0;
    END IF;
END; //

DELIMITER ;

#Testing Triggers
INSERT INTO Article (Article_Title, Newspaper_Title, Edition_Number, Text, Topic)
VALUES ('The future of renewable energy', 'DKAvisen', 1, 'An in-depth look at the advancements in renewable energy and its impact on the global energy market.', 'Tech');
