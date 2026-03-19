-- Highest paid jobs in the United Kingdom
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
LIMIT 10

/*
Analysis of results of the Top 10 Highest Paid Data Analytics jobs in the UK (2023)
- Salary Range: Yearly Salaries range from £180,000 to £132,500 with top employers being large banks and corperations such as Deutsche Bank and Shell
- Location: Majority of the highest paid jobs are located in London. Only one of the top 10 was remote working.
- Job title: A job that appeared the most was Data Architect with 4 of the 10 employed in this particular role.


******************RESULTS***********************

[
  {
    "job_id": 1401033,
    "job_title": "Market Data Lead Analyst",
    "job_country": "United Kingdom",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-11-10 08:32:22",
    "company_name": "Deutsche Bank"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_country": "United Kingdom",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "job_country": "United Kingdom",
    "job_location": "Bristol, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-02-13 16:32:46",
    "company_name": "AND Digital"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_country": "United Kingdom",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "company_name": "Plexus Resource Solutions"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "job_country": "United Kingdom",
    "job_location": "Cambridge, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-17 12:17:54",
    "company_name": "Darktrace"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "job_country": "United Kingdom",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin"
  },
  {
    "job_id": 1813715,
    "job_title": "Data Architect - Trading and Supply",
    "job_country": "United Kingdom",
    "job_location": "United Kingdom",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "156500.0",
    "job_posted_date": "2023-11-08 19:33:50",
    "company_name": "Shell"
  },
  {
    "job_id": 585859,
    "job_title": "Research Scientist, Science",
    "job_country": "United Kingdom",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "149653.0",
    "job_posted_date": "2023-06-29 19:18:22",
    "company_name": "DeepMind"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "job_country": "United Kingdom",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "139216.0",
    "job_posted_date": "2023-04-21 10:38:48",
    "company_name": "AccorCorpo"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "job_country": "United Kingdom",
    "job_location": "Manchester, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-04-01 12:20:22",
    "company_name": "AJ Bell"
  }
]


*/