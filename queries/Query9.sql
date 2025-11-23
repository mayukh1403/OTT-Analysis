-- Are session errors linked to churn?
WITH last_logins AS (
  SELECT 
    viewer_id,
    MAX(login_date) AS last_login
  FROM `ott.Logins`
  GROUP BY viewer_id
),

churned_sessions AS (
  SELECT s.viewer_id, s.is_successful
  FROM last_logins l
  JOIN `ott.Sessions` s ON l.viewer_id = s.viewer_id
  WHERE l.last_login < DATE '2024-03-31' - INTERVAL 3 MONTH
),

active_sessions AS (
  SELECT s.viewer_id, s.is_successful
  FROM last_logins l
  JOIN `ott.Sessions` s ON l.viewer_id = s.viewer_id
  WHERE l.last_login >= DATE '2024-03-31' - INTERVAL 3 MONTH
),

churned_stats AS (
  SELECT 
    SUM(CASE WHEN is_successful = FALSE THEN 1 ELSE 0 END), COUNT(*) * 100 AS churned_percent
  FROM churned_sessions
),

active_stats AS (
  SELECT 
    SUM(CASE WHEN is_successful = FALSE THEN 1 ELSE 0 END), COUNT(*) * 100 AS active_percent
  FROM active_sessions
)

SELECT 
  c.churned_percent,
  a.active_percent,
  CASE 
    WHEN c.churned_percent > a.active_percent THEN 'YES'
    ELSE 'NO'
  END AS failure_rate
FROM churned_stats c, active_stats a;
