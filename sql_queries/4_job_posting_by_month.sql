SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(CASE WHEN job_country = 'United Kingdom' THEN job_id END) AS number_of_postings_UK
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
AND EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY month
ORDER BY month;


/*
    Analysis of which months have the most data analysis job postings in the UK (2023)
- January stands out as the month with the highest amount of job postings, likely due to companies hiring for the new year.
- There is a sharp increase in the number of job postings in September and October, possibly influenced by organisational needs for Q4 and also an intake of graduates.


******************RESULTS***********************
[
  {
    "month": "1",
    "number_of_postings_uk": "1483"
  },
  {
    "month": "2",
    "number_of_postings_uk": "1047"
  },
  {
    "month": "3",
    "number_of_postings_uk": "717"
  },
  {
    "month": "4",
    "number_of_postings_uk": "558"
  },
  {
    "month": "5",
    "number_of_postings_uk": "612"
  },
  {
    "month": "6",
    "number_of_postings_uk": "731"
  },
  {
    "month": "7",
    "number_of_postings_uk": "899"
  },
  {
    "month": "8",
    "number_of_postings_uk": "617"
  },
  {
    "month": "9",
    "number_of_postings_uk": "1111"
  },
  {
    "month": "10",
    "number_of_postings_uk": "1174"
  },
  {
    "month": "11",
    "number_of_postings_uk": "838"
  },
  {
    "month": "12",
    "number_of_postings_uk": "708"
  }
]
*/