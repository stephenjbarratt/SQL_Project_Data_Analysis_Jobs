# Project Researching Data Analysis Jobs

# Introduction
📊 Exploring the global and UK data job market, this project focuses on Data Analytics roles featuring: 💰 Highest paid jobs, 🔥 in-demand skills, 📈 skills related to higher salaries and 📅 when job listings are most frequent.

🔍 SQL queries? Check them out here: [sql_queries]()

# Background
My aim for this project is to provide myself and others with an insight into the global and UK Data Analysis job market.

The project contains data on job postings for data roles in 2023, with insights on job titles, locations, salaries, skills and other employment related information. The data itself comes from Luke Barousse's [SQL Course](https://www.lukebarousse.com/sql).

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

## 1. Highest Paid Data Analyst Jobs
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


![image alt](https://github.com/stephenjbarratt/SQL_Project_Data_Analysis_Jobs/blob/971215a98e3de15d682d3209487c35e667ef3939/Charts/Bar%20Graph.png)


*Bar Graph Visualising the Top 10 Highest Paid Data Analyst Jobs in the Uk in 2023*
## 2. Skills for highest paid jobs
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

## 3. In Demand Skills for Data Analysis
The next query helped to identify the skills with the highest demand, according to job postings in the United Kingdom (2023).

``` SQL
SELECT
skills,
COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postingS_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'United Kingdom'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5
```

Analysis of results of the 5 most in demand skills for data analysis in the UK (2023)
- SQL (4480) and Excel (4281) are first and second respecively, emphasising the need for foundational skills in data processing and spreadsheet manipulation.
- Programming and Visualisation tools such as Python, Power BI and Tableau are also important, showing the need for technical skills to carry out data storytelling.

## 4. Months with the highest job postings
The following query shows the months of the year where job postings for data analysis jobs are at there highest and lowest, helping job seekers effectively time appliactions.
``` SQL
SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(CASE WHEN job_country = 'United Kingdom' THEN job_id END) AS number_of_postings_UK
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
AND EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY month
ORDER BY month;
```
Analysis of which months have the most data analysis job postings in the UK (2023)
- January stands out as the month with the highest amount of job postings, likely due to companies hiring for the new year.
- There is a sharp increase in the number of job postings in September and October, possibly influenced by organisational needs for Q4 and also an intake of graduates.

# Troubleshooting

# What I Learnt
Throughout this project I have developed a number of skills and techniques to improve my SQL knowledge and ability:
- 🧩 Complex Queries: Mastering complex SQL, by merging tables using JOIN and WITH clauses for Common Table Expressions.
- 📊 Data Aggregation: Used commands such as GROUP BY and aggregate functions like COUNT() and AVG().
- 💡 Analytical Skills - Transformed questions into actonable SQL queries, levelling up my real world problem solving skills.
  
# Conclusion
