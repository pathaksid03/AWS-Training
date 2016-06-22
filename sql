model1 suggests 2 items[3] -> m1_id, s1, s2
model2 suggests 2 items[3] -> m2_id, s3, s4
model3 has a preference[1] queue of all items[2] [2col] -> m3_id, s

result has 4 columns
1,2 - suggestions from model1
3,4 - suggestions from model2

the objective is to detect repititon in 4.1,4.2,4.3,4.4 and fill the void (non repeating) from model3.




CREATE TABLE test.model1
(m1id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,sug1 INT(10)
,sug2 INT(10)
);
INSERT INTO model1(sug1,sug2) VALUES(1,3);
INSERT INTO model1(sug1,sug2) VALUES(2,7);
INSERT INTO model1(sug1,sug2) VALUES(4,5);
INSERT INTO model1(sug1,sug2) VALUES(6,10);
INSERT INTO model1(sug1,sug2) VALUES(8,9);
SELECT * FROM model1;


CREATE TABLE test.model2
(m2id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,sug3 INT(10)
,sug4 INT(10)
);
INSERT INTO model2(sug3,sug4) VALUES(8,1);
INSERT INTO model2(sug3,sug4) VALUES(3,4);
INSERT INTO model2(sug3,sug4) VALUES(5,9);
INSERT INTO model2(sug3,sug4) VALUES(7,3);
INSERT INTO model2(sug3,sug4) VALUES(2,6);
SELECT * FROM model2;



CREATE TABLE results AS(

SELECT model1.sug1, model1.sug2, model2.sug3, model2.sug4
FROM model1
JOIN model2
ON model1.m1id = model2.m2id);
SELECT * FROM results;

