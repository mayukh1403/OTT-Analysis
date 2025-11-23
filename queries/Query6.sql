-- How does average session duration vary by region?
SELECT v.country,
       AVG(s.session_duration) AS Avg_Session_Duration
FROM `ott.Viewers` v
JOIN `ott.Sessions` s ON v.viewer_id = s.viewer_id
GROUP BY v.country
ORDER BY Avg_Session_Duration;
