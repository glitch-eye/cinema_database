-- USE TEST
CREATE TRIGGER trg_Update_PreviousID
ON Movie
AFTER UPDATE
AS
BEGIN
    UPDATE Movie
    SET Previous_ID = i.ID
    FROM Movie m
    JOIN INSERTED i ON m.Previous_ID = i.ID;
END;
