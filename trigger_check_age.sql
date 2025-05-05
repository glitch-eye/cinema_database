CREATE TRIGGER trg_CheckUserAge
ON W_USER
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE DATEDIFF(YEAR, B_Date, GETDATE()) < 12
    )
    BEGIN
        RAISERROR ('User must be 12 or older.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
