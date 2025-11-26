-- Which promotions correlate with smooth technical experiences?
WITH promo_sessions AS (
  SELECT p.promo_type,
         s.is_successful
  FROM `ott.promotions` p
  JOIN `ott.Sessions` s
  ON p.viewer_id = s.viewer_id
)

SELECT promo_type,
       COUNT(*) AS total_sessions,
       SUM(CASE WHEN is_successful = TRUE THEN 1 ELSE 0 END) AS successful_sessions,
       ROUND(SUM(CASE WHEN is_successful = TRUE THEN 1 ELSE 0 END)/COUNT(*)* 100, 2) AS success_rate
FROM promo_sessions
GROUP BY promo_type
ORDER BY success_rate DESC;
