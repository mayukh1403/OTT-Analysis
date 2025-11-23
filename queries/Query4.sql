-- Who watches content at least 3 times a week?
SELECT viewer_id,
       EXTRACT(YEAR FROM login_date) AS login_year,
       EXTRACT(WEEK FROM login_date) AS login_week,
       COUNT(DISTINCT login_date) AS login_days
FROM `ott.Logins`
GROUP BY viewer_id, login_year, login_week
HAVING login_days >= 3;
