-- What's the MAU (Monthly Active Users) trend?
SELECT FORMAT_DATE('%Y-%m', login_date) AS Month,
       COUNT(DISTINCT viewer_id) AS Monthly_Active_Users
FROM `ott.Logins`
GROUP BY Month
ORDER BY Month;
