/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employee options and location flexibility.
*/

SELECT 
      job.job_id,
      job.job_title,
      job.job_location,
      job.job_schedule_type,
      job.salary_year_avg,
      job.job_posted_date,
      job.company_id as company_id,
      company.name as company_name
FROM 
      job_postings_fact as job
LEFT JOIN company_dim as company
ON job.company_id = company.company_id
WHERE 
      job_title_short = 'Data Analyst' AND
      job_location = 'Anywhere' AND
      salary_year_avg IS NOT NULL
ORDER BY 
      salary_year_avg DESC
LIMIT 10;