create database HR ;

use HR;

-- ============================================
-- HR EMPLOYEE ATTRITION PROJECT
-- STEP 1: VIEW THE DATA
-- ============================================

SELECT * FROM hr_employee_attrition;

-- 1. Total number of records

SELECT COUNT(*) AS Total_Records
FROM hr_employee_attrition;


-- 2. Minimum and Maximum Age

-- Fix incorrect Age column name

ALTER TABLE hr_employee_attrition
RENAME COLUMN `ï»¿Age` TO Age;


SELECT
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age
FROM hr_employee_attrition;


-- 3. Average Age

SELECT
    AVG(Age) AS Average_Age
FROM hr_employee_attrition;


-- 4. Check for duplicate records

SELECT
    Age,
    Attrition,
    BusinessTravel,
    DailyRate,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeCount,
    EmployeeNumber,
    EnvironmentSatisfaction,
    Gender,
    HourlyRate,
    JobInvolvement,
    JobLevel,
    JobRole,
    JobSatisfaction,
    MaritalStatus,
    MonthlyIncome,
    MonthlyRate,
    NumCompaniesWorked,
    Over18,
    OverTime,
    PercentSalaryHike,
    PerformanceRating,
    RelationshipSatisfaction,
    StandardHours,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    WorkLifeBalance,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager,
    COUNT(*) AS Duplicate_Count
FROM hr_employee_attrition
GROUP BY
    Age,
    Attrition,
    BusinessTravel,
    DailyRate,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeCount,
    EmployeeNumber,
    EnvironmentSatisfaction,
    Gender,
    HourlyRate,
    JobInvolvement,
    JobLevel,
    JobRole,
    JobSatisfaction,
    MaritalStatus,
    MonthlyIncome,
    MonthlyRate,
    NumCompaniesWorked,
    Over18,
    OverTime,
    PercentSalaryHike,
    PerformanceRating,
    RelationshipSatisfaction,
    StandardHours,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    WorkLifeBalance,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager
HAVING COUNT(*) > 1;


-- ============================================
-- STEP 2 – DATA CLEANING
-- 2.1 CHECK FOR NULL VALUES
-- ============================================

SELECT
    COUNT(*) AS Total_Rows,
    SUM(Age IS NULL) AS Null_Age,
    SUM(Attrition IS NULL) AS Null_Attrition,
    SUM(BusinessTravel IS NULL) AS Null_BusinessTravel,
    SUM(Department IS NULL) AS Null_Department,
    SUM(Gender IS NULL) AS Null_Gender,
    SUM(JobRole IS NULL) AS Null_JobRole,
    SUM(MonthlyIncome IS NULL) AS Null_MonthlyIncome,
    SUM(OverTime IS NULL) AS Null_OverTime
FROM hr_employee_attrition;


-- 2.2 CHECK DUPLICATE RECORDS

SELECT
    EmployeeNumber,
    COUNT(*) AS Duplicate_Count
FROM hr_employee_attrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- 2.3 CHECK ATTRITION VALUES

SELECT
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Attrition;


-- 2.4 CHECK DEPARTMENT VALUES

SELECT
    Department,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Department;


-- 2.5 CHECK GENDER VALUES

SELECT
    Gender,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Gender;


-- ============================================
-- STEP 3 – REMOVE DUPLICATE RECORDS
-- 3.1 CHECK DUPLICATE EMPLOYEE NUMBERS
-- ============================================

SELECT
    EmployeeNumber,
    COUNT(*) AS Duplicate_Count
FROM hr_employee_attrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;


-- 3.2 CHECK COMPLETE DUPLICATE RECORDS

SELECT
    Age,
    Attrition,
    BusinessTravel,
    DailyRate,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeNumber,
    Gender,
    JobRole,
    MonthlyIncome,
    OverTime,
    COUNT(*) AS Duplicate_Count
FROM hr_employee_attrition
GROUP BY
    Age,
    Attrition,
    BusinessTravel,
    DailyRate,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeNumber,
    Gender,
    JobRole,
    MonthlyIncome,
    OverTime
HAVING COUNT(*) > 1;



-- ============================================
-- STEP 4 – CHECK INVALID VALUES
-- 4.1 CHECK ATTRITION
-- ============================================

SELECT DISTINCT Attrition
FROM hr_employee_attrition;


-- 4.2 CHECK BUSINESS TRAVEL

SELECT DISTINCT BusinessTravel
FROM hr_employee_attrition;


-- 4.3 CHECK DEPARTMENT

SELECT DISTINCT Department
FROM hr_employee_attrition;


-- 4.4 CHECK OVERTIME

SELECT DISTINCT OverTime
FROM hr_employee_attrition;


-- 4.5 CHECK GENDER

SELECT DISTINCT Gender
FROM hr_employee_attrition;


-- ============================================
-- STEP 5 – NUMERICAL DATA VALIDATION
-- 5.1 CHECK AGE
-- ============================================

SELECT
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age,
    AVG(Age) AS Average_Age
FROM hr_employee_attrition;


SELECT *
FROM hr_employee_attrition
WHERE Age < 18 OR Age > 100;


-- 5.2 CHECK MONTHLY INCOME

SELECT
    MIN(MonthlyIncome) AS Minimum_Income,
    MAX(MonthlyIncome) AS Maximum_Income,
    AVG(MonthlyIncome) AS Average_Income
FROM hr_employee_attrition;


SELECT *
FROM hr_employee_attrition
WHERE MonthlyIncome < 0;


-- 5.3 CHECK DAILY RATE

SELECT
    MIN(DailyRate) AS Minimum_DailyRate,
    MAX(DailyRate) AS Maximum_DailyRate,
    AVG(DailyRate) AS Average_DailyRate
FROM hr_employee_attrition;


