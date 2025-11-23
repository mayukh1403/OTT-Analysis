-- Peak login days across regions
SELECT v.country,
       FORMAT_DATE('%A', l.login_date) AS day_of_week,
       COUNT(*) AS logins
FROM ott.Logins l
JOIN ott.Viewers v ON l.viewer_id = v.viewer_id
GROUP BY v.country, day_of_week
ORDER BY v.country, logins DESC;
