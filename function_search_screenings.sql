CREATE OR ALTER FUNCTION SearchAvailScreening(
	@movieID 	INT = NULL,
	@movieKeyword 	VARCHAR(20) = NULL,
	@movieGenre	VARCHAR(10) = NULL,
	@cinemaName 	VARCHAR(20) = NULL
) RETURNS @OutTable TABLE(
	MovieName VARCHAR(50),
	MovieDuration INT,
	TheatreID INT,
	CinemaName VARCHAR(20),
	ScreeningDate DATE,
	ScreeningTime TIME
)
AS BEGIN
	DECLARE @mK AS VARCHAR(MAX) = '%' + @movieKeyword + '%';
	DECLARE @mG AS VARCHAR(MAX) = '%' + @movieGenre + '%';

	INSERT INTO @OutTable
	SELECT
		M.M_name,
		M.M_duration,
		T.ID,
		C.C_Name,
		S.DATE_of_screening,
		S.Time_of_screening
	FROM Screening S
	LEFT JOIN Movie M 			ON S.M_ID = M.ID
	LEFT JOIN Movie_Genre MG 	ON MG.ID = M.ID
	LEFT JOIN GENRE G 			ON G.G_name = MG.M_Genre
	LEFT JOIN Theatre T 		ON S.T_ID = T.ID
	LEFT JOIN Cinema C 			ON T.C_ID = C.ID
	WHERE
			(@movieID IS NULL OR @movieID = M_ID)
		AND (@movieKeyword IS NULL OR M_name LIKE @mK)
		AND (@movieGenre IS NULL OR M_genre LIKE @mG OR G_DESCRIPTION LIKE @mG)
		AND (@cinemaName IS NULL OR @cinemaName LIKE C_name)
		AND (CAST(Date_of_screening as DATETIME) + CAST(Time_of_screening AS DATETIME) >= GETDATE())

	RETURN
END
