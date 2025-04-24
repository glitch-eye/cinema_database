-- USE TEST
CREATE TRIGGER trg_delete_seri_references
ON Movie
AFTER DELETE
AS
BEGIN
    -- Delete rows where the deleted movie is referenced in M_ID_1 or M_ID_2
    DELETE FROM SERI
    WHERE M_ID_1 IN (SELECT ID FROM DELETED)
       OR M_ID_2 IN (SELECT ID FROM DELETED);
END;

