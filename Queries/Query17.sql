-- Are some regions showing a steep engagement decline?
WITH login_with_country AS (
  SELECT v.country,
         l.viewer_id,
         l.login_date
  FROM ott.Logins l
  JOIN ott.Viewers v 
  ON l.viewer_id = v.viewer_id
),

monthly_engagement AS (
  SELECT country,
         FORMAT_DATE('%Y-%m', login_date) AS login_month,
         COUNT(DISTINCT viewer_id) AS active_viewers
  FROM login_with_country
  GROUP BY country, login_month
),

engagement_change AS (
  SELECT country,
         login_month,
         active_viewers,
         LAG(active_viewers) OVER (PARTITION BY country ORDER BY login_month) AS prev_month_viewers
  FROM monthly_engagement
),

decline_flagged AS (
  SELECT country,
         login_month,
         active_viewers,
         prev_month_viewers,
         active_viewers - prev_month_viewers AS delta,
         CASE WHEN prev_month_viewers IS NOT NULL AND active_viewers < prev_month_viewers THEN 1 
              ELSE 0 
         END AS is_decline
  FROM engagement_change
)

SELECT country,
       COUNTIF(is_decline = 1) AS months_of_decline,
       COUNT(*) AS total_months,
       ROUND(COUNTIF(is_decline = 1) * 100 / COUNT(*), 2) AS months_declining
FROM decline_flagged
GROUP BY country
ORDER BY months_declining DESC;
