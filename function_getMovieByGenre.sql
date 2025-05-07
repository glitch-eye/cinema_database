-- USE TEST
-- GO
CREATE FUNCTION fn_GetMovieReviewSummaryByGenre
(
    @GenreName VARCHAR(20)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        M.M_name,
        AvgData.Avg_Score,
        TopReview.Score AS Top_Score,
        TopReview.Details AS Top_Details
    FROM 
        MOVIE M
    INNER JOIN 
        Movie_Genre MG ON M.ID = MG.ID
    -- Calculate average score from all reviews
    INNER JOIN (
        SELECT M_ID, AVG(Score) AS Avg_Score
        FROM Movie_Review
        GROUP BY M_ID
    ) AS AvgData ON M.ID = AvgData.M_ID
    -- Get the review with the highest score
    CROSS APPLY (
        SELECT TOP 1 Score, Details
        FROM Movie_Review
        WHERE M_ID = M.ID
        ORDER BY Score DESC, Post_Date ASC
    ) AS TopReview
    WHERE 
        MG.M_Genre = @GenreName
)



