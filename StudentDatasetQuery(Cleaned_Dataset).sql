CREATE DATABASE students;
USE students;

SELECT * FROM studentsdata;

ALTER TABLE studentsdata
DROP COLUMN Timestamp; -- Drop the timestamp columm

ALTER TABLE studentsdata
RENAME COLUMN `Choose your gender` TO Gender,
RENAME COLUMN `What is your course?` TO Course,
RENAME COLUMN `Your current year of Study` TO `Year of Study`,
RENAME COLUMN `What is your CGPA?` TO CGPA,
RENAME COLUMN `Do you have Depression?` TO `Depression Status`,
RENAME COLUMN `Do you have Anxiety?` TO `Anxiety Status`,
RENAME COLUMN `Do you have Panic attack?` TO `Panic Attack Status`,
RENAME COLUMN `Did you seek any specialist for a treatment?` TO `Sought Specialist`; -- Rename columns to ease access and efficiency 

UPDATE studentsdata
SET Course= 'Information Technology'
WHERE Course = 'BIT';

SELECT * FROM studentsdata WHERE Course = 'Information Technology';

UPDATE studentsdata
SET Course =
	CASE
		WHEN Course = 'ALA' THEN 'Applied Library Arts'
        WHEN Course = 'BCS' THEN 'Computer Science'
		WHEN Course = 'BENL' THEN 'Human Science in English and Literature'
		WHEN Course = 'CTS' THEN 'Career and Technology Studies'
		WHEN Course = 'TAASL' THEN 'Teaching English as a Second Language'
		WHEN Course = 'ENM' THEN 'Engineering Mathematics'
		WHEN Course = 'Engine' THEN 'Engineering'
		WHEN Course = 'engin' THEN 'Engineering'
        WHEN Course = 'KIRHS' THEN 'Islamic Studies and Human Sciences'
        WHEN Course = 'IRKHS' THEN 'Islamic Studies and Human Sciences'
        WHEN Course = 'KENMS' THEN 'Kulliyah of Economics and Management Sciences'
        WHEN Course = 'laws' THEN 'Law'
        WHEN Course = 'DIPLOMA TESL' THEN 'Teaching English as a Second Language'
		WHEN Course = 'MHSC' THEN 'Master of Health Science'
        WHEN Course = 'IT' THEN 'Information Technology'
        ELSE Course
	END; -- Renaming course codes to ensure clarity
    
SELECT * FROM studentsdata;

UPDATE studentsdata
SET `Year of Study` = UPPER(`Year of Study`)
WHERE `Year of Study` LIKE 'year%';

SELECT 
	(SUBSTRING_INDEX(CGPA, '-',1) + SUBSTRING_INDEX(CGPA, '-', -1)) / 2 AS Average_CGPA
FROM studentsdata; -- Getting the average CGPA of each student from the range

ALTER TABLE studentsdata
ADD COLUMN `Average_CGPA` DECIMAL(3,2); -- Changing the data type from text to decimal format

UPDATE studentsdata
SET `Average_CGPA` = (SUBSTRING_INDEX(CGPA, '-',1) + SUBSTRING_INDEX(CGPA, '-', -1)) / 2; -- Updating the table with the average Cgpa values

SELECT
	MIN(Average_CGPA) AS youngest,
    MAX(Average_CGPA) AS oldest
FROM studentsdata;

SELECT * FROM studentsdata;

SELECT
	MIN(Age) as youngest,
    MAX(Age) as Oldest
FROM studentsdata;