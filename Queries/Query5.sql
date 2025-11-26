-- How does average session duration vary by age group?
SELECT v.age_group,
       AVG(s.session_duration) AS Avg_Session_Duration
FROM `ott.Viewers` v
JOIN `ott.Sessions` s 
ON v.viewer_id = s.viewer_id
GROUP BY v.age_group
ORDER BY v.age_group;
