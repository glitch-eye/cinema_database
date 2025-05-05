USE TEST
-- DECLARE @T_ID CHAR(3), @Capacity INT
-- DECLARE @seat_num INT, @seat_id CHAR(10)
-- DECLARE @vip_limit INT, @deluxe_limit INT

-- DECLARE theatre_cursor CURSOR FOR
--     SELECT ID, Capacity FROM THEATRE

-- OPEN theatre_cursor
-- FETCH NEXT FROM theatre_cursor INTO @T_ID, @Capacity

-- WHILE @@FETCH_STATUS = 0
-- BEGIN
--     SET @vip_limit = FLOOR(@Capacity * 0.10)
--     SET @deluxe_limit = FLOOR(@Capacity * 0.20)
--     SET @seat_num = 1

--     WHILE @seat_num <= @Capacity
--     BEGIN
--         SET @seat_id = 'S' + RIGHT('000' + CAST(@seat_num AS VARCHAR), 3)

--         IF @seat_num <= @vip_limit
--         BEGIN
--             INSERT INTO SEAT (T_ID, ID, S_Type, Mutiplier_Val, Status_)
--             VALUES (@T_ID, @seat_id, 'V', 3, 'A')
--         END
--         ELSE IF @seat_num <= @vip_limit + @deluxe_limit
--         BEGIN
--             INSERT INTO SEAT (T_ID, ID, S_Type, Mutiplier_Val, Status_)
--             VALUES (@T_ID, @seat_id, 'D', 2, 'A')
--         END
--         ELSE
--         BEGIN
--             INSERT INTO SEAT (T_ID, ID, S_Type, Mutiplier_Val, Status_)
--             VALUES (@T_ID, @seat_id, 'N', 1, 'A')
--         END

--         SET @seat_num = @seat_num + 1
--     END

--     FETCH NEXT FROM theatre_cursor INTO @T_ID, @Capacity
-- END

