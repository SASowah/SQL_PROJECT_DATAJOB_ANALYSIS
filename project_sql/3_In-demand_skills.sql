/*
Task: Fine the most in-demand skills for Data Analyst roles.
- Join jop postings to inner tables similar to query2
-Identify the top 5 in-demand skills for a Data Analyst role.
-Concentrate on all job postings
-Reason:Retrieves the top 5 skills with the highest deman in the job market.
-Insignts into the most valuable skills for job seekers.
*/

SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills   
ORDER BY
    demand_count DESC
LIMIT 5
