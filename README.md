 # Introduction
📊 Explore the dynamic data job market(data as of 2023)! This project delves into data analyst roles, highlighting 💰 the highest-paying positions, 🔥 the most sought-after skills, and 📈 the sweet spot where high demand and top salaries intersect in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Motivated by the goal of navigating the data analyst job market more efficiently, this project was created to identify the highest-paying and most sought-after skills, simplifying the job search process for others to find the best opportunities.

Data hails from Lukebarousse SQL Course. It's packed with insights on job titles, salaries, locations, and essential skills.

The questions I wanted to answer through my SQL queries were:
### 1. What are the top-paying data analyst jobs?
### 2. What skills are required for these top-paying jobs?
### 3. What skills are most in demand for data analysts?
### 4. Which skills are associated with higher salaries?
### 5. What are the most optimal skills to learn?

# Tools I Used

For my in-depth exploration of the data analyst job market, I leveraged the capabilities of several essential tools:

- SQL: The core of my analysis, enabling me to query the database and uncover key insights
- PostgreSQL: The selected database management system, perfectly suited for managing and processing the job posting data.
- Visual Studio Code: My trusted tool for managing databases and executing SQL queries efficiently.
- Git & GitHub: Crucial for version control and sharing SQL scripts and analyses, facilitating collaboration and maintaining project tracking.

# The Analysis

Each query in this project was designed to explore specific facets of the data analyst job market. Here's the approach I took for each question:

### 1. Top Paying Data Analyst Jobs
To pinpoint the highest-paying roles, I filtered data analyst positions by average annual salary and location, with an emphasis on remote jobs. This query reveals the top-paying opportunities in the industry.

``` sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:

- Wide Salary Range:   The top 10 highest-paying data analyst roles range from $184,000 to $650,000, showcasing the substantial earning potential within the field.
- Diverse Employers: Companies such as SmartAsset, Meta, and AT&T are among those offering high salaries, demonstrating a wide-ranging interest in data analysts across various industries.
- Job Title Variety: The wide range of job titles, from Data Analyst to Director of Analytics, highlights the diverse roles and specializations within the field of data analytics.

### 2. Skills for Top Paying Jobs

To determine the skills needed for the top-paying jobs, I linked job postings with skills data, offering insights into what employers prioritize for high-compensation roles.

``` sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
Here’s a summary of the most sought-after skills for the top 10 highest-paying data analyst jobs in 2023:

- SQL leads with a notable count of 8, followed closely by Python with a count of 7. Tableau is also in high demand, with a count of 6. Other skills, such as R, Snowflake, Pandas, and Excel, exhibit varying levels of demand.


### 3. In-Demand Skills for Data Analysts

This query highlighted the skills most frequently requested in job postings, directing attention to areas with the highest demand.

``` sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Here's the breakdown of the most demanded skills for data analysts in 2023

- SQL and Excel continue to be essential, underscoring the importance of strong foundational skills in data processing and spreadsheet management.
- Programming and visualization tools such as Python, Tableau, and Power BI are crucial, highlighting the growing significance of technical skills in data storytelling and decision support.

Skills	Demand Count
SQL	7291
Excel	4611
Python	4330
Tableau	3745
Power BI	2609

Table of the demand for the top 5 skills in data analyst job postings

### 4. Skills Based on Salary

Analyzing the average salaries associated with different skills uncovered which skills command the highest pay.

``` sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
Here's a breakdown of the results for top paying skills for Data Analysts:

- High Demand for Big Data & ML Skills:  
                   Top salaries are commanded by analysts proficient in big data technologies (such as PySpark and Couchbase), machine learning tools (like DataRobot and Jupyter), and Python libraries (including Pandas and NumPy). This reflects the industry's high valuation of expertise in data processing and predictive modeling.
- Software Development & Deployment Proficiency: 
                   Expertise in development and deployment tools (such as GitLab, Kubernetes, and Airflow) highlights a lucrative crossover between data analysis and engineering, with a premium placed on skills that enable automation and efficient data pipeline management.

- Cloud Computing Expertise:
                   Proficiency with cloud and data engineering tools (such as Elasticsearch, Databricks, and GCP) emphasizes the increasing importance of cloud-based analytics environments, indicating that expertise in cloud technologies can substantially enhance earning potential in data analytics.

Skills	Average Salary ($)
pyspark	208,172
bitbucket	189,155
couchbase	160,515
watson	160,515
datarobot	155,486
gitlab	154,500
swift	153,750
jupyter	152,777
pandas	151,821
elasticsearch	145,000

Table of the average salary for the top 10 paying skills for data analysts

### 5. Most Optimal Skills to Learn


By combining insights from demand and salary data, this query sought to identify skills that are both highly sought after and well-compensated, providing a strategic focus for skill development.

``` sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

Skill ID	Skills	Demand Count	Average Salary ($)
8	go	27	115,320
234	confluence	11	114,210
97	hadoop	22	113,193
80	snowflake	37	112,948
74	azure	34	111,225
77	bigquery	13	109,654
76	aws	32	108,317
4	java	17	106,906
194	ssis	12	106,683
233	jira	20	104,918

Table of the most optimal skills for data analyst sorted by salary

Here's a breakdown of the most optimal skills for Data Analysts in 2023:

- High-Demand Programming Languages: 
                    Python and R stand out due to their high demand, with demand counts of 236 and 148, respectively. Despite their strong demand, the average salaries are approximately $101,397 for Python and $100,499 for R. This suggests that while proficiency in these languages is highly valued, they are also widely used.
- Cloud Tools and Technologies: 
                    Skills in specialized technologies like Snowflake, Azure, AWS, and BigQuery exhibit significant demand and relatively high average salaries, highlighting the increasing importance of cloud platforms and big data technologies in data analysis.
- Business Intelligence and Visualization Tools: 
                    Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries of approximately $99,288 and $103,795, underscore the crucial role of data visualization and business intelligence in extracting actionable insights from data.
- Database Technologies: 
                    The demand for skills in both traditional and NoSQL databases (such as Oracle, SQL Server, and NoSQL), with average salaries ranging from $97,786 to $104,534, reflects the ongoing need for expertise in data storage, retrieval, and management.



# Conclusions

### Insights

From the analysis, several general insights emerged:

- Top-Paying Data Analyst Jobs: 
                        The highest-paying remote data analyst jobs offer a broad salary range, with the top positions reaching up to $650,000!
- Skills for Top-Paying Jobs: 
                        High-paying data analyst roles demand advanced proficiency in SQL, indicating that it is a crucial skill for achieving top salaries.
- Most In-Demand Skills: 
                       SQL is also the most sought-after skill in the data analyst job market, making it essential for job seekers.
- Skills with Higher Salaries: 
                       Specialized skills, such as SVN and Solidity, are linked to the highest average salaries, highlighting the premium placed on niche expertise.
- Optimal Skills for Job Market Value:
                        SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project provided valuable insights into the data analyst job market. The findings guide skill development and job search strategies, helping aspiring data analysts position themselves effectively in a competitive field. It underscores the importance of continuous learning and staying adaptable to emerging trends in data analytics.