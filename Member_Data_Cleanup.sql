/* PROJECT: Member Data Cleanup & Audit
   LEVEL: Entry-Level / Junior Data Analyst
   OBJECTIVE: Clean inconsistent member records for better reporting.
*/

-- 1. Standardizing and Cleaning Data
SELECT 
    MemberID,
    -- Remove accidental spaces and make names look uniform
    UPPER(TRIM(FullName)) AS Cleaned_Name,
    
    -- Fix inconsistent phone formatting (Removing dashes and dots)
    REPLACE(REPLACE(Phone, '-', ''), '.', '') AS Simplified_Phone,

    -- Fill in missing email data so the report looks professional
    COALESCE(Email, 'No Email Provided') AS Contact_Email,

    -- Identifying if documentation is missing (like a Loan ID)
    CASE 
        WHEN LoanID IS NULL THEN 'Action Required'
        ELSE 'Verified' 
    END AS Documentation_Status
FROM Raw_Member_Export
WHERE FullName IS NOT NULL; -- Ensure we aren't pulling blank rows

-- 2. Finding Duplicate Member IDs
-- This helps identify if a member was accidentally entered twice
SELECT MemberID, COUNT(MemberID)
FROM Raw_Member_Export
GROUP BY MemberID
HAVING COUNT(MemberID) > 1;
