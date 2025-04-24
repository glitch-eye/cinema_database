CREATE FUNCTION GetTotalRevenue (@InputDate DATE)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18, 2);

    SELECT @TotalRevenue = ISNULL(SUM(Total), 0)
    FROM (
        SELECT SUM(t.Cost) AS Total
        FROM TICKET t
        JOIN Receipt r ON t.Trans_ID = r.Receipt_ID
        WHERE CAST(r.Receipt_Date AS DATE) = @InputDate

        UNION ALL

        SELECT SUM(sc.Amount) AS Total
        FROM Service_cost sc
        JOIN Receipt r ON sc.Tran_ID = r.Receipt_ID
        WHERE CAST(r.Receipt_Date AS DATE) = @InputDate
    ) AS Revenue;

    RETURN @TotalRevenue;
END;
