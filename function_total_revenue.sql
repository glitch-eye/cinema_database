CREATE FUNCTION GetTotalRevenue (@InputDate DATE, @CinemaID CHAR(3) = NULL)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18, 2);

    SELECT @TotalRevenue = ISNULL(SUM(Total), 0)
    FROM (
        -- Revenue from tickets
        SELECT SUM(t.Cost) AS Total
        FROM TICKET t
        JOIN Receipt r ON t.Trans_ID = r.Receipt_ID
        JOIN Theatre th ON t.Room_ID = th.ID
        WHERE CAST(r.Receipt_Date AS DATE) = @InputDate
          AND (@CinemaID IS NULL OR th.C_ID = @CinemaID)

        UNION ALL

        -- Revenue from services
        SELECT SUM(sc.Cost) AS Total
        FROM Service_Cost sc
        JOIN Receipt r ON sc.Tran_ID = r.Receipt_ID
        JOIN Services_Cinema scn ON sc.Ser_Bou_ID = scn.Ser_ID
        WHERE CAST(r.Receipt_Date AS DATE) = @InputDate
          AND (@CinemaID IS NULL OR scn.C_ID = @CinemaID)
    ) AS Revenue;

    RETURN @TotalRevenue;
END;
SELECT dbo.GetTotalRevenue('2025-04-02', NULL) AS TotalRevenue;
SELECT dbo.GetTotalRevenue('2025-04-02', 011) AS TotalRevenue;
