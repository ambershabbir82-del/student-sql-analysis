- ============================================
-- Student Performance Analysis - SQL Queries
-- Database: StudentPerformanceDB
-- Table: StudentsPerformance
-- ============================================
 
-- View all data
SELECT * FROM StudentsPerformance;
 
 
-- Filter: Female students only
SELECT * FROM StudentsPerformance  WHERE gender = 'female';
 
 
-- Filter: Male students only
SELECT * FROM StudentsPerformance WHERE gender = 'male';
 
 
-- ===== SORTING =====
 
-- Top 5 students by math score
SELECT TOP 5 * FROM StudentsPerformance 
ORDER BY math_score DESC;
 
 
-- Top performers in writing (score above 90)
SELECT gender, writing_score 
FROM StudentsPerformance 
WHERE writing_score > 90 
ORDER BY writing_score DESC;
 
 
-- Average math score by gender
SELECT gender, AVG(math_score) as avg_math 
FROM StudentsPerformance 
GROUP BY gender;
 
 
-- Average scores across all subjects, by gender
SELECT gender, 
       AVG(math_score) as avg_math, 
       AVG(reading_score) as avg_reading, 
       AVG(writing_score) as avg_writing 
FROM StudentsPerformance 
GROUP BY gender;
 
 
-- Count of students by gender
SELECT gender, COUNT(*) as total_students 
FROM StudentsPerformance 
GROUP BY gender;
 
 
-- Overall min, max, and average math score
SELECT MIN(math_score) as lowest_score, 
       MAX(math_score) as highest_score, 
       AVG(math_score) as average_score 
FROM StudentsPerformance;
 
 
-- Average math score by parental education level (sorted highest to lowest)
SELECT parental_level_of_education, 
       AVG(math_score) as avg_math, 
       COUNT(*) as total_students 
FROM StudentsPerformance 
GROUP BY parental_level_of_education 
ORDER BY avg_math DESC;
 
 
-- Average scores by lunch type (standard vs free/reduced)
SELECT lunch, 
       AVG(math_score) as avg_math, 
       AVG(reading_score) as avg_reading, 
       AVG(writing_score) as avg_writing 
FROM StudentsPerformance 
GROUP BY lunch;
 
 
-- Female students who scored above 90 in math
SELECT * FROM StudentsPerformance 
WHERE gender = 'female' AND math_score > 90;
 
 
-- Average math score for students who completed test prep, grouped by gender
SELECT gender, test_preparation_course, AVG(math_score) as avg_math 
FROM StudentsPerformance 
WHERE test_preparation_course = 'completed' 
GROUP BY gender, test_preparation_course;
 
 
-- Students with reading score between 60 and 80
SELECT * FROM StudentsPerformance 
WHERE reading_score BETWEEN 60 AND 80;
 
 
-- Students whose parents hold any kind of degree
SELECT * FROM StudentsPerformance 
WHERE parental_level_of_education LIKE '%degree%';
 
 
-- Average math score grouped by gender AND lunch type
SELECT gender, lunch, AVG(math_score) as avg_math 
FROM StudentsPerformance 
GROUP BY gender, lunch 
ORDER BY gender, lunch;