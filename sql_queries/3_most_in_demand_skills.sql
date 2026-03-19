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

/*
Analysis of results of the 5 most in demand skills for data analysis in the UK (2023)
- SQL (4480) and Excel (4281) are first and second respecively, emphasising the need for foundational skills in data processing and spreadsheet manipulation.
- Programming and Visualisation tools such as Python, Power BI and Tableau are also important, showing the need for technical skills to carry out data storytelling.


******************RESULTS***********************

[
  {
    "skills": "sql",
    "demand_count": "4480"
  },
  {
    "skills": "excel",
    "demand_count": "4281"
  },
  {
    "skills": "power bi",
    "demand_count": "2865"
  },
  {
    "skills": "python",
    "demand_count": "2129"
  },
  {
    "skills": "tableau",
    "demand_count": "1644"
  }
]
*/