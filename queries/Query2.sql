-- What's the DAU (Daily Active Users) trend?
SELECT login_date,
       COUNT(DISTINCT viewer_id) AS Daily_Active_Users
FROM `ott.Logins`
GROUP BY login_date
ORDER BY login_date;
