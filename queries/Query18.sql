-- Do returning viewers spend more time than new viewers?
WITH session_counts AS (
  SELECT viewer_id,
         COUNT(session_id) AS total_sessions,
         AVG(session_duration) AS avg_session_duration
  FROM ott.Sessions
  GROUP BY viewer_id
),

viewer_type AS (
  SELECT viewer_id,
         CASE WHEN total_sessions = 1 THEN 'New'
              ELSE 'Returning'
         END AS viewer_status,
         avg_session_duration
  FROM session_counts
)

SELECT viewer_status,
       COUNT(*) AS viewer_count,
       ROUND(AVG(avg_session_duration), 2) AS avg_session_duration
FROM viewer_type
GROUP BY viewer_status;
