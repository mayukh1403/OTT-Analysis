-- Do promotion-acquired viewers watch more than organic ones?
WITH viewer_source AS (
  SELECT viewer_id,'Promotion' AS acquisition_type
  FROM `ott.promotions`
  
  UNION DISTINCT

  SELECT viewer_id,'Organic' AS acquisition_type
  FROM `ott.Viewers`
  WHERE viewer_id NOT IN (SELECT viewer_id FROM `ott.promotions`)
),
watch_counts AS (
  SELECT v.viewer_id, v.acquisition_type,
         COUNT(s.session_id) AS total_sessions
  FROM viewer_source v
  JOIN `ott.Sessions` s 
  ON v.viewer_id = s.viewer_id
  GROUP BY v.viewer_id, v.acquisition_type
)

SELECT acquisition_type,
       ROUND(AVG(total_sessions), 2) AS avg_sessions
FROM watch_counts
GROUP BY acquisition_type;
