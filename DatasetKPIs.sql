-- KPI FOR DATA VISUALIZATION

/*
1. Get the total number of students, males and females
2. Sub section students into Age groups and count the total number and sub section
3. Clasify the ages into age_groups, older than and younger than 21 and sub section into female and male
4. Classify Average CGPA into groups: first class, second class and third class
5. Get the total nuumber of students with respect to all mental illnesses.
6. Get the total number of married, unmarried students for all mental ilnesses
7. Group the results of all of the above to find the relationship with the provided columns in the dataset.
8. Group all results BY data in provided columns.
*/

SELECT Age, Course,Gender, `Depression Status`, `Marital Status`, `Anxiety Status`, `Panic Attack Status`,`Year of Study`, `Average_CGPA`, `Sought Specialist`,
    COUNT(*) AS Total_students,
    CASE WHEN Age >= 21 THEN 'Greater than 21' ELSE 'Less than 21' END AS Age_group,
    COUNT(*) AS Age_total,
    CASE 
		WHEN Average_CGPA >= 3.00 THEN '>3.00: First class'
		WHEN Average_CGPA >= 2.30 THEN '>2.30: Second class'
		ELSE'<2.30: Third class'
    END AS CGPA_group,
    COUNT(*) AS CGPA_count,
	COUNT(CASE WHEN Gender = 'Male' THEN 1 END) AS Totalmales,
    COUNT(CASE WHEN Gender = 'Female' THEN 1 END) AS Totalfemales,
	COUNT(CASE WHEN `Marital Status` = 'Yes' THEN 1 END) AS Totalmarried,
	COUNT(CASE WHEN `Marital Status` = 'No' THEN 1 END) AS Totalunmarried,
    COUNT(CASE WHEN `Depression Status` = 'Yes' THEN 1 END) AS TotalDepressed,
	COUNT(CASE WHEN `Anxiety Status` = 'Yes' THEN 1 END) AS TotalAnxious,
	COUNT(CASE WHEN `Panic Attack Status` = 'Yes' THEN 1 END) AS TotalPanic,
    COUNT(CASE WHEN `Depression Status` = 'Yes' AND Gender= 'Male' THEN 1 END) AS Totaldepressedmales,
	COUNT(CASE WHEN `Depression Status` = 'Yes' AND Gender= 'Female' THEN 1 END) AS Totaldepressedfemales,
    COUNT(CASE WHEN `Depression Status` = 'Yes' AND `Marital Status` = 'Yes' THEN 1 END) AS Depressedmarried,
    COUNT(CASE WHEN `Depression Status` = 'Yes' AND `Marital Status` = 'No' THEN 1 END) AS Depressedunmarried,
    COUNT(CASE WHEN `Anxiety Status`=  'Yes' AND Gender = 'Male' THEN 1 END) AS Anxiousmales,
    COUNT(CASE WHEN `Anxiety Status`=  'Yes' AND Gender = 'Female' THEN 1 END) AS Anxiousfemales,
    COUNT(CASE WHEN `Anxiety Status`=  'Yes' AND `Marital Status` = 'Yes' THEN 1 END) AS Anxiousmarried,
    COUNT(CASE WHEN `Anxiety Status`=  'Yes' AND `Marital Status` = 'No' THEN 1 END) AS Anxiousunmarried,
    COUNT(CASE WHEN `Panic Attack Status` = 'Yes' AND Gender = 'Male' THEN 1 END) AS Panicmales,
    COUNT(CASE WHEN `Panic Attack Status` = 'Yes' AND Gender = 'Female' THEN 1 END) AS Panicfemales,
    COUNT(CASE WHEN `Panic Attack Status` = 'Yes' AND `Marital Status` = 'Yes' THEN 1 END) AS Panicmarried,
    COUNT(CASE WHEN `Panic Attack Status` = 'Yes' AND `Marital Status` = 'No' THEN 1 END) AS Panicunmarried
FROM 
	studentsdata
GROUP BY Age, Course, Gender, `Depression Status`, `Marital Status`, `Anxiety Status`, `Panic Attack Status`,`Year of Study`, `Average_CGPA`, `Sought Specialist`, CGPA_group, Age_group;