SELECT *
FROM hr_employee_attrition
WHERE DailyRate < 0;


-- 5.4 CHECK TOTAL WORKING YEARS

SELECT
    MIN(TotalWorkingYears) AS Minimum_Working_Years,
    MAX(TotalWorkingYears) AS Maximum_Working_Years,
    AVG(TotalWorkingYears) AS Average_Working_Years
FROM hr_employee_attrition;


SELECT *
FROM hr_employee_attrition
WHERE TotalWorkingYears < 0;


-- 5.5 CHECK YEARS AT COMPANY

SELECT
    MIN(YearsAtCompany) AS Minimum_Years,
    MAX(YearsAtCompany) AS Maximum_Years,
    AVG(YearsAtCompany) AS Average_Years
FROM hr_employee_attrition;


SELECT *
FROM hr_employee_attrition
WHERE YearsAtCompany < 0;


-- ============================================
-- STEP 6 – BASIC DATA ANALYSIS
-- 6.1 TOTAL EMPLOYEES
-- ============================================

SELECT
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition;

-- 6.2 EMPLOYEES WHO LEFT

SELECT
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes';


-- 6.3 EMPLOYEES WHO STAYED

SELECT
    COUNT(*) AS Employees_Stayed
FROM hr_employee_attrition
WHERE Attrition = 'No';


-- 6.4 ATTRITION BY CATEGORY

SELECT
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Attrition;


-- 6.5 ATTRITION PERCENTAGE

SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
FROM hr_employee_attrition),2) AS Percentage
FROM hr_employee_attrition
GROUP BY Attrition;


-- 6.6 EMPLOYEES BY DEPARTMENT

SELECT
    Department,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Employee_Count DESC;


-- 6.7 DEPARTMENT-WISE ATTRITION

SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
    2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Attrition_Percentage DESC;


-- 6.8 EMPLOYEES BY JOB ROLE

SELECT
    JobRole,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Employee_Count DESC;


-- 6.9 JOB ROLE-WISE ATTRITION

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Percentage DESC;


-- 6.10 OVERTIME VS ATTRITION

SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY OverTime;


-- ============================================
-- STEP 7 – ADVANCED DATA ANALYSIS
-- 7.1 AGE GROUP-WISE ATTRITION
-- ============================================

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Age_Group
ORDER BY Attrition_Percentage DESC;


-- 7.2 GENDER-WISE ATTRITION

SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Gender;


-- 7.3 BUSINESS TRAVEL VS ATTRITION

SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY BusinessTravel
ORDER BY Attrition_Percentage DESC;


-- 7.4 JOB SATISFACTION VS ATTRITION

SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- 7.5 MARITAL STATUS VS ATTRITION

SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY MaritalStatus
ORDER BY Attrition_Percentage DESC;


-- 7.6 YEARS AT COMPANY VS ATTRITION

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 Years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE 'More than 10 Years'
    END AS Experience_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Experience_Group
ORDER BY Attrition_Percentage DESC;


-- 7.7 MONTHLY INCOME VS ATTRITION

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5000 THEN '3000-5000'
        WHEN MonthlyIncome BETWEEN 5001 AND 8000 THEN '5001-8000'
        ELSE 'Above 8000'
    END AS Income_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Income_Group
ORDER BY Attrition_Percentage DESC;


-- ============================================
-- STEP 8 – FINAL ANALYSIS
-- 8.1 AVERAGE MONTHLY INCOME BY ATTRITION
-- ============================================

SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM hr_employee_attrition
GROUP BY Attrition;


-- 8.2 AVERAGE AGE BY ATTRITION

SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(Age), 2) AS Average_Age
FROM hr_employee_attrition
GROUP BY Attrition;


-- 8.3 AVERAGE YEARS AT COMPANY BY ATTRITION

SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(YearsAtCompany), 2) AS Average_Years_At_Company
FROM hr_employee_attrition
GROUP BY Attrition;


-- 8.4 AVERAGE JOB SATISFACTION BY ATTRITION

SELECT
    Attrition,
    ROUND(AVG(JobSatisfaction), 2) AS Average_Job_Satisfaction
FROM hr_employee_attrition
GROUP BY Attrition;


-- 8.5 JOB LEVEL VS ATTRITION

SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY JobLevel
ORDER BY JobLevel;


-- 8.6 EDUCATION FIELD VS ATTRITION

SELECT
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY EducationField
ORDER BY Attrition_Percentage DESC;


-- ============================================
-- STEP 9 – FINAL PROJECT SUMMARY
-- ============================================

SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    SUM(CASE
        WHEN Attrition = 'No' THEN 1
        ELSE 0
    END) AS Employees_Stayed,
    ROUND(SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2) AS Overall_Attrition_Rate,
    ROUND(AVG(Age), 2) AS Average_Age,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income,
    ROUND(AVG(YearsAtCompany), 2) AS Average_Years_At_Company
FROM hr_employee_attrition;


-- ============================================
-- STEP 10 – KEY FINDINGS
-- 10.1 DEPARTMENT WITH HIGHEST ATTRITION
-- ============================================

SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Attrition_Percentage DESC
LIMIT 1;


-- 10.2 JOB ROLE WITH HIGHEST ATTRITION

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Percentage DESC
LIMIT 1;


-- 10.3 OVERTIME CATEGORY WITH HIGHEST ATTRITION

SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY OverTime
ORDER BY Attrition_Percentage DESC
LIMIT 1;


-- 10.4 AGE GROUP WITH HIGHEST ATTRITION

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Age_Group
ORDER BY Attrition_Percentage DESC
LIMIT 1;


-- 10.5 BUSINESS TRAVEL WITH HIGHEST ATTRITION

SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
2) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY BusinessTravel
ORDER BY Attrition_Percentage DESC
LIMIT 1;


