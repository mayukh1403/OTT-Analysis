-- Which viewers have not logged in in the past 3 months?
SELECT viewer_id
FROM (
  SELECT viewer_id,
         MAX(login_date) AS last_login
  FROM `ott.Logins`
  GROUP BY viewer_id
) AS last_logins
WHERE last_login < '2024-03-31' - INTERVAL 3 MONTH;
