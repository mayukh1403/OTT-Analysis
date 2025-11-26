-- How many users dropped off after their first login?
SELECT COUNT(viewer_id) AS Churn_Count
FROM (
  SELECT viewer_id
  FROM `ott.Logins`
  GROUP BY viewer_id
  HAVING COUNT(login_date) = 1
);
