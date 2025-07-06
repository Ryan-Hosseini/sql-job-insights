
# 🧠 Job Postings Insights Project (SQL Portfolio)

This project explores real-world job postings data scraped from Indeed, focusing on data roles and trends. I used SQL to clean, analyze, and extract meaningful business insights — perfect for showcasing analytical thinking and database querying skills.

---

## 📌 Project Goals

- Clean and prepare job listing data
- Analyze job titles, locations, and salary trends
- Identify skill demand (Python, SQL, Excel, etc.)
- Understand which companies are hiring and how they're rated

---

## 🛠 Tools Used

- SQLite (via DB Browser)
- SQL (CTE, COUNT, GROUP BY, ORDER BY, LIKE, etc.)
- DB Browser for SQL execution and result screenshots

---

## 📂 Dataset

The dataset contains over **1000+ job postings**, including:

- Job titles
- Company names
- Ratings and reviews
- Locations
- Salary estimates
- Full job descriptions

---

## 🔍 Key Insights

### 💼 Top Hiring Companies
- Optum, Citi, CVS Health, JPMorgan Chase & Co. were among the most active.

### 🌟 Best-Rated Companies (Min. 5 postings)
- Grow Therapy, Latitude, and Atlassian lead in average ratings.

### 📊 Skill Demand
- **Python**: 61 jobs  
- **SQL**: 90 jobs  
- **Excel**: 677 jobs  
- **Remote roles**: 488 postings

---

## 📸 Sample Queries

```sql
-- Count Remote Jobs
SELECT COUNT(*) AS remote_jobs
FROM indeed_job_Postings
WHERE LOWER(description_text) LIKE '%remote%';
```

```sql
-- Top-Rated Companies (Min 5 listings)
SELECT company_name, ROUND(AVG(company_rating), 2) AS avg_rating
FROM indeed_job_Postings
WHERE company_rating IS NOT NULL
GROUP BY company_name
HAVING COUNT(*) >= 5
ORDER BY avg_rating DESC
LIMIT 10;
```

---

## 📈 Screenshots

All executed queries and results are included in the `/screenshots` folder.

---

## 📢 Contact

Feel free to connect with me on [LinkedIn](www.linkedin.com/in/ryan-hosseini-6a1545287)  
Or message me if you have questions!
