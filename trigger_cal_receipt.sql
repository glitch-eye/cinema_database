CREATE TRIGGER Update_Receipt_Total_On_Ticket
ON TICKET
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Collect distinct Receipt_IDs from inserted or deleted rows
    DECLARE @ReceiptIDs TABLE (Receipt_ID INT);

    INSERT INTO @ReceiptIDs (Receipt_ID)
    SELECT DISTINCT Trans_ID
    FROM inserted
    WHERE Trans_ID IS NOT NULL
    UNION
    SELECT DISTINCT Trans_ID
    FROM deleted
    WHERE Trans_ID IS NOT NULL;

    -- Call procedure for each Receipt_ID
    DECLARE @ReceiptID INT;
    DECLARE receipt_cursor CURSOR FOR 
        SELECT Receipt_ID FROM @ReceiptIDs;

    OPEN receipt_cursor;
    FETCH NEXT FROM receipt_cursor INTO @ReceiptID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        BEGIN TRY
            EXEC UpdateReceiptTotal @ReceiptID;
        END TRY
        BEGIN CATCH
            -- Rollback if overflow or other error occurs
            IF @@TRANCOUNT > 0
                ROLLBACK;
            THROW;
        END CATCH;
        FETCH NEXT FROM receipt_cursor INTO @ReceiptID;
    END;

    CLOSE receipt_cursor;
    DEALLOCATE receipt_cursor;
END;
