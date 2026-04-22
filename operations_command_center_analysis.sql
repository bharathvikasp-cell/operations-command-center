-- Operations Command Center SQL

SELECT DATE_TRUNC('month', created_date) AS month_start, COUNT(*) AS total_cases
FROM service_cases
GROUP BY 1
ORDER BY 1;

SELECT team_name,
       ROUND(100.0 * AVG(CASE WHEN status <> 'Open' THEN sla_met_flag END), 2) AS sla_met_pct
FROM service_cases
GROUP BY team_name
ORDER BY sla_met_pct ASC;

SELECT
  CASE
    WHEN DATE_PART('day', CURRENT_DATE - DATE(created_date)) <= 3 THEN '0-3 Days'
    WHEN DATE_PART('day', CURRENT_DATE - DATE(created_date)) <= 7 THEN '4-7 Days'
    WHEN DATE_PART('day', CURRENT_DATE - DATE(created_date)) <= 14 THEN '8-14 Days'
    ELSE '15+ Days'
  END AS aging_bucket,
  COUNT(*) AS open_cases
FROM service_cases
WHERE status = 'Open'
GROUP BY 1
ORDER BY 1;

SELECT issue_category, COUNT(*) AS sla_miss_cases
FROM service_cases
WHERE status <> 'Open' AND sla_met_flag = 0
GROUP BY issue_category
ORDER BY sla_miss_cases DESC;

SELECT team_name,
       ROUND(100.0 * AVG(reopened_flag), 2) AS reopen_rate_pct
FROM service_cases
GROUP BY team_name
ORDER BY reopen_rate_pct DESC;

SELECT agent_name, team_name,
       COUNT(*) AS cases_handled,
       ROUND(AVG(csat_score), 2) AS avg_csat,
       ROUND(100.0 * AVG(reopened_flag), 2) AS reopen_rate_pct
FROM service_cases
GROUP BY agent_name, team_name
ORDER BY cases_handled DESC;

SELECT root_cause_group, COUNT(*) AS case_count
FROM service_cases
GROUP BY root_cause_group
ORDER BY case_count DESC;
