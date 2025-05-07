-- use TEST
CREATE TRIGGER trg_Delete_PreviousID
ON Movie
AFTER DELETE
AS
BEGIN
    WHILE EXISTS (SELECT 1 FROM Movie WHERE Previous_ID IN (SELECT ID FROM Deleted))
    BEGIN
        -- Update remaining movies to hold the correct Previous_ID reference
        UPDATE m
        SET Previous_ID = d.Previous_ID
        FROM Movie m
        JOIN Deleted d ON m.Previous_ID = d.ID;
    END;

    -- Set Previous_ID to NULL if no valid Previous_ID is left
    UPDATE Movie
    SET Previous_ID = NULL
    WHERE Previous_ID IN (SELECT ID FROM Deleted) 
          AND NOT EXISTS (SELECT 1 FROM Movie WHERE ID = Previous_ID);
END;

