CREATE PROCEDURE GetScreeningSchedule
    @CinemaID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if CinemaID exists
        IF NOT EXISTS (
            SELECT 1
            FROM Cinema
            WHERE ID = @CinemaID
        )
        BEGIN
            THROW 50001, 'Cinema does not exist.', 1;
        END

        -- Check if StartDate is not greater than EndDate
        IF @StartDate > @EndDate
        BEGIN
            THROW 50002, 'Start date cannot be greater than end date.', 1;
        END

        -- Retrieve screening schedule
        SELECT 
            m.M_name AS Movie_Name,
            s.T_ID AS Theatre_ID,
            c.C_Name AS Cinema_Name,
            s.DATE_of_screening AS Screening_Date,
            s.Time_of_srceening AS Screening_Time,
            m.M_duration AS Duration,
            m.Age_restrict_tag AS Age_Restriction
        FROM Screening s
        INNER JOIN Movie m ON s.M_ID = m.ID
        INNER JOIN Theatre t ON s.T_ID = t.ID
        INNER JOIN Cinema c ON t.C_ID = c.ID
        WHERE c.ID = @CinemaID
          AND s.DATE_of_screening BETWEEN @StartDate AND @EndDate
        ORDER BY s.DATE_of_screening, s.Time_of_srceening;

    END TRY
    BEGIN CATCH
        -- Return error details
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