-- CLOSE theatre_cursor
-- DEALLOCATE theatre_cursor
INSERT INTO Movie_Genre 
VALUES
('MV00000001', 'Action'),
('MV00000001', 'Thriller'),
('MV00000002', 'Action'),
('MV00000002', 'Adventure'),
('MV00000003', 'Action'),
('MV00000003', 'Thriller'),
('MV00000004', 'Adventure'),
('MV00000005', 'Drama'),
('MV00000005', 'Historical'),
('MV00000006', 'Drama'),
('MV00000007', 'Animated'),
('MV00000007', 'Fantasy'),
('MV00000008', 'Animated'),
('MV00000008', 'Action'),
('MV00000009', 'Animated'),
('MV00000009', 'Comedy'),
('MV00000010', 'Comedy'),
('MV00000010', 'Drama'),
('MV00000011', 'Comedy'),
('MV00000012', 'Drama'),
('MV00000012', 'Comedy'),
('MV00000013', 'Drama'),
('MV00000014', 'Drama'),
('MV00000015', 'Drama'),
('MV00000016', 'Fantasy'),
('MV00000016', 'Drama'),
('MV00000017', 'Fantasy'),
('MV00000017', 'Adventure'),
('MV00000018', 'Fantasy'),
('MV00000018', 'Adventure'),
('MV00000019', 'Historical'),
('MV00000019', 'Drama'),
('MV00000020', 'Drama'),
('MV00000021', 'Action'),
('MV00000021', 'Drama'),
('MV00000022', 'Horror'),
('MV00000022', 'Thriller'),
('MV00000023', 'Horror'),
('MV00000023', 'Drama'),
('MV00000024', 'Horror'),
('MV00000024', 'Thriller'),
('MV00000025', 'Drama'),
('MV00000026', 'Drama'),
('MV00000027', 'Musical'),
('MV00000027', 'Romance'),
('MV00000028', 'Musical'),
('MV00000028', 'Romance'),
('MV00000029', 'Musical'),
('MV00000030', 'Musical'),
('MV00000031', 'Noir'),
('MV00000031', 'Thriller'),
('MV00000032', 'Noir'),
('MV00000033', 'Noir'),
('MV00000034', 'Scifi'),
('MV00000034', 'Action'),
('MV00000035', 'Scifi'),
('MV00000035', 'Drama'),
('MV00000036', 'Scifi'),
('MV00000036', 'Adventure'),
('MV00000037', 'Thriller'),
('MV00000037', 'Drama'),
('MV00000038', 'Thriller'),
('MV00000038', 'Drama'),
('MV00000039', 'Thriller'),
('MV00000039', 'Drama'),
('MV00000040', 'Western'),
('MV00000040', 'Adventure'),
('MV00000041', 'Western'),
('MV00000042', 'Western'),
('MV00000042', 'Drama'),
('MV00000043', 'Romance'),
('MV00000043', 'Drama'),
('MV00000044', 'Drama'),
('MV00000044', 'Romance'),
('MV00000045', 'Drama'),
('MV00000045', 'Romance'),
('MV00000046', 'Action'),
('MV00000046', 'Thriller'),
('MV00000047', 'Adventure'),
('MV00000047', 'Action'),
('MV00000048', 'Musical'),
('MV00000048', 'Romance'),
('MV00000049', 'Fantasy'),
('MV00000049', 'Adventure'),
('MV00000050', 'Scifi'),
('MV00000050', 'Noir')
INSERT INTO Movie_Participant VALUES 
('MV00000001', 'BW000000001'),
('MV00000002', 'CH000000006'),
('MV00000005', 'LD000000005'),
('MV00000006', 'BW000000001'),
('MV00000007', 'RM000000038'),
('MV00000008', 'JG000000040'),
('MV00000009', 'BP000000021'),
('MV00000010', 'WB000000015'),
('MV00000011', 'JH000000025'),
('MV00000012', 'RG000000008'),
('MV00000013', 'AD000000009'),
('MV00000014', 'CW000000032'),
('MV00000015', 'AK000000026'),
('MV00000016', 'BP000000021'),
('MV00000018', 'JG000000022'),
('MV00000019', 'SP000000011'),
('MV00000020', 'SP000000011'),
('MV00000021', 'RS000000010'),
('MV00000022', 'JK000000018'),
('MV00000023', 'EG000000007'),
('MV00000024', 'AD000000009'),
('MV00000025', 'RG000000008'),
('MV00000026', 'AD000000009'),
('MV00000027', 'EG000000007'),
('MV00000028', 'NK000000036'),
('MV00000029', 'NK000000036'),
('MV00000030', 'MF000000045'), 
('MV00000032', 'HB000000046'), 
('MV00000033', 'HB000000046'), 
('MV00000034', 'DP000000016'), 
('MV00000035', 'JG000000022'), 
('MV00000036', 'LD000000005'), 
('MV00000037', 'AD000000009'), 
('MV00000038', 'PC000000017'), 
('MV00000039', 'JG000000022'), 
('MV00000040', 'SC000000033'), 
('MV00000041', 'CB000000031'), 
('MV00000042', 'LD000000005'), 
('MV00000043', 'EH000000043'),
('MV00000044', 'KH000000044'), 
('MV00000045', 'LD000000005'), 
('MV00000048', 'EG000000007'), 
('MV00000049', 'JG000000022')
INSERT INTO SCREENING VALUES
-- Morning screenings
('MV00000001', 'T01', '2025-05-05', '10:00:00'),
('MV00000002', 'T02', '2025-05-05', '10:00:00'), 
('MV00000003', 'T03', '2025-05-05', '10:00:00'), 
('MV00000004', 'T04', '2025-05-05', '10:00:00'), 
('MV00000005', 'T05', '2025-05-05', '10:00:00'), 
('MV00000006', 'T06', '2025-05-05', '10:00:00'), 
('MV00000007', 'T07', '2025-05-05', '10:00:00'), 
('MV00000008', 'T08', '2025-05-05', '10:00:00'), 
('MV00000009', 'T09', '2025-05-05', '10:00:00'), 
('MV00000010', 'T10', '2025-05-05', '10:00:00'), 
('MV00000011', 'T11', '2025-05-05', '10:00:00'), 
('MV00000012', 'T12', '2025-05-05', '10:00:00'), 
('MV00000013', 'T13', '2025-05-05', '10:00:00'), 
('MV00000014', 'T14', '2025-05-05', '10:00:00'), 
('MV00000015', 'T15', '2025-05-05', '10:00:00'), 
('MV00000016', 'T16', '2025-05-05', '10:00:00'), 
('MV00000017', 'T17', '2025-05-05', '10:00:00'), 
('MV00000018', 'T18', '2025-05-05', '10:00:00'), 
('MV00000019', 'T19', '2025-05-05', '10:00:00'), 
('MV00000020', 'T20', '2025-05-05', '10:00:00'), 
-- Afternoon screenings
('MV00000021', 'T01', '2025-05-05', '13:00:00'), 
('MV00000022', 'T02', '2025-05-05', '13:00:00'), 
('MV00000023', 'T03', '2025-05-05', '13:00:00'), 
('MV00000024', 'T04', '2025-05-05', '13:00:00'), 
('MV00000025', 'T05', '2025-05-05', '13:00:00'), 
('MV00000026', 'T06', '2025-05-05', '13:00:00'), 
('MV00000027', 'T07', '2025-05-05', '13:00:00'), 
('MV00000028', 'T08', '2025-05-05', '13:00:00'), 
('MV00000029', 'T09', '2025-05-05', '13:00:00'), 
('MV00000030', 'T10', '2025-05-05', '13:00:00'), 
('MV00000031', 'T11', '2025-05-05', '13:00:00'), 
('MV00000032', 'T12', '2025-05-05', '13:00:00'), 
('MV00000033', 'T13', '2025-05-05', '13:00:00'), 
('MV00000034', 'T14', '2025-05-05', '13:00:00'), 
('MV00000035', 'T15', '2025-05-05', '13:00:00'), 
('MV00000036', 'T16', '2025-05-05', '13:00:00'), 
('MV00000037', 'T17', '2025-05-05', '13:00:00'), 
('MV00000038', 'T18', '2025-05-05', '13:00:00'), 
('MV00000039', 'T19', '2025-05-05', '13:00:00'), 
('MV00000040', 'T20', '2025-05-05', '13:00:00'), 
-- Evening screenings (partial, to show pattern)
('MV00000041', 'T01', '2025-05-05', '19:00:00'), 
('MV00000042', 'T02', '2025-05-05', '19:00:00'), 
('MV00000043', 'T03', '2025-05-05', '19:00:00'), 
('MV00000044', 'T04', '2025-05-05', '19:00:00'), 
('MV00000045', 'T05', '2025-05-05', '19:00:00'), 
('MV00000046', 'T06', '2025-05-05', '19:00:00'), 
('MV00000047', 'T07', '2025-05-05', '19:00:00'), 
('MV00000048', 'T08', '2025-05-05', '19:00:00'), 
('MV00000049', 'T09', '2025-05-05', '19:00:00'), 
('MV00000050', 'T10', '2025-05-05', '19:00:00')
INSERT INTO Movie_Review VALUES
('00015082010', 'MV00000001', 'Die Hard is a classic! Non-stop action and Bruce Willis shines.', 8, '2025-01-10'),
('00007011020', 'MV00000002', 'Mad Max: Fury Road is visually stunning, intense chase scenes!', 9, '2025-01-12'),
('00025041999', 'MV00000003', 'John Wick delivers sleek action, but story is thin.', 7, '2025-01-15'),
('00022110000', 'MV00000004', 'Raiders is timeless adventure. Indy is iconic!', 9, '2025-01-18'),
('00009122012', 'MV00000005', 'The Revenant is raw and gripping, DiCaprio is intense.', 8, '2025-01-20'),
('00095829467', 'MV00000006', 'Walter Mitty is charming but forgets its spark.', 6, '2025-01-22'),
('00011111919', 'MV00000007', 'Spirited Away is a magical masterpiece. Stunning visuals.', 10, '2025-01-25'),
('0000001895', 'MV00000008', 'Spider-Verse is vibrant and fresh. Animation is top-notch.', 9, '2025-01-28'),
('00016011605', 'MV00000009', 'Fantastic Mr. Fox is quirky and fun, great for all ages.', 8, '2025-02-01'),
('00029131915', 'MV00000010', 'Grand Budapest is whimsical and stylish. Anderson at his best.', 9, '2025-02-03'),
('00002291828', 'MV00000011', 'Superbad is hilarious but crude. Teen comedy done right.', 7, '2025-02-05'),
('00001011936', 'MV00000012', 'The Nice Guys has sharp wit and great chemistry.', 8, '2025-02-08'),
('00009121866', 'MV00000013', 'Social Network is smart and engaging. Fincher nails it.', 8, '2025-02-10'),
('00004041918', 'MV00000014', 'Manchester by the Sea is heartbreaking but slow.', 7, '2025-02-12'),
('00019051942', 'MV00000015', 'A Separation is emotionally raw and gripping.', 9, '2025-02-15'),
('00013131230', 'MV00000016', 'Pan''s Labyrinth blends fantasy and horror beautifully.', 9, '2025-02-18'),
('00014111851', 'MV00000017', 'LOTR: Fellowship is epic. A fantasy masterpiece.', 10, '2025-02-20'),
('00024111847', 'MV00000018', 'Harry Potter 3 is darker and thrilling. Cuarón shines.', 8, '2025-02-22'),
('00006061791', 'MV00000019', 'Schindler''s List is powerful and unforgettable.', 10, '2025-02-25'),
('00010101321', 'MV00000020', 'Lincoln is solid but drags at times. DDL is great.', 7, '2025-02-28'),
('06666666666', 'MV00000021', 'Gladiator is epic and emotional. Crowe is perfect.', 9, '2025-03-01'),
('01212121212', 'MV00000022', 'The Shining is creepy and masterful. Kubrick classic.', 9, '2025-03-03'),
('00015082010', 'MV00000023', 'Hereditary is unsettling but loses focus.', 6, '2025-03-05'),
('00007011020', 'MV00000024', 'The Conjuring is scary but predictable.', 7, '2025-03-08'),
('00025041999', 'MV00000025', 'Blue Valentine is raw and real. Great performances.', 8, '2025-03-10'),
('00022110000', 'MV00000026', 'Marriage Story is intense and moving. Great acting.', 8, '2025-03-12'),
('00009122012', 'MV00000027', 'La La Land is vibrant and emotional. Love the music!', 9, '2025-03-15'),
('00095829467', 'MV00000028', 'Moulin Rouge! is bold and colorful but chaotic.', 7, '2025-03-18'),
('00011111919', 'MV00000029', 'Sound of Music is joyful and timeless.', 8, '2025-03-20'),
('0000001895', 'MV00000030', 'Singin'' in the Rain is pure fun. Classic musical.', 9, '2025-03-22'),
('00016011605', 'MV00000031', 'Chinatown is gripping and dark. Polanski masterpiece.', 9, '2025-03-25'),
('00029131915', 'MV00000032', 'Maltese Falcon is a noir gem. Bogart shines.', 8, '2025-03-28'),
('00002291828', 'MV00000033', 'Double Indemnity is tense and clever. Noir classic.', 8, '2025-04-01'),
('00001011936', 'MV00000034', 'Blade Runner 2049 is stunning but slow.', 8, '2025-04-03'),
('00009121866', 'MV00000035', 'Arrival is smart and moving. Sci-fi done right.', 9, '2025-04-05'),
('00004041918', 'MV00000036', 'Interstellar is epic and emotional. Nolan at his best.', 10, '2025-04-08'),
('00019051942', 'MV00000037', 'Gone Girl is twisty and thrilling. Pike is amazing.', 8, '2025-04-10'),
('00013131230', 'MV00000038', 'Oldboy is intense and shocking. A must-watch.', 9, '2025-04-12'),
('00014111851', 'MV00000039', 'Prisoners is dark and gripping. Great suspense.', 8, '2025-04-15'),
('00024111847', 'MV00000040', 'The Good, The Bad is iconic. Leone''s best.', 10, '2025-04-18'),
('00006061791', 'MV00000041', 'Unforgiven is gritty and deep. Eastwood shines.', 8, '2025-04-20'),
('00010101321', 'MV00000042', 'Django Unchained is bold and fun. Tarantino delivers.', 9, '2025-04-22'),
('06666666666', 'MV00000043', 'Before Sunrise is intimate and real. Love the dialogue.', 8, '2025-04-25'),
('01212121212', 'MV00000044', 'Pride and Prejudice is charming and romantic.', 8, '2025-04-28'),
('00015082010', 'MV00000045', 'Titanic is epic but long. Great romance.', 7, '2025-04-30'),
('00007011020', 'MV00000046', 'John Wick 2 is action-packed but less fresh.', 7, '2025-04-01'),
('00025041999', 'MV00000047', 'Last Crusade is fun and adventurous. Indy rocks!', 8, '2025-04-03'),
('00022110000', 'MV00000048', 'La La Land: Encore Cut adds little new. Still great.', 8, '2025-04-05'),
('00009122012', 'MV00000049', 'Goblet of Fire is thrilling but rushed.', 7, '2025-04-08'),
('00095829467', 'MV00000050', 'Blade Runner is moody and deep. Sci-fi classic.', 8, '2025-04-10')