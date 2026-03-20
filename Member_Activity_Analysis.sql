/* PROJECT: Financial Member Activity & Risk Analysis
AUTHOR: Amber Clem
DESCRIPTION: This script identifies high-value members with declining activity 
to support proactive outreach for financial health services.
*/

WITH MemberBalances AS (
    -- Calculate total balance and last transaction date for each member
    SELECT 
        m.MemberID,
        m.MemberName,
        SUM(t.Amount) AS TotalBalance,
        MAX(t.TransactionDate) AS LastActivityDate
    FROM Members m
    JOIN Transactions t ON m.MemberID = t.MemberID
    GROUP BY m.MemberID, m.MemberName
),
ActivityFlagging AS (
    -- Categorize members based on balance and recency of activity
    SELECT 
        MemberName,
        TotalBalance,
        LastActivityDate,
        CASE 
            WHEN LastActivityDate < CURRENT_DATE - INTERVAL '90 days' THEN 'Inactive (90+ Days)'
            WHEN LastActivityDate < CURRENT_DATE - INTERVAL '30 days' THEN 'Stale (30+ Days)'
            ELSE 'Active'
        END AS ActivityStatus
    FROM MemberBalances
)
-- Final Report: Find High-Value Members who are becoming inactive
SELECT *
FROM ActivityFlagging
WHERE TotalBalance > 5000 
  AND ActivityStatus != 'Active'
ORDER BY TotalBalance DESC;
