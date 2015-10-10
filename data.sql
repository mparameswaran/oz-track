CREATE TABLE CLIENT_TARGET
(
ID int NOT NULL AUTO_INCREMENT,
Letter_Grade varchar(1),
Grade_Level float,
Hourly_Tol float,
Daily_Tol float,
PRIMARY KEY(ID)
);

INSERT INTO CLIENT_TARGET VALUES (NULL,'A',0.33,20,5);
INSERT INTO CLIENT_TARGET VALUES (NULL,'B',0.10,50,10);
INSERT INTO CLIENT_TARGET VALUES (NULL,'C',0.75,NULL,20);
INSERT INTO CLIENT_TARGET VALUES (NULL,'D',4.86,NULL,20);
INSERT INTO CLIENT_TARGET VALUES (NULL,'E',0.24,NULL,20);
INSERT INTO CLIENT_TARGET VALUES (NULL,'F',NULL,NULL,NULL);
INSERT INTO CLIENT_TARGET VALUES (NULL,'G',0.07,NULL,20);
INSERT INTO CLIENT_TARGET VALUES (NULL,'H',43.01,20,5);
INSERT INTO CLIENT_TARGET VALUES (NULL,'I',573.57,50,10);

