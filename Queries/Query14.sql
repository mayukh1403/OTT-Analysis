--How long do viewers stay active after a trial offer?
WITH trial_viewers AS (
  SELECT viewer_id,
         promo_date AS trial_start
  FROM `ott.promotions`
  WHERE promo_type = 'Free Trial'
),

login_summary AS (
  SELECT viewer_id,
         MAX(login_date) AS last_login
  FROM `ott.Logins`
  GROUP BY viewer_id
),

activity_duration AS (
  SELECT t.viewer_id,
         DATE_DIFF(ls.last_login, t.trial_start, DAY) AS after_trial
  FROM trial_viewers t
  JOIN login_summary ls 
  ON t.viewer_id = ls.viewer_id
  WHERE ls.last_login > t.trial_start
)

SELECT AVG(after_trial) AS avg_active_days,
       MIN(after_trial) AS min_days,
       MAX(after_trial) AS max_days
FROM activity_duration;
