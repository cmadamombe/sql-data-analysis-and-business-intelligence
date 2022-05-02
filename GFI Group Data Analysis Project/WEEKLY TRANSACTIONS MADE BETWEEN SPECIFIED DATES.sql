# SQL TO VIEW TREND ANALYSIS OF WEEKLY TRANSACTIONS BETWEEN SPECIFIED DATES

SELECT 
    YEAR(ta.date) Year,
    WEEK(ta.date) Week, 
    MIN(DATE(ta.date)) Week_Start,
    tc.firstname First_Name,
    tc.lastname Last_Name,
    tc.email Email,
    ta.invoiceid Invoice_No,
    tii.description Description,
    tcs.code Currency,
    ta.amountin Amunt_Paid

FROM tblaccounts ta
LEFT JOIN tblclients tc
    ON ta.userid = tc.id
LEFT JOIN tblcurrencies tcs
    ON tc.currency = tcs.id -- currency is from the tblclients and tblcurrencies because thats is where the tblclients.currency = tblcurrencies.id
LEFT JOIN tblinvoiceitems tii
    ON ta.invoiceid = tii.invoiceid
-- WHERE ta.date BETWEEN '01 May 2019' AND '07 May 2022'
WHERE ta.date BETWEEN '2022-05-01 00:00:00' AND '2022-05-07 00:00:00'
GROUP BY 1,2