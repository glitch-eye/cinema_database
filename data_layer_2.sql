USE TEST
-- Declare variables for cursor and seat generation
DECLARE @T_ID INT;
DECLARE @Size_Type CHAR(1);
DECLARE @Capacity INT;
DECLARE @Seat_ID INT;
DECLARE @S_Type CHAR(1);
DECLARE @Mutiplier_Val INT;

-- Declare cursor to iterate over THEATRE table
DECLARE theatre_cursor CURSOR FOR
SELECT ID, Size_Type, Capacity
FROM THEATRE;

-- Open cursor
OPEN theatre_cursor;
FETCH NEXT FROM theatre_cursor INTO @T_ID, @Size_Type, @Capacity;

-- Loop through each theater
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Initialize seat ID
    SET @Seat_ID = 1;

    -- Loop through each seat up to Capacity
    WHILE @Seat_ID <= @Capacity
    BEGIN
        -- Determine S_Type and Mutiplier_Val based on Size_Type and Seat_ID
        IF @Size_Type = 'S' AND @T_ID != 420
        BEGIN
            -- Small theaters (except T420): All 'N'
            SET @S_Type = 'N';
            SET @Mutiplier_Val = 1;
        END
        ELSE IF @Size_Type = 'M'
        BEGIN
            -- Medium theaters: 1-80 'N', 81-95 'D', 96-100 'V'
            IF @Seat_ID <= 80
            BEGIN
                SET @S_Type = 'N';
                SET @Mutiplier_Val = 1;
            END
            ELSE IF @Seat_ID <= 95
            BEGIN
                SET @S_Type = 'D';
                SET @Mutiplier_Val = 2;
            END
            ELSE
            BEGIN
                SET @S_Type = 'V';
                SET @Mutiplier_Val = 3;
            END
        END
        ELSE
        BEGIN
            -- Large theaters and T420: 1-105 'N', 106-135 'D', 136-150 'V'
            IF @Seat_ID <= 105
            BEGIN
                SET @S_Type = 'N';
                SET @Mutiplier_Val = 1;
            END
            ELSE IF @Seat_ID <= 135
            BEGIN
                SET @S_Type = 'D';
                SET @Mutiplier_Val = 2;
            END
            ELSE
            BEGIN
                SET @S_Type = 'V';
                SET @Mutiplier_Val = 3;
            END
        END

        -- Insert seat record
        INSERT INTO SEAT (T_ID, ID, S_Type, Mutiplier_Val, Status_)
        VALUES (@T_ID, @Seat_ID, @S_Type, @Mutiplier_Val, 'A');

        -- Increment seat ID
        SET @Seat_ID = @Seat_ID + 1;
    END

    -- Fetch next theater
    FETCH NEXT FROM theatre_cursor INTO @T_ID, @Size_Type, @Capacity;
END

