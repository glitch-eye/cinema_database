USE TEST
-- Test for get total revenue
-- Total revenue across all cinemas on a given day
-- SELECT dbo.GetTotalRevenue('2025-05-08', NULL) AS TotalRevenue;

-- Total revenue for cinema '011' on that day
-- SELECT dbo.GetTotalRevenue('2025-05-08', '011') AS TotalRevenue;

-- Test for search screenings
-- 1. Test with only movie ID
SELECT * FROM dbo.SearchAvailScreening('01',NULL,NULL,NULL);

-- 2. Test with only movie keyword
-- SELECT * FROM dbo.SearchAvailScreening(@movieKeyword = 'Avengers');

-- 3. Test with only movie genre
-- SELECT * FROM dbo.SearchAvailScreening(@movieGenre = 'Action');

-- 4. Test with only cinema name
-- SELECT * FROM dbo.SearchAvailScreening(@cinemaName = 'Galaxy Cinema');

-- 5. Test with multiple parameters
-- SELECT * FROM dbo.SearchAvailScreening(
--     @movieKeyword = 'Spider',
--     @movieGenre = 'Adventure',
--     @cinemaName = 'Lotte Cinema'
-- );