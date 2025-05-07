USE TEST

-- -- SELECT* from W_USER
SELECT* from Cinema
SELECT * from Movie

SELECT * from W_USER
-- INSERT INTO AGE_RESTRICT
-- VALUES 
-- ('G','0'),
-- ('PG','18'),
-- ('PG-13','13'),
-- ('R','17'),
-- ('NC-17','17')

-- INSERT INTO GENRE (G_name, G_Description) VALUES 
-- ('Action', 'Defined by spectacle like combat and explosions.'),
-- ('Adventure', 'Stories centered on journeys and exploration.'),
-- ('Animated', 'Films made using hand-drawn or digital animation.'),
-- ('Comedy', 'Focused on humor and making the audience laugh.'),
-- ('Drama', 'Driven by emotional conflict and realism.'),
-- ('Fantasy', 'Supernatural elements or fictional worlds.'),
-- ('Historical', 'Films depicting historical events or settings.'),
-- ('Horror', 'Made to evoke fear and suspense in audiences.'),
-- ('Musical', 'Uses songs and dance to enhance the story.'),
-- ('Noir', 'Stylish crime films popular in the 1940s-50s.'),
-- ('Scifi', 'Explores science and technology.'),
-- ('Thriller', 'Creates tension and suspense through the plot.'),
-- ('Western', 'Set in the American West, often with cowboys.'),
-- ('Romance', 'Focuses on love and emotional relationships.');

SELECT* from GENRE
-- INSERT INTO MOVIE 
-- VALUES 
-- (101, 'Die Hard', 132, '1988-07-20', 'EN', 'EN', 'R', NULL, NULL),
-- (102, 'Mad Max: Fury Road', 120, '2015-05-15', 'EN', 'EN', 'R', NULL, NULL),
-- (103, 'John Wick', 101, '2014-10-24', 'EN', 'EN', 'R', NULL, NULL),
-- (104, 'Indiana Jones', 115, '1981-06-12', 'EN', 'EN', 'PG', NULL, NULL),
-- (105, 'The Revenant', 156, '2015-12-25', 'EN', 'EN', 'R', NULL, NULL),
-- (106, 'The Secret Life', 114, '2013-12-25', 'EN', 'EN', 'PG', NULL, NULL),
-- (107, 'Spirited Away', 125, '2001-07-20', 'JA', 'EN', 'PG', NULL, NULL),
-- (108, 'Spider-Verse', 117, '2018-12-14', 'EN', 'EN', 'PG', NULL, NULL)
-- INSERT INTO Movie_Genre (ID, M_Genre) VALUES
-- (100, 'Romance'), (100, 'Drama'),
-- (101, 'Action'), (101, 'Thriller'),
-- (102, 'Action'), (102, 'Adventure'),
-- (103, 'Action'), (103, 'Thriller'),
-- (104, 'Adventure'), (104, 'Fantasy'),
-- (105, 'Adventure'), (105, 'Drama'),
-- (106, 'Animated'), (106, 'Comedy'),
-- (107, 'Animated'), (107, 'Fantasy'),
-- (108, 'Animated'), (108, 'Action');
select * from Movie_Genre

-- INSERT INTO Movie_review_by_user (U_ID, M_ID, Details, Score, POST_date) VALUES
-- (1, 100, 'Great movie with emotional depth.', 9, '2025-05-01'),
-- (2, 101, 'Action-packed and thrilling!', 8, '2025-05-02'),
-- (3, 102, 'Intense and visually stunning.', 9, '2025-05-03'),
-- (1851410258, 103, 'Fantastic choreography and storytelling.', 10, '2025-05-04'),
-- (1, 104, 'Classic adventure with unforgettable moments.', 8, '2025-05-05'),
-- (2, 105, 'Visually stunning and emotionally gripping.', 9, '2025-05-06'),
-- (3, 106, 'Fun and heartwarming animated film.', 8, '2025-05-07'),
-- (1851410258, 107, 'A masterpiece in animation storytelling.', 10, '2025-05-08'),
-- (1, 108, 'Innovative visuals and engaging narrative.', 9, '2025-05-09'),
-- (2, 100, 'Emotional and beautifully crafted movie.', 10, '2025-05-10'),
-- (3, 101, 'Exciting action with well-paced sequences.', 8, '2025-05-11'),
-- (1851410258, 102, 'A thrilling ride from start to finish.', 9, '2025-05-12');
-- Add poster_url column
-- ALTER TABLE Movie ADD poster_url VARCHAR(255);



