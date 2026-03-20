Financial Data Analysis: Member Activity & Risk Retention
Technical Stack: SQL (PostgreSQL/Standard SQL), CTEs, Window Functions

Project Overview
This project focuses on a critical business challenge in the financial services sector: Member Retention and Proactive Outreach. Using a mock dataset of banking transactions, I developed a SQL-based analysis to identify high-value members whose engagement has significantly dropped, signaling a potential risk of churn or a need for financial health intervention.

The Business Problem
In a credit union or banking environment, "silent churn" occurs when members with significant assets stop utilizing their accounts. Identifying these members manually is time-consuming and prone to error.

The Goal: Automate the identification of members with balances over $5,000 who have had no account activity in the last 30 to 90+ days.

Data Analysis Approach
Data Consolidation: Performed JOINS between member profile data and transaction history to create a unified view of financial health.

Logic Layering: Utilized Common Table Expressions (CTEs) to first calculate the most recent transaction date and total current balance for every member.

Dynamic Flagging: Applied CASE statements to categorize members into "Active," "Stale," or "Inactive" based on time intervals since their last transaction.

Reporting: Filtered the results to highlight high-value targets for the Member Services team to prioritize for outreach.

Drawing on my 10+ years of experience at Redstone Federal Credit Union, I designed this query to mirror the "discrepancy identification" and "educational support" strategies I utilized as a Virtual Member Service Representative. This project demonstrates my ability to translate deep industry domain knowledge into scalable technical solutions.
