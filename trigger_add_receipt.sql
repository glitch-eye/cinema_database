-- USE TEST
CREATE TRIGGER trg_check_S_flag
ON Receipt
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN W_USER w
        ON i.S_ID = w.ID
        WHERE w.S_FLAG != 1
    )
    BEGIN
        RAISERROR ('S_ID must reference a W_USER row with S_FLAG = 1', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Receipt (Receipt_ID, S_ID, Receipt_Date, Type_of_method)
        SELECT Receipt_ID, S_ID, Receipt_Date, Type_of_method
        FROM inserted;
    END
END;
