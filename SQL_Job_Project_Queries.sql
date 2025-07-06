
-- 🔹 STEP 1: Preview Data
SELECT * 
FROM indeed_job_Postings
LIMIT 10;

-- 🔹 STEP 2: Table Info
PRAGMA table_info(indeed_job_Postings);

-- 🔹 STEP 3: Count Total Rows
SELECT COUNT(*) AS total_jobs
FROM indeed_job_Postings;

-- 🔹 STEP 4: Check for NULLs in Key Columns
SELECT 
  SUM(CASE WHEN job_title IS NULL THEN 1 ELSE 0 END) AS missing_job_titles,
  SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS missing_locations,
  SUM(CASE WHEN salary_formatted IS NULL THEN 1 ELSE 0 END) AS missing_salaries
FROM indeed_job_Postings;

-- 🔹 STEP 5: Job Demand - Top 10 Job Titles
SELECT job_title, COUNT(*) AS job_count
FROM indeed_job_Postings
GROUP BY job_title
ORDER BY job_count DESC
LIMIT 10;

-- 🔹 STEP 6: Job Demand - Top 10 Locations
SELECT location, COUNT(*) AS job_count
FROM indeed_job_Postings
GROUP BY location
ORDER BY job_count DESC
LIMIT 10;

-- 🔹 STEP 7: Job Types Overview
SELECT job_type, COUNT(*) AS count
FROM indeed_job_Postings
GROUP BY job_type
ORDER BY count DESC;

-- 🔹 STEP 8: Salary Preview
SELECT DISTINCT salary_formatted
FROM indeed_job_Postings
LIMIT 20;

-- 🔹 STEP 9: Extract Minimum Salary (Yearly Jobs Only)
SELECT 
  salary_formatted,
  CAST(REPLACE(SUBSTR(salary_formatted, 2, INSTR(salary_formatted, '-') - 2), ',', '') AS INTEGER) AS min_salary
FROM indeed_job_Postings
WHERE salary_formatted LIKE '%year%';

-- 🔹 STEP 10: Average Min Salary
SELECT 
  ROUND(AVG(CAST(REPLACE(SUBSTR(salary_formatted, 2, INSTR(salary_formatted, '-') - 2), ',', '') AS INTEGER))) AS avg_min_salary
FROM indeed_job_Postings
WHERE salary_formatted LIKE '%year%';

-- 🔹 STEP 11: Skill Search - Python, SQL, Excel, Remote, Communication, ML
SELECT
  COUNT(CASE WHEN LOWER(description_text) LIKE '%python%' THEN 1 END) AS python_jobs,
  COUNT(CASE WHEN LOWER(description_text) LIKE '%sql%' THEN 1 END) AS sql_jobs,
  COUNT(CASE WHEN LOWER(description_text) LIKE '%excel%' THEN 1 END) AS excel_jobs,
  COUNT(CASE WHEN LOWER(description_text) LIKE '%remote%' THEN 1 END) AS remote_jobs,
  COUNT(CASE WHEN LOWER(description_text) LIKE '%communication%' THEN 1 END) AS communication_jobs,
  COUNT(CASE WHEN LOWER(description_text) LIKE '%machine learning%' THEN 1 END) AS ml_jobs
FROM indeed_job_Postings;

-- 🔹 STEP 12: Top Hiring Companies
SELECT company_name, COUNT(*) AS postings
FROM indeed_job_Postings
GROUP BY company_name
ORDER BY postings DESC
LIMIT 10;

-- 🔹 STEP 13: Top-Rated Companies (Min 5 Postings)
SELECT company_name, ROUND(AVG(company_rating), 2) AS avg_rating, COUNT(*) AS total_postings
FROM indeed_job_Postings
WHERE company_rating IS NOT NULL
GROUP BY company_name
HAVING COUNT(*) >= 5
ORDER BY avg_rating DESC
LIMIT 10;
