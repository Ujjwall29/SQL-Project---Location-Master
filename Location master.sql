USE DBS01;

SELECT * FROM CHILD_REGISTER;
SELECT * FROM CHILD_TEST_SCORE;
SELECT * FROM LOCATION_MASTER;

-- WHICH IS THE LARGEST BLOCK BASED ON THE NUMBER OF VILLAGES? hOW MANY VILLAGES ARE THERE IN THE BLOCK? BLOCK IS IN WHICH DIST.?

SELECT DISTRICT, BLOCK, COUNT(VILLAGE) FROM LOCATION_MASTER
GROUP BY BLOCK, DISTRICT
ORDER BY COUNT(VILLAGE) DESC
LIMIT 1;

-- WHICH DISTRICT HAS THE HIGHEST NUMBER OF GIRLS REGISTERED FOR THE TEST? HOW MANY GIRLS ARE REGISTERED FOR TEST IN THAT DIST

SELECT LM.DISTRICT,CR.GENDER, COUNT(GENDER)
FROM LOCATION_MASTER LM
JOIN CHILD_REGISTER CR
ON LM.VILLAGE_CODE = CR.VILLAGE_CODE
GROUP BY LM.DISTRICT, CR.GENDER
HAVING GENDER='F'
ORDER BY COUNT(GENDER) DESC
LIMIT 1;

-- DISPLAY THE REGISTRATION_NUMBER, NAME AND GENDER OF CHILDREN WHO HAVE NOT APPEARED FOR TEST. ARRANGE THE ROWS IN ASCENDING ALPHABETICAL
-- ORDER OF THE NAME

SELECT * FROM CHILD_REGISTER;
SELECT * FROM CHILD_TEST_SCORE;
SELECT * FROM LOCATION_MASTER;

SELECT CR.REGISTRATION_NO, CR.NAME, CR.GENDER
FROM CHILD_REGISTER CR
WHERE REGISTRATION_NO NOT IN (SELECT REGISTRATION_NO FROM CHILD_TEST_SCORE)
ORDER BY CR.NAME;