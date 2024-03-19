#1
use DKAvisen;
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
(012345-1111,'Hans','Hanse','Hansen','Avej',1,'Roskilde','4000','12345678' ,'23456789','Hans@DKA.dk'),
(123456-2222,'Jens','Jense','Jensen','Bvej',2,'Odense','5000','34567890' ,'45678901','Jens@DKA.dk'),
(234567-3333,'Niels','Nielse','Nielsen','Cvej',3,'Køge','4600','56789012' ,'67890123','Niels@DKA.dk'),
(345678-4444,'Mike','Micki','Hansen','Dvej',4,'Herfølge','4681','78901234' ,'89012345','Micki@DKA.dk'),
(456789-5555,'Poul','Poule','Poulsen','Evej',5,'Vedbæk','2950','90123456' ,'01234567','Poul@DKA.dk'),
(456654-6666,'Povl','Povle','Povlsen','Fvej',6,'Solrød','2680','52486523' ,'52789301','Povl@DKA.dk'),
(157896-7777,'Anna','Annese','Annesen','Gvej',7,'Trørød','2950','98745102' ,'86358746','Anna@DKA.dk'),
(123456-8888,'Peter','Petersen','Peters','ABCvej',12,'Odense','5000', '98765432', '12367678','Peter@DKA.dk'),
(987654-9999,'Maria','Mikkelsen','Mikkel','XYZgade',25,'Køge','4600', '12345201','95754321', 'Maria@DKA.dk'),
(429689-0000,'Anders','Andersen','Anders','EFGstræde',8,'Lilleby','9012' ,'23456789','98765432','Anders@DKA.dk'),
(345678-1122, 'Louise', 'Larsen', 'Lars', 'HIJvej',19,'Storbyen','3456','34567890' ,'23456789','Louise@DKA.dk'),
(234567-3344,'Michael','Madsen','Mads','KLMgade',30,'Udmarken','6789', '45678901','34567890','Michael@DKA.dk'),
(567890-5566,'Sofie','Sørensen','Søren','NOPvej',5,'Bakkerne','0123', '56789012','45678901','Sofie@DKA.dk'),
(678901-7788,'Jonas','Jensen','Jens','QRSgade',17,'Kystbyen','3456', '67890123','56789012','Jonas@DKA.dk'),
(789012-9900,'Mette','Mortensen','Morten','TUVvej',22,'Strandby','7890', '78901234','67890123','Mette@DKA.dk'),
(890123-1234, 'Lars','Lassen','Lasse','WXYgade',3,'Ødeby','8901', '89012345','78901234','Lars@DKA.dk'),
(901234-5678,'Camilla','Christensen','Christian','ZABvej',14,'Højby','2345', '90123456','89012345','Camilla@DKA.dk');


#4
INSERT Photo VALUES
('Footbal','2024-1-13',901234-5678),
('Comedy','2024-1-17',890123-1234),
('Mor Mette','2024-2-13',789012-9900),
('Dead person','2024-3-9',678901-7788),
('Iphone 16','2024-4-1',234567-3344);

#5
INSERT Edition VALUES
('DKAvisen',1,'2024-3-18'),
('DKAvisen',2,'2024-3-25'),
('DKAvisen',3,'2024-4-1'),
('DKAvisen',4,'2024-4-8'),
('DKAvisen',5,'2024-4-15');