-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=11K6g4kSum7v27OJFw3fe1MKOSJZ7AuRR&sz=w1000'
-- WHERE ID = 100; -- Titanic

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1x0O0SRxdNErDRpBIf6IrxVcE4nzOqr0t&sz=w1000'
-- WHERE ID = 101; -- Die Hard

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1A0OSLyi1YbQXTDuD16UTLgHW0WgPus0m&sz=w1000'
-- WHERE ID = 102; -- Mad Max: Fury Road

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1H2RUYzqxAEWrlvzJlZzXXQBVNljJbxGY&sz=w1000'
-- WHERE ID = 103; -- John Wick

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1gN3oFuY1XAA0vdaf7zmHktBKmkfH05QI&sz=w1000'
-- WHERE ID = 104; -- Indiana Jones

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1VydNeZ5yhfIR_rt-IIZe_Two-5F4HZRv&sz=w1000'
-- WHERE ID = 105; -- The Revenant

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1tQzstjAaTOj9-hiWGRAMVZ8vkcOO4hYB&sz=w1000'
-- WHERE ID = 106; -- The Secret Life of Pets

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1etWeh3LZJTzo0tKsbY9zRO-19RLFSt-G&sz=w1000'
-- WHERE ID = 107; -- Spirited Away

-- UPDATE Movie
-- SET poster_url = 'https://drive.google.com/thumbnail?id=1B60axKrSP3kxbqNL_zLB8PHgHLzUol7j&sz=w1000'
-- WHERE ID = 108; -- Spider-Man: Into the Spider-Verse
-- INSERT INTO Theatre (ID, Size_Type, Capacity, C_ID) VALUES
-- -- Các rạp thuộc cụm rạp ID 15 - Hai Bà Trưng
-- (101, 'L', 250, 15),
-- (102, 'M', 180, 15),
-- (103, 'S', 120, 15),

-- -- Các rạp thuộc cụm rạp ID 16 - Quốc Thanh
-- (104, 'L', 300, 16),
-- (105, 'M', 200, 16),

-- -- Các rạp thuộc cụm rạp ID 17 - Sinh Viên
-- (106, 'M', 220, 17),
-- (107, 'S', 150, 17),
-- (108, 'L', 280, 17),

-- -- Các rạp thuộc cụm rạp ID 18 - Satra Quận 6
-- (109, 'S', 140, 18),
-- (110, 'M', 190, 18),
-- (111, 'L', 260, 18);

-- INSERT INTO Screening (M_ID, T_ID, DATE_of_screening, Time_of_srceening) VALUES
-- -- Lịch chiếu cho Titanic (100)
-- (100, 101, '2025-05-10', '14:00'),
-- (100, 104, '2025-05-11', '18:30'),

-- -- Lịch chiếu cho Die Hard (101)
-- (101, 102, '2025-05-10', '16:45'),
-- (101, 105, '2025-05-12', '20:00'),

-- -- Lịch chiếu cho Mad Max: Fury Road (102)
-- (102, 103, '2025-05-10', '15:30'),
-- (102, 106, '2025-05-11', '21:00'),

-- -- Lịch chiếu cho John Wick (103)
-- (103, 107, '2025-05-11', '19:45'),
-- (103, 108, '2025-05-12', '17:30'),

-- -- Lịch chiếu cho Indiana Jones (104)
-- (104, 109, '2025-05-10', '13:00'),
-- (104, 110, '2025-05-12', '18:00'),

