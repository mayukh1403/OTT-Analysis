-- Does login channel impact long-term usage?
WITH login_counts AS (
  SELECT 
    viewer_id,
    login_channel,
    COUNT(login_date) AS login_count
  FROM `ott.Logins`
  GROUP BY viewer_id, login_channel
),
avg_logins_per_channel AS (
  SELECT 
    login_channel,
    AVG(login_count) AS avg_login_count
  FROM login_counts
  GROUP BY login_channel
),
churn_status AS (
  SELECT 
    viewer_id,
    login_channel,
    MAX(login_date) AS last_login
  FROM `ott.Logins`
  GROUP BY viewer_id, login_channel
),
churned_users AS (
  SELECT 
    login_channel,
    COUNT(CASE WHEN last_login < DATE '2024-03-31' - INTERVAL 3 MONTH THEN 1 END) AS churned,
    COUNT(*) AS total_users
  FROM churn_status
  GROUP BY login_channel
),
churn_rate AS (
  SELECT 
    login_channel,
    (churned / total_users) * 100 AS churn_rate
  FROM churned_users
)
SELECT 
  a.login_channel,
  a.avg_login_count,
  c.churn_rate
FROM avg_logins_per_channel a
JOIN churn_rate c
ON a.login_channel = c.login_channel