#6
INSERT Article VALUES
('Super bowl winner','DKAvisen',1, 'kansas wins the super bowl',15351,'Sport'),
('New tv show has 0 viewers','DKAvisen',2, 'The new tv show who wants to be a loser, 
	has 0 viewers after sending 2 episodes',22465,'Entertainment'),
('Ye wins the American election','DKAvisen',3, 'Ye, former knowns as Kanye west 
	won the American election, with 99% of the votes',78952,'Politics'),
('Ye killed','DKAvisen',4, 'After winning the American election, Ye was found dead,
	wearing a make America great again cap',51358,'Crime'),
('The new Iphone 16','DKAvisen',5, 'Apple launched the new Iphone 16, yesterday
	with some cool new tech in it',6585,'Tech'),
('World Health Organization Declares Global Pandemic','DKAvisen',1, 'The World Health Organization has officially declared the outbreak of a new virus as a global pandemic.',65281,'Politics'),

('Scientists Discover New Species in Amazon Rainforest','DKAvisen',2, 'A team of scientists has discovered a previously unknown species of amphibian in the depths of the Amazon Rainforest',22222,'Tech'),

('SpaceX Successfully Lands Crewed Mission on Mars','DKAvisen',3, 'SpaceX has achieved a historic milestone by successfully landing a crewed mission on the surface of Mars.',35236,'Tech'),

('Government Imposes Strict Measures to Combat Air Pollution','DKAvisen',4, 'In response to alarming levels of air pollution, the government has imposed strict measures including vehicle restrictions and industrial regulations to combat the environmental crisis',41548,'Politics'),

('Breakthrough in Cancer Treatment Research','DKAvisen',5, 'Researchers have announced a major breakthrough in cancer treatment research, unveiling a promising new therapy that targets specific cancer cells while minimizing side effects',55123,'Sport'),


('Tourists flock to Denmark at Easter', 'DKAvisen', 3, 'New figures from Hotels.com and Momondo predict that Denmark will receive significantly more international guests over Easter 2024 than last year.' , 43254, ' Entertainment'),


('The earth is apparently flat', 'DKAvisen', 1, 'Scientists have found that earth is flat but also has a hole in the middle like a donut.', 52341, 'Tech'),


('Barack Obama drops in on Rishi Sunak on London trip', 'DKAvisen', 4, 'Former US president understood to have discussed AI and other subjects with PM on informal courtesy visit', 65456, 'Politics'),


('Photo of Queen Elizabeth II and family was enhanced at source, agency says', 'DKAvisen', 2, 'Getty Images flags second royal photo days after storm over image of Princess of Wales' , 34532, 'Politics'),

('Global warming solved!', 'DKAvisen', 1, 'Global warming has been solved with this new machine' , 23456, 'Tech'),

('Sunak braces for backlash as smoking ban bill to be introduced in Commons', 'DKAvisen', 5, 'Libertarian faction of Conservatives expected to stage a rebellion but measure has widespread support', 76854, 'Politics');



#7 
INSERT Includes VALUES
('Super bowl winner','DKAvisen',1,'Footbal'),
('New tv show has 0 viewers','DKAvisen',2,'Footbal'),
('Ye killed','DKAvisen',4,'Dead person'),
('The new Iphone 16','DKAvisen',5,'Iphone 16');

#8
INSERT Editor VALUES
('DKAvisen',1,456789-5555),
('DKAvisen',2,234567-3333),
('DKAvisen',3,012345-1111),
('DKAvisen',4,234567-3344),
('DKAvisen',5,987654-9999);

#9
INSERT Writer VALUES
(012345-1111,'Super bowl winner','DKAvisen',1,'writer'),
(123456-2222,'New tv show has 0 viewers','DKAvisen',2,'writer'),
(234567-3333,'Ye wins the American election','DKAvisen',3,'editor'),
(345678-4444,'Ye killed','DKAvisen',4,'writer'),
(456789-5555,'The new Iphone 16','DKAvisen',5,'editor'),
(456654-6666, 'Tourists flock to Denmark at Easter', 'DKAvisen',3, 'writer'),
(157896-7777, 'The earth is apparently flat', 'DKAvisen', 5, 'writer'),
(123456-8888, 'Global warming solved!', 'DKAvisen', 2, 'writer'),
(987654-9999, 'Sunak braces for backlash as smoking ban bill to be introduced in Commons', 'DKAvisen', 2, 'writer'),
(345678-1122, 'Barack Obama drops in on Rishi Sunak on London trip', 'DKAvisen', 4, 'editor'),
(234567-3344, 'Photo of Queen Elizabeth II and family was enhanced at source, agency says', 'DKAvisen', 1, 'writer');


