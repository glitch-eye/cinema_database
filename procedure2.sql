-- Procedure 2: Display cinema statistics with aggregate functions and filtering
CREATE PROCEDURE GetCinemaScreeningStats
    @MinScreenings INT,
    @Location VARCHAR(20)
AS
BEGIN
    SELECT 
        c.C_Name,
        c.C_location,
        COUNT(s.M_ID) as TotalScreenings,
        AVG(t.Capacity) as AvgTheatreCapacity
    FROM Cinema c
    INNER JOIN Theatre t ON c.ID = t.C_ID
    INNER JOIN Screening s ON t.ID = s.T_ID
    WHERE 
        c.C_location LIKE '%' + @Location + '%'
        AND c.C_Status = 'Active'
    GROUP BY 
        c.C_Name,
        c.C_location
    HAVING 
        COUNT(s.M_ID) >= @MinScreenings
    ORDER BY 
        TotalScreenings DESC,
        c.C_Name ASC
END