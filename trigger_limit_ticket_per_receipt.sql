-- USE TEST
CREATE TRIGGER Limit_Tickets_Per_Transaction
ON TICKET
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check the number of tickets for each Trans_ID in the inserted rows
    DECLARE @Trans_ID INT;
    DECLARE @TicketCount INT;

    -- Cursor to process each unique Trans_ID in the inserted rows
    DECLARE trans_cursor CURSOR FOR
    SELECT DISTINCT Trans_ID
    FROM inserted;

    OPEN trans_cursor;
    FETCH NEXT FROM trans_cursor INTO @Trans_ID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Count the total number of tickets for this Trans_ID
        SELECT @TicketCount = COUNT(*)
        FROM TICKET
        WHERE Trans_ID = @Trans_ID;

        -- If more than 10 tickets, raise an error and rollback
        IF @TicketCount > 10
        BEGIN
            ROLLBACK;
            RAISERROR ('Cannot have more than 10 tickets per transaction.', 16, 1);
            RETURN;
        END

        FETCH NEXT FROM trans_cursor INTO @Trans_ID;
    END

    CLOSE trans_cursor;
    DEALLOCATE trans_cursor;
END;
