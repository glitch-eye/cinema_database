-- USE TEST
-- ALTER TABLE Movie
-- ADD Avg_Score DECIMAL(4, 2) DEFAULT 0;

CREATE TRIGGER UpdateMovieAvgScore
ON Movie_review_by_user
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    -- Update Avg_Score for affected movies
    UPDATE Movie
    SET Avg_Score = ISNULL((
        SELECT AVG(CAST(Score AS DECIMAL(4, 2)))
        FROM Movie_review_by_user mr
        WHERE mr.M_ID = Movie.ID
    ), 0)
    WHERE ID IN (
        -- Movies affected by INSERT
        SELECT M_ID FROM inserted
        UNION
        -- Movies affected by DELETE
        SELECT M_ID FROM deleted
        UNION
        -- Movies affected by UPDATE (both old and new M_ID)
        SELECT M_ID FROM inserted
        UNION
        SELECT M_ID FROM deleted
    );
END;