-- Clean up cursor
CLOSE theatre_cursor;
INSERT INTO Movie_Genre 
VALUES
('01', 'Action'),
('01', 'Thriller'),
('02', 'Action'),
('02', 'Adventure'),
('03', 'Action'),
('03', 'Thriller'),
('04', 'Adventure'),
('05', 'Drama'),
('05', 'Historical'),
('06', 'Drama'),
('07', 'Animated'),
('07', 'Fantasy'),
('08', 'Animated'),
('08', 'Action'),
('09', 'Animated'),
('09', 'Comedy'),
('10', 'Comedy'),
('10', 'Drama'),
('11', 'Comedy'),
('12', 'Drama'),
('12', 'Comedy'),
('13', 'Drama'),
('14', 'Drama'),
('15', 'Drama'),
('16', 'Fantasy'),
('16', 'Drama'),
('17', 'Fantasy'),
('17', 'Adventure'),
('18', 'Fantasy'),
('18', 'Adventure'),
('19', 'Historical'),
('19', 'Drama'),
('20', 'Drama'),
('21', 'Action'),
('21', 'Drama'),
('22', 'Horror'),
('22', 'Thriller'),
('23', 'Horror'),
('23', 'Drama'),
('24', 'Horror'),
('24', 'Thriller'),
('25', 'Drama'),
('26', 'Drama'),
('27', 'Musical'),
('27', 'Romance'),
('28', 'Musical'),
('28', 'Romance'),
('29', 'Musical'),
('30', 'Musical'),
('31', 'Noir'),
('31', 'Thriller'),
('32', 'Noir'),
('33', 'Noir'),
('34', 'Scifi'),
('34', 'Action'),
('35', 'Scifi'),
('35', 'Drama'),
('36', 'Scifi'),
('36', 'Adventure'),
('37', 'Thriller'),
('37', 'Drama'),
('38', 'Thriller'),
('38', 'Drama'),
('39', 'Thriller'),
('39', 'Drama'),
('40', 'Western'),
('40', 'Adventure'),
('41', 'Western'),
('42', 'Western'),
('42', 'Drama'),
('43', 'Romance'),
('43', 'Drama'),
('44', 'Drama'),
('44', 'Romance'),
('45', 'Drama'),
('45', 'Romance'),
('46', 'Action'),
('46', 'Thriller'),
('47', 'Adventure'),
('47', 'Action'),
('48', 'Musical'),
('48', 'Romance'),
('49', 'Fantasy'),
('49', 'Adventure'),
('50', 'Scifi'),
('50', 'Noir')
INSERT INTO Movie_Participant VALUES 
('01', '001'),
('02', '006'),
('05', '005'),
('06', '001'),
('07', '038'),
('08', '040'),
('09', '021'),
('10', '015'),
('11', '025'),
('12', '008'),
('13', '009'),
('14', '032'),
('15', '026'),
('16', '021'),
('18', '022'),
('19', '011'),
('20', '011'),
('21', '010'),
('22', '018'),
('23', '007'),
('24', '009'),
('25', '008'),
('26', '009'),
('27', '007'),
('28', '036'),
('29', '036'),
('30', '045'), 
('32', '046'), 
('33', '046'), 
('34', '016'), 
('35', '022'), 
('36', '005'), 
('37', '009'), 
('38', '017'), 
('39', '022'), 
('40', '033'), 
('41', '031'), 
('42', '005'), 
('43', '043'),
('44', '044'), 
('45', '005'), 
('48', '007'), 
('49', '022')
INSERT INTO SCREENING VALUES
-- Morning screenings
('01', '401', '2025-05-08', '10:00:00'),
('02', '402', '2025-05-08', '10:00:00'), 
('03', '403', '2025-05-08', '10:00:00'), 
('04', '404', '2025-05-08', '10:00:00'), 
('05', '405', '2025-05-08', '10:00:00'), 
('06', '406', '2025-05-08', '10:00:00'), 
('07', '407', '2025-05-08', '10:00:00'), 
('08', '408', '2025-05-08', '10:00:00'), 
('09', '409', '2025-05-08', '10:00:00'), 
('10', '410', '2025-05-08', '10:00:00'), 
('11', '411', '2025-05-08', '10:00:00'), 
('12', '412', '2025-05-08', '10:00:00'), 
('13', '413', '2025-05-08', '10:00:00'), 
('14', '414', '2025-05-08', '10:00:00'), 
('15', '415', '2025-05-08', '10:00:00'), 
('16', '416', '2025-05-08', '10:00:00'), 
('17', '417', '2025-05-08', '10:00:00'), 
('18', '418', '2025-05-08', '10:00:00'), 
('19', '419', '2025-05-08', '10:00:00'), 
('20', '420', '2025-05-08', '10:00:00'), 
-- Afternoon screenings
('21', '401', '2025-05-08', '13:00:00'), 
('22', '402', '2025-05-08', '13:00:00'), 
('23', '403', '2025-05-08', '13:00:00'), 
('24', '404', '2025-05-08', '13:00:00'), 
('25', '405', '2025-05-08', '13:00:00'), 
('26', '406', '2025-05-08', '13:00:00'), 
('27', '407', '2025-05-08', '13:00:00'), 
('28', '408', '2025-05-08', '13:00:00'), 
('29', '409', '2025-05-08', '13:00:00'), 
('30', '410', '2025-05-08', '13:00:00'), 
('31', '411', '2025-05-08', '13:00:00'), 
('32', '412', '2025-05-08', '13:00:00'), 
('33', '413', '2025-05-08', '13:00:00'), 
('34', '414', '2025-05-08', '13:00:00'), 
('35', '415', '2025-05-08', '13:00:00'), 
('36', '416', '2025-05-08', '13:00:00'), 
('37', '417', '2025-05-08', '13:00:00'), 
('38', '418', '2025-05-08', '13:00:00'), 
('39', '419', '2025-05-08', '13:00:00'), 
('40', '420', '2025-05-08', '13:00:00'), 
-- Evening screenings (partial, to show pattern)
('41', '401', '2025-05-08', '19:00:00'), 
('42', '402', '2025-05-08', '19:00:00'), 
('43', '403', '2025-05-08', '19:00:00'), 
('44', '404', '2025-05-08', '19:00:00'), 
('45', '405', '2025-05-08', '19:00:00'), 
('46', '406', '2025-05-08', '19:00:00'), 
('47', '407', '2025-05-08', '19:00:00'), 
('48', '408', '2025-05-08', '19:00:00'), 
('49', '409', '2025-05-08', '19:00:00'), 
('50', '410', '2025-05-08', '19:00:00')
INSERT INTO Movie_Review VALUES
('15082010', '01', 'Die Hard is a classic! Non-stop action and Bruce Willis shines.', 8, '2025-01-10'),
('07011020', '02', 'Mad Max: Fury Road is visually stunning, intense chase scenes!', 9, '2025-01-12'),
('25041999', '03', 'John Wick delivers sleek action, but story is thin.', 7, '2025-01-15'),
('22110000', '04', 'Raiders is timeless adventure. Indy is iconic!', 9, '2025-01-18'),
('09122012', '05', 'The Revenant is raw and gripping, DiCaprio is intense.', 8, '2025-01-20'),
('95829467', '06', 'Walter Mitty is charming but forgets its spark.', 6, '2025-01-22'),
('11111919', '07', 'Spirited Away is a magical masterpiece. Stunning visuals.', 10, '2025-01-25'),
('1895', '08', 'Spider-Verse is vibrant and fresh. Animation is top-notch.', 9, '2025-01-28'),
('16011605', '09', 'Fantastic Mr. Fox is quirky and fun, great for all ages.', 8, '2025-02-01'),
('29131915', '10', 'Grand Budapest is whimsical and stylish. Anderson at his best.', 9, '2025-02-03'),
('02291828', '11', 'Superbad is hilarious but crude. Teen comedy done right.', 7, '2025-02-05'),
('01011936', '12', 'The Nice Guys has sharp wit and great chemistry.', 8, '2025-02-08'),
('09121866', '13', 'Social Network is smart and engaging. Fincher nails it.', 8, '2025-02-10'),
('04041918', '14', 'Manchester by the Sea is heartbreaking but slow.', 7, '2025-02-12'),
('19051942', '15', 'A Separation is emotionally raw and gripping.', 9, '2025-02-15'),
('13131230', '16', 'Pan''s Labyrinth blends fantasy and horror beautifully.', 9, '2025-02-18'),
('14111851', '17', 'LOTR: Fellowship is epic. A fantasy masterpiece.', 10, '2025-02-20'),
('24111847', '18', 'Harry Potter 3 is darker and thrilling. Cuarón shines.', 8, '2025-02-22'),
('06061791', '19', 'Schindler''s List is powerful and unforgettable.', 10, '2025-02-25'),
('10101321', '20', 'Lincoln is solid but drags at times. DDL is great.', 7, '2025-02-28'),
('66666666', '21', 'Gladiator is epic and emotional. Crowe is perfect.', 9, '2025-03-01'),
('12121212', '22', 'The Shining is creepy and masterful. Kubrick classic.', 9, '2025-03-03'),
('15082010', '23', 'Hereditary is unsettling but loses focus.', 6, '2025-03-05'),
('07011020', '24', 'The Conjuring is scary but predictable.', 7, '2025-03-08'),
('25041999', '25', 'Blue Valentine is raw and real. Great performances.', 8, '2025-03-10'),
('22110000', '26', 'Marriage Story is intense and moving. Great acting.', 8, '2025-03-12'),
('09122012', '27', 'La La Land is vibrant and emotional. Love the music!', 9, '2025-03-15'),
('95829467', '28', 'Moulin Rouge! is bold and colorful but chaotic.', 7, '2025-03-18'),
('11111919', '29', 'Sound of Music is joyful and timeless.', 8, '2025-03-20'),
('1895', '30', 'Singin'' in the Rain is pure fun. Classic musical.', 9, '2025-03-22'),
('16011605', '31', 'Chinatown is gripping and dark. Polanski masterpiece.', 9, '2025-03-25'),
('29131915', '32', 'Maltese Falcon is a noir gem. Bogart shines.', 8, '2025-03-28'),
('02291828', '33', 'Double Indemnity is tense and clever. Noir classic.', 8, '2025-04-01'),
('01011936', '34', 'Blade Runner 2049 is stunning but slow.', 8, '2025-04-03'),
('09121866', '35', 'Arrival is smart and moving. Sci-fi done right.', 9, '2025-04-05'),
('04041918', '36', 'Interstellar is epic and emotional. Nolan at his best.', 10, '2025-04-08'),
('19051942', '37', 'Gone Girl is twisty and thrilling. Pike is amazing.', 8, '2025-04-10'),
('13131230', '38', 'Oldboy is intense and shocking. A must-watch.', 9, '2025-04-12'),
('14111851', '39', 'Prisoners is dark and gripping. Great suspense.', 8, '2025-04-15'),
('24111847', '40', 'The Good, The Bad is iconic. Leone''s best.', 10, '2025-04-18'),
('06061791', '41', 'Unforgiven is gritty and deep. Eastwood shines.', 8, '2025-04-20'),
('10101321', '42', 'Django Unchained is bold and fun. Tarantino delivers.', 9, '2025-04-22'),
('66666666', '43', 'Before Sunrise is intimate and real. Love the dialogue.', 8, '2025-04-25'),
('12121212', '44', 'Pride and Prejudice is charming and romantic.', 8, '2025-04-28'),
('15082010', '45', 'Titanic is epic but long. Great romance.', 7, '2025-04-30'),
('07011020', '46', 'John Wick 2 is action-packed but less fresh.', 7, '2025-04-01'),
('25041999', '47', 'Last Crusade is fun and adventurous. Indy rocks!', 8, '2025-04-03'),
('22110000', '48', 'La La Land: Encore Cut adds little new. Still great.', 8, '2025-04-05'),
('09122012', '49', 'Goblet of Fire is thrilling but rushed.', 7, '2025-04-08'),
('95829467', '50', 'Blade Runner is moody and deep. Sci-fi classic.', 8, '2025-04-10')
INSERT INTO Service_Cost VALUES
('101','1','2',NULL),
('201','1','2',NULL),
('102','2','3',NULL),
('202','2','1',NULL),
('301','2','1',NULL),
('103','3','2',NULL),
('205','3','1',NULL),
('106','4','2',NULL),
('206','4','2',NULL),
('302','4','2',NULL),
('104','5','4',NULL),
('203','5','1',NULL),
('204','5','1',NULL),
('105','6','1',NULL),
('201','6','1',NULL),
('303','6','1',NULL),
('101','7','1',NULL),
('202','7','2',NULL),
('106','8','1',NULL),
('205','8','2',NULL),
('301','8','1',NULL),
('302','8','1',NULL),
('102','9','3',NULL),
('206','9','1',NULL),
('203','9','1',NULL),
('103','10','2',NULL),
('201','10','1',NULL),
('301','10','1',NULL)