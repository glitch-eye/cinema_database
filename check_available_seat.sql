CREATE OR ALTER PROCEDURE check_aval_seat
    @ScreeningDate DATE, 
    @ScreeningTime TIME,
    @Theatre_ID INT,
    @value BIT OUTPUT
AS
BEGIN
    -- Initialize the output parameter
    SET @value = 0;

    -- Check if the screening exists
    IF EXISTS (
        SELECT 1
        FROM Screening
        WHERE T_ID = @Theatre_ID
            AND DATE_of_screening = @ScreeningDate
            AND Time_of_screening = @ScreeningTime
    )
    BEGIN
        -- Check for available seats
        IF EXISTS (
            SELECT s.ID
            FROM SEAT s
            WHERE s.T_ID = @Theatre_ID
            EXCEPT
            SELECT t.Chair_ID
            FROM TICKET t
            WHERE t.Room_ID = @Theatre_ID
                AND t.Date_of_screening = @ScreeningDate
                AND t.Time_of_screening = @ScreeningTime
        )
        BEGIN
            SET @value = 1; -- At least one seat is available
        END
        ELSE
        BEGIN
            SET @value = 0; -- No seats available
        END
    END
    ELSE
    BEGIN
        -- Screening does not exist, so no seats available
        SET @value = 0;
    END
END;
GO