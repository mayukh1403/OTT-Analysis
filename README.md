# User Login Behavior – OTT Streaming Analytics Case Study

This project analyzes user login and engagement behavior on an OTT (Over-the-Top) streaming platform using realistic synthetic data. It uncovers insights into churn, retention, technical performance, and promotional effectiveness through SQL and data visualization.

## Overview

- **Timeframe**: Jan 2023 – Mar 2024 (15 months)
- **Tools Used**:  
  - SQL (BigQuery)  
  - Google Looker Studio  
  - Google Sheets & Excel
  - Figma
  
- **Skills Applied**:  
  - Root Cause Analysis  
  - Window Functions & CTEs  
  - Cohort & Segmentation Analysis  
  - DAU/MAU, Churn & Retention Metrics  
  - Dashboarding & Storytelling

## Dataset

This is a synthetic dataset generated using generative AI for learning and portfolio purposes.

### Tables

- **Viewers**: signup date, country, age group  
- **Logins**: date, device type, login channel, session score  
- **Sessions**: timestamps, success/failure, duration  
- **Promotions**: promo types, dates, discounts

Dataset links:
- [viewers.csv](https://github.com/DivyeB/User-Login-Behavior-OTT/blob/main/Dataset%20CSV/viewers.csv)
- [logins.csv](https://github.com/DivyeB/User-Login-Behavior-OTT/blob/main/Dataset%20CSV/logins.csv)
- [sessions.csv](https://github.com/DivyeB/User-Login-Behavior-OTT/blob/main/Dataset%20CSV/sessions.csv)
- [promotions.csv](https://github.com/DivyeB/User-Login-Behavior-OTT/blob/main/Dataset%20CSV/promotions.csv)

## Key SQL Queries & Use Cases

| Use Case | SQL Query |
|----------|-----------|
| Daily & Monthly Active Users (DAU/MAU Trends) | [DAU](Queries/Query1.sql) · [MAU](Queries/Query4.sql) |
| Detect Inactive Users | [Query](Queries/Query2.sql) |
| Weekly Engaged Users (3+ days/week) | [Query](Queries/Query3.sql) |
| Avg. Session Duration by Region & Age | [Region](Queries/Query5.sql) · [Age Group](Queries/Query6.sql) |
| Time from Signup to Last Login | [Query](Queries/Query7.sql) |
| First Login Drop-off | [Query](Queries/Query8.sql) |
| Login Channel vs. Retention | [Query](Queries/Query9.sql) |
| Trial Users: Retention & Activity | [Query](Queries/Query13.sql) |
| Promotion vs. Organic Viewer Sessions | [Query](Queries/Query14.sql) |
| Signup Cohort Retention | [Query](Queries/Query12.sql) |
| Viewer Churn by Country | [Query](Queries/Query17.sql) |

Explore all queries [here](https://github.com/DivyeB/User-Login-Behavior-OTT/tree/main/Queries)

## Dashboard & Visualizations

Built using Looker Studio:

- [Live Dashboard](https://lookerstudio.google.com/u/0/reporting/b142085d-ce40-470e-82ea-d555ca43d3f4/page/p_rc75fgeutd)
- [PDF Summary Report](https://github.com/DivyeB/User-Login-Behavior-OTT/blob/main/User%20Activity%20-%20Visualization.pdf)

Included:
- DAU & MAU Trends
- Viewer Distribution by Age, Country, Acquisition Type
- Promo Strategy vs Retention & Session Success
- Region-wise Engagement Patterns

## Author

**Divye Bajaj**  
NSUT’26  
[LinkedIn](https://linkedin.com/in/divyebajaj)  
[GitHub Project](https://github.com/DivyeB/User-Login-Behavior-OTT)
