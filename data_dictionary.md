# Data Dictionary

## service_cases.csv
- `case_id`: Unique case ID
- `customer_id`: Customer ID
- `created_date`: Case creation timestamp
- `closed_date`: Case closure timestamp
- `channel`: Phone / Email / Chat / Portal
- `department`: Department owning the case
- `team_name`: Assigned team
- `agent_name`: Assigned agent
- `issue_category`: High-level issue category
- `issue_subcategory`: More specific issue type
- `priority`: Low / Medium / High / Urgent
- `status`: Open / Closed / Resolved
- `first_response_time_minutes`: Minutes to first response
- `resolution_time_hours`: Total resolution hours
- `sla_target_hours`: SLA threshold
- `sla_met_flag`: 1 if SLA met
- `reopened_flag`: 1 if reopened
- `csat_score`: Customer satisfaction
- `escalation_flag`: 1 if escalated
- `transfer_count`: Number of transfers
- `region`: Region
- `shift`: Morning / Evening / Night
- `resolution_type`: Resolution outcome
- `root_cause_group`: Primary root cause
- `customer_type`: SMB / Mid-Market / Enterprise
- `queue_name`: Queue name
