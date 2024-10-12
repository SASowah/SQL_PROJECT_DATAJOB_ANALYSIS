/*
TASK: Find what skills are required for the top-paying Data Analyst jobs?
-Find the top 10 highest-paying Data Analyst jobs(Use the first query)
-Find the specific skills required for these roles.
-Reason?This is to provide a detailed look at which high paying jobs remand certain skills,
helping job seekers understabnd which skills to devolp to align with top salaries.
*/


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
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*The top 10 most frequently mentioned skills for Data Analyst roles in 2023 which is based on job postings
dataset are:
SQL – 8 mentions
Python – 7 mentions
Tableau – 6 mentions
R – 4 mentions
Snowflake – 3 mentions
Pandas – 3 mentions
Excel – 3 mentions
Azure – 2 mentions
Bitbucket – 2 mentions
Go – 2 mentions
*/