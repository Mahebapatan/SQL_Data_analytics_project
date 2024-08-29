/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

-- two ways for the above query 

-- option1: 

WITH remote_jobs as 
(
    SELECT skill_job.skill_id as id, count(*) as skill_count
FROM skills_job_dim as skill_job
INNER JOIN job_postings_fact as job 
ON skill_job.job_id = job.job_id
WHERE job.job_work_from_home = 'TRUE' AND job_title_short = 'Data Analyst'
GROUP BY id) 

SELECT remote_jobs.id, remote_jobs.skill_count, skill.skills
FROM remote_jobs 
INNER JOIN skills_dim as skill
ON remote_jobs.id = skill.skill_id
ORDER BY remote_jobs.skill_count DESC
LIMIT 5;

--option 2:

SELECT skills, count(skills_job_dim.job_id) as demand_count,
       count(job.job_id) as count
FROM 
       job_postings_fact as job
INNER JOIN skills_job_dim
ON    job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON    skills_job_dim.skill_id = skills_dim.skill_id
WHERE job.job_title_short = 'Data Analyst' 
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5
