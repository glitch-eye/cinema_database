CREATE OR ALTER FUNCTION SearchAvailScreening(
    @movieID INT = NULL,
    @movieKeyword VARCHAR(20) = NULL,
    @movieGenre VARCHAR(10) = NULL,
    @cinemaName VARCHAR(20) = NULL
)
RETURNS @OutTable TABLE(
    MovieName VARCHAR(20),
    MovieDuration INT,
    TheatreID INT, 
    CinemaName VARCHAR(20), 
    ScreeningDate DATE, 
    ScreeningTime VARCHAR(5)
)
AS
BEGIN
    DECLARE @mK AS VARCHAR(22) = '%' + ISNULL(@movieKeyword, '') + '%';
    DECLARE @mG AS VARCHAR(12) = '%' + ISNULL(@movieGenre, '') + '%';
    DECLARE @cN AS VARCHAR(22) = '%' + ISNULL(@cinemaName, '') + '%';

    INSERT INTO @OutTable
    SELECT DISTINCT
        M.M_name,
        M.M_duration,
        T.ID,
        C.C_Name,
        S.DATE_of_screening,
        CONVERT(VARCHAR(5), S.Time_of_screening, 108) AS ScreeningTime
    FROM Screening S
    LEFT JOIN Movie M ON S.M_ID = M.ID
    LEFT JOIN Movie_Genre MG ON M.ID = MG.ID  -- Corrected join: M_ID links to Movie.ID
    LEFT JOIN GENRE G ON G.G_name = MG.M_Genre 
    LEFT JOIN Theatre T ON S.T_ID = T.ID
    LEFT JOIN Cinema C ON T.C_ID = C.ID
    WHERE
        (@movieID IS NULL OR S.M_ID = @movieID)
        AND (@movieKeyword IS NULL OR M.M_name LIKE @mK)
        AND (@movieGenre IS NULL OR G.G_name LIKE @mG)
        AND (@cinemaName IS NULL OR C.C_Name LIKE @cN)
        AND S.DATE_of_screening >= CAST(GETDATE() AS DATE)

    RETURN
END
GO
