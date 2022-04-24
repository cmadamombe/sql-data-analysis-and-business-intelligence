SELECT
    tc.country,
    COUNT(DISTINCT CASE WHEN tc.status = 'Active' THEN tc.id ELSE NULL END) AS 'No. of Active Clients',
    COUNT(DISTINCT CASE WHEN tc.status = 'Inactive' THEN tc.id ELSE NULL END) AS 'No. of Inactive Clients', 
    COUNT(DISTINCT CASE WHEN tc.status = 'Closed' THEN tc.id ELSE NULL END) AS 'No. of Closed Clients' 
FROM tblclients tc
GROUP BY 1
ORDER BY 1
;






