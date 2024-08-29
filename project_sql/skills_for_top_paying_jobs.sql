/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_jobs AS 
(
SELECT 
      job.job_id as job_id,
      job.job_title as job_title,
      job.job_location as job_location,
      job.job_schedule_type as schedule_type,
      job.salary_year_avg as average_yearly_salary,
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
LIMIT 10
)

SELECT 
      top_jobs.*,
      skills_dim.skills
FROM
      top_jobs
INNER JOIN skills_job_dim
ON    top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY top_jobs.average_yearly_salary DESC;

/* here are the results of the query saved in json format
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "189000.0",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "schedule_type": "Full-time",
    "average_yearly_salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]
*/
