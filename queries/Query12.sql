-- Which promotion types created long-term OTT viewers?
WITH viewer_login_span AS (
  SELECT p.viewer_id,
         p.promo_type,
         MIN(l.login_date) AS first_login,
         MAX(l.login_date) AS last_login,
         DATE_DIFF(MAX(l.login_date), MIN(l.login_date), DAY) AS active_days
  FROM `ott.promotions` p
  JOIN `ott.Logins` l
  ON p.viewer_id = l.viewer_id
  GROUP BY p.viewer_id, p.promo_type
),
long_term_viewers AS (
  SELECT promo_type,
         COUNT(*) AS total_users,
         COUNT(CASE WHEN active_days >= 90 THEN 1 END) AS long_term_users
  FROM viewer_login_span
  GROUP BY promo_type
)
SELECT promo_type,
       total_users,
       long_term_users,
       ROUND((long_term_users / total_users) * 100, 2) AS long_term_percent
FROM long_term_viewers
ORDER BY long_term_percent DESC;