-- -- Lịch chiếu cho The Revenant (105)
-- (105, 111, '2025-05-11', '20:15'),
-- (105, 101, '2025-05-13', '22:00'),

-- -- Lịch chiếu cho The Secret Life (106)
-- (106, 102, '2025-05-10', '12:00'),
-- (106, 103, '2025-05-12', '16:00'),

-- -- Lịch chiếu cho Spirited Away (107)
-- (107, 104, '2025-05-11', '14:30'),
-- (107, 105, '2025-05-13', '19:00'),

-- -- Lịch chiếu cho Spider-Verse (108)
-- (108, 106, '2025-05-10', '17:00'),
-- (108, 107, '2025-05-12', '21:45');
-- Create SEAT table


-- Insert seats for each theatre (around 20 seats each)
-- INSERT INTO SEAT (T_ID, ID, S_Type, Mutiplier_val, Status_) VALUES
-- -- Seats for Theatre 101
-- (101, 1, 'N', 1, 'A'),
-- (101, 2, 'N', 1, 'A'),
-- (101, 3, 'D', 2, 'A'),
-- (101, 4, 'V', 3, 'A'),
-- (101, 5, 'N', 1, 'A'),
-- (101, 6, 'N', 1, 'A'),
-- (101, 7, 'D', 2, 'A'),
-- (101, 8, 'N', 1, 'A'),
-- (101, 9, 'V', 3, 'A'),
-- (101, 10, 'N', 1, 'A'),

-- -- Seats for Theatre 102
-- (102, 1, 'N', 1, 'A'),
-- (102, 2, 'N', 1, 'A'),
-- (102, 3, 'D', 2, 'A'),
-- (102, 4, 'V', 3, 'A'),
-- (102, 5, 'N', 1, 'A'),
-- (102, 6, 'N', 1, 'A'),
-- (102, 7, 'D', 2, 'A'),
-- (102, 8, 'N', 1, 'A'),
-- (102, 9, 'V', 3, 'A'),
-- (102, 10, 'N', 1, 'A'),

-- -- Seats for Theatre 103
-- (103, 1, 'N', 1, 'A'),
-- (103, 2, 'N', 1, 'A'),
-- (103, 3, 'D', 2, 'A'),
-- (103, 4, 'V', 3, 'A'),
-- (103, 5, 'N', 1, 'A'),
-- (103, 6, 'N', 1, 'A'),
-- (103, 7, 'D', 2, 'A'),
-- (103, 8, 'N', 1, 'A'),
-- (103, 9, 'V', 3, 'A'),
-- (103, 10, 'N', 1, 'A');
-- Alter Screening table to rename the column with the typo
-- Rename the column Time_of_srceening to Time_of_screening in Screening table
-- EXEC sp_rename 'Screening.Time_of_srceening', 'Time_of_screening', 'COLUMN';

-- -- Add Date_of_screening and Time_of_screening columns to TICKET table
-- ALTER TABLE TICKET
--     ADD Date_of_screening DATE NOT NULL,
--         Time_of_screening TIME NOT NULL;

-- -- Drop the existing foreign key constraints Tic_4_Film and Tic_4_Room
-- ALTER TABLE TICKET
--     DROP CONSTRAINT Tic_4_Film;

-- ALTER TABLE TICKET
--     DROP CONSTRAINT Tic_4_Room;

-- -- Add new foreign key constraint to reference Screening table
-- ALTER TABLE TICKET
--     ADD CONSTRAINT Tic_4_Screening
--         FOREIGN KEY (Film_ID, Room_ID, Date_of_screening, Time_of_screening)
--         REFERENCES Screening(M_ID, T_ID, DATE_of_screening, Time_of_screening);
SELECT *
FROM SearchAvailScreening(
    NULL, -- @movieID
    'Die Hard            ', -- @movieKeyword
    'Action    ', -- @movieGenre
    'Hai Ba Trung' -- @cinemaName
);