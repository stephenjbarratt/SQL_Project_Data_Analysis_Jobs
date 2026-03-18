# Project Researching Data Analysis Jobs

# Introduction
📊 Exploring the global and UK data job market, this project focuses on Data Analytics roles featuring: 💰 Highest paid jobs, 🔥 in-demand skills, 📈 skills related to higher salaries and 📅 when job listings are most frequent.

🔍 SQL queries? Check them out here: ADD HYPERLINK TO QUERY

# Background
My aim for this project is to provide myself and others with an insight into the global and UK Data Analysis job market.

The project contains data on job postings for data roles in 2023, with insights on job titles, locations, salaries, skills and other employment related information. The data itself comes from Luke Barousse's SQL Course.

The questions I wanted to answer through my SQL queries were:
1. What are the highest paid data analyst jobs?
2. What skills are required for these highest paid jobs?
3. What are the most in demand skills for data analysts?
4. When are data analysis job postings most frequent?


# Tools I Used
To explore the Data Analysis job market I used several tools:
* SQL: The backbone of my analysis, allowing me to query the database and find critical insights.
* PostgreSQL: The chosen database management system, ideal for handling the job posting data.
* Visual Studio Code: My go to for database management and executing SQL queries.
* Git & GitHub: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
* Excel: For storytelling the data through charts.


# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

# 1. Highest Paid Data Analyst Jobs
To identify the highest paid jobs, I filtered data analyst positions by averaging yearly salary and location, focusing on jobs in the United Kingdom.
``` SQL
SELECT
    job_id,
    job_title,
    job_country,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'United Kingdom' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT

```

Analysis of results of the Top 10 Highest Paid Data Analytics jobs in the UK (2023):
- Wide Salary Range: Yearly Salaries range from £180,000 to £132,500 with top employers being large banks and corperations such as Deutsche Bank and Shell
- Location: Majority of the highest paid jobs are located in London. Only one of the top 10 was remote working.
- Job title: A job that appeared the most was Data Architect with 4 of the 10 employed in this particular role.

# 2. Skills for highest paid jobs
Next let's take it a step further from the highest paying roles from the last query and now find the most commonly used skills associated with these roles. By knowing these skills, it will help to identify what skills to develop to achieve these higher paid roles. I used the following query to get this information.

``` SQL
WITH highest_paid_jobs AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'United Kingdom' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)
SELECT 
highest_paid_jobs.*,
skills
FROM highest_paid_jobs
INNER JOIN skills_job_dim ON highest_paid_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```

