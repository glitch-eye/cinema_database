CREATE TRIGGER CheckAgeRestriction
ON TICKET
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables
    DECLARE @UserID CHAR(11), @FilmID CHAR(11), @UserAge INT, @RequiredAge INT, @AgeTag VARCHAR(5);

    -- Cursor to loop through inserted tickets
    DECLARE ticket_cursor CURSOR FOR
    SELECT i.Trans_ID, i.Film_ID
    FROM inserted i;

    OPEN ticket_cursor;
    FETCH NEXT FROM ticket_cursor INTO @UserID, @FilmID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Get User ID from Receipt
        SELECT @UserID = r.U_ID
        FROM RECEIPT r
        WHERE r.Receipt_ID = @UserID; -- Trans_ID is actually Receipt_ID

        -- Skip if no user is associated (anonymous purchase)
        IF @UserID IS NOT NULL
        BEGIN
            -- Calculate user's age
            SELECT @UserAge = DATEDIFF(YEAR, w.B_Date, GETDATE())
            FROM W_USER w
            WHERE w.ID = @UserID;

            -- Get the age restriction tag and required age for the movie
            SELECT @AgeTag = m.Age_restrict_tag
            FROM MOVIE m
            WHERE m.ID = @FilmID;

            SELECT @RequiredAge = ar.Age_permit
            FROM AGE_RESTRICT ar
            WHERE ar.TAG = @AgeTag;

            -- Check if user is old enough
            IF @UserAge < @RequiredAge
            BEGIN
                -- Rollback the transaction and raise an error
                ROLLBACK;
                RAISERROR ('User %s is %d years old, which is below the required age (%d) for this movie.', 16, 1, @UserID, @UserAge, @RequiredAge);
                RETURN;
            END
        END
	END
END;