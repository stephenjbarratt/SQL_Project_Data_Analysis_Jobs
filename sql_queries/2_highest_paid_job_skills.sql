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


/*
Analysis of the skills used in the highest paid data analysis jobs in the UK (2023)
- Excel and Python lead the way with 5 of the jobs using these fundamential skills.
- Tableau and SQL follow with 3 of the jobs using these skills.
******************RESULTS***********************
    [
  {
    "job_id": 1401033,
    "job_title": "Market Data Lead Analyst",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-11-10 08:32:22",
    "company_name": "Deutsche Bank",
    "skills": "excel"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "shell"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "express"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "excel"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell",
    "skills": "flow"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "sql"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "python"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "jupyter"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "tableau"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "power bi"
  },
  {
    "job_id": 694461,
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-22 08:12:30",
    "company_name": "Hasbro",
    "skills": "looker"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group",
    "skills": "sql"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group",
    "skills": "python"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group",
    "skills": "sas"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group",
    "skills": "excel"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group",
    "skills": "tableau"
  },
  {
    "job_id": 377642,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "job_posted_date": "2023-11-11 23:13:05",
    "company_name": "esure Group",
    "skills": "sas"
  },
  {
    "job_id": 1315562,
    "job_title": "Project Data Analyst - Operational Excellence",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 12:16:00",
    "company_name": "Syngenta Group",
    "skills": "tableau"
  },
  {
    "job_id": 150907,
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-02-06 19:17:32",
    "company_name": "Flagship Pioneering, Inc.",
    "skills": "python"
  },
  {
    "job_id": 150907,
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-02-06 19:17:32",
    "company_name": "Flagship Pioneering, Inc.",
    "skills": "go"
  },
  {
    "job_id": 150907,
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-02-06 19:17:32",
    "company_name": "Flagship Pioneering, Inc.",
    "skills": "jupyter"
  },
  {
    "job_id": 150907,
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-02-06 19:17:32",
    "company_name": "Flagship Pioneering, Inc.",
    "skills": "git"
  },
  {
    "job_id": 150907,
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-02-06 19:17:32",
    "company_name": "Flagship Pioneering, Inc.",
    "skills": "unify"
  },
  {
    "job_id": 985232,
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "job_posted_date": "2023-12-15 22:13:28",
    "company_name": "Campari Group",
    "skills": "python"
  },
  {
    "job_id": 985232,
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "job_posted_date": "2023-12-15 22:13:28",
    "company_name": "Campari Group",
    "skills": "r"
  },
  {
    "job_id": 985232,
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "job_posted_date": "2023-12-15 22:13:28",
    "company_name": "Campari Group",
    "skills": "azure"
  },
  {
    "job_id": 985232,
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "job_posted_date": "2023-12-15 22:13:28",
    "company_name": "Campari Group",
    "skills": "databricks"
  },
  {
    "job_id": 985232,
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "job_posted_date": "2023-12-15 22:13:28",
    "company_name": "Campari Group",
    "skills": "sap"
  },
  {
    "job_id": 227038,
    "job_title": "Data Analyst",
    "salary_year_avg": "77017.5",
    "job_posted_date": "2023-12-11 07:47:42",
    "company_name": "Nominet",
    "skills": "sql"
  },
  {
    "job_id": 227038,
    "job_title": "Data Analyst",
    "salary_year_avg": "77017.5",
    "job_posted_date": "2023-12-11 07:47:42",
    "company_name": "Nominet",
    "skills": "python"
  },
  {
    "job_id": 227038,
    "job_title": "Data Analyst",
    "salary_year_avg": "77017.5",
    "job_posted_date": "2023-12-11 07:47:42",
    "company_name": "Nominet",
    "skills": "r"
  },
  {
    "job_id": 1059513,
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-05 15:13:29",
    "company_name": "Informa Group Plc.",
    "skills": "typescript"
  },
  {
    "job_id": 1059513,
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-05 15:13:29",
    "company_name": "Informa Group Plc.",
    "skills": "vba"
  },
  {
    "job_id": 1059513,
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-05 15:13:29",
    "company_name": "Informa Group Plc.",
    "skills": "excel"
  },
  {
    "job_id": 1059513,
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-05 15:13:29",
    "company_name": "Informa Group Plc.",
    "skills": "power bi"
  },
  {
    "job_id": 1059513,
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-05 15:13:29",
    "company_name": "Informa Group Plc.",
    "skills": "notion"
  },
  {
    "job_id": 453109,
    "job_title": "Global Mobility Data Analyst",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-20 12:12:25",
    "company_name": "CHANEL",
    "skills": "excel"
  }
]
*/