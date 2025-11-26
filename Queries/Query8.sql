-- What's the average time between a user’s signup and last login (by segment)?
SELECT v.age_group,
       AVG(d.Diff_Time) AS Total_Time
FROM `ott.Viewers` v
JOIN (
  SELECT l.viewer_id,
         DATE_DIFF(MAX(l.login_date), v.signup_date, DAY) AS Diff_Time
  FROM `ott.Logins` l
  JOIN `ott.Viewers` v 
  ON l.viewer_id = v.viewer_id
  GROUP BY l.viewer_id, v.signup_date
) AS d
ON v.viewer_id = d.viewer_id
GROUP BY age_group
ORDER BY age_group;
