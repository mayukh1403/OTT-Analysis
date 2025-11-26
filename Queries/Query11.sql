-- Which signup cohorts (e.g., Jan 2023) have the worst retention?
WITH login_data AS (
  SELECT v.viewer_id,
         DATE_TRUNC(v.signup_date,MONTH) AS cohort_month,
         l.login_date,
         DATE_DIFF(l.login_date,v.signup_date,DAY) AS days_since_signup
  FROM `ott.Viewers` v
  JOIN `ott.Logins` l
  ON v.viewer_id = l.viewer_id 
),

retention_flags AS (
  SELECT viewer_id,
         cohort_month,
         MAX(CASE WHEN days_since_signup >= 30 THEN 1 ELSE 0 END) OVER (
          PARTITION BY viewer_id
         ) AS is_retained
  FROM login_data
),

cohort_retention AS (
  SELECT cohort_month,
         COUNT(DISTINCT viewer_id) AS total_users,
         COUNT(DISTINCT CASE WHEN is_retained =1 THEN viewer_id END) AS retained_users
  FROM retention_flags
  GROUP BY cohort_month
)

SELECT cohort_month,
       total_users,
       retained_users,
       (retained_users/total_users)*100 AS retention_rate
FROM cohort_retention
ORDER BY retention_rate ASC;
