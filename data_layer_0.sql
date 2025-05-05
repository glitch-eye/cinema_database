USE TEST
INSERT INTO CINEMA
VALUES 
('011','Hai Ba Trung','Open','TP.HCM'),
('073','Quoc Thanh','Open','TP.HCM'),
('042','Sinh Vien','Open','Binh Duong'),
('056','Satra Quan 6','Open','TP.HCM')
INSERT INTO AGE_RESTRICT
VALUES 
('G','0'),
('PG','18'),
('PG-13','13'),
('R','17'),
('NC-17','17')
INSERT INTO GENRE
VALUES 
('Action','Associated with particular types of spectacle (e.g., explosions, chases, combat)'),
('Adventure','Implies a narrative that is defined by a journey (often including some form of pursuit) and is usually located within a fantasy or exoticized setting. Typically, though not always, such stories include the quest narrative. The predominant emphasis on violence and fighting in action films is the typical difference between the two genres.'),
('Animated','A film medium in which the film''s images are primarily created by computer or hand and the characters are voiced by actors.[17] Animation can incorporate any genre and subgenre.'),
('Comedy','Defined by events that are primarily intended to make the audience laugh.'),
('Drama','Focused on emotions and defined by conflict, often looking to reality rather than sensationalism.'),
('Fantasy','Films defined by situations that transcend natural laws and/or by settings inside a fictional universe, with narratives that are often inspired by or involve human myths.'),
('Historical','Films that either provide more-or-less accurate representations of historical accounts or depict fictional narratives placed inside an accurate depiction of a historical setting.'),
('Horror','Films that seek to elicit fear or disgust in the audience for entertainment purposes.'),
('Melodrama','A genre, mode, style or sensibility characterized by an emphasis on intense and exaggerated emotions and heightened dramatic situations.'),
('Musical','A genre in which songs performed by the characters are interwoven into the narrative, sometimes accompanied by dancing. The songs usually advance the plot or develop the film''s characters or may serve merely as breaks in the storyline, often as elaborate "production numbers".'),
('Noir','A genre of stylish crime dramas particularly popular during the 1940s and ''50s. They were often reflective of the American society and culture at the time.'),
('Scifi','Films are defined by a combination of imaginative speculation and a scientific or technological premise, making use of the changes and trajectory of technology and science.'),
('Thriller','Films that evoke excitement and suspense in the audience. The suspense element found in most films'' plots is particularly exploited by the filmmaker in this genre. Tension is created by delaying what the audience sees as inevitable, and is built through situations that are menacing or where escape seems impossible.'),
('Western','A genre in which films are set in the American West during the 19th century.'),
('Romance','Characterized by an emphasis on passion, emotion, and the affectionate romantic involvement of the main characters, with romantic love or the search for it typically being the primary focus.')
INSERT INTO W_USER
VALUES
('15082010','endsky','TP.HCM','2010-03-26','0482765458','0'),
('07011020','plebeian','TP.HCM','2004-02-29','0986987684','0'),
('25041999','dogdays','TP.HCM','1990-10-21','0482765458','1'),
('22110000','twewy','TP.HCM','1997-11-14','0486586521','1'),
('09122012','dancehall','TP.HCM','1987-05-09','0987321546','1'),
('95829467','superlongusernamethatI''mwritingjustforthesakeofit','TP.HCM','1995-10-31','0865986652','0'),
('11111919','Demian','TP.HCM','2004-05-28','0987515684','0'),
('1895','Hastur','TP.HCM','2000-01-01','0985525228','1'),
('16011605','Rocinante','TP.HCM','2002-06-23','0321153452','0'),
('29131915','Kafka','TP.HCM','1998-07-19','0865895274','0'),
('02291828','Mephisto','TP.HCM','1999-09-20','0931521623','0'),
('01011936','flymywings','TP.HCM','2007-11-30','0387555648','0'),
('09121866','ordinary','TP.HCM','1997-03-11','0845586217','0'),
('04041918','hell','TP.HCM','2008-04-08','0151243516','0'),
('19051942','stranger','TP.HCM','2007-04-13','0456284531','0'),
('13131230','Odyssey','TP.HCM','1975-01-23','0795135735','0'),
('14111851','mobydick','TP.HCM','1994-03-12','0775132548','0'),
('24111847','wurthering','TP.HCM','2001-11-06','0254687513','0'),
('06061791','redchamber','TP.HCM','1990-02-14','0587625421','0'),
('10101321','infernos','TP.HCM','2007-06-27','0255256574','1'),
('66666666','Twilight','TP.HCM','1993-09-04','0666666666','1'),
('12121212','White Night','TP.HCM','2003-12-07','0120120120','1')
INSERT INTO EVENT
VALUES 
('Summer Blockbuster Sale', 'Enjoy discounts on all blockbuster films this summer!', '2025-06-01', '2025-08-31'),
('Holiday Movie Marathon', 'Special discount for movie lovers during the holiday season, watch all-time favorites.', '2025-12-15', '2025-12-31'),
('Family Movie Day', 'Get a discount on family movie tickets every weekend!', '2025-05-10', '2025-08-01'),
('Student Night Discount', 'Students get 20% off on all movies every Thursday night.', '2025-05-01', '2025-09-30'),
('New Release Premiere', 'Exclusive 10% discount on tickets for the premiere of new movie releases.', '2025-07-01', '2025-07-15'),
('Halloween Horror Nights', 'Special discount for horror movie screenings during Halloween weekend.', '2025-10-29', '2025-10-31'),
('Romantic Movie Week', 'Couples enjoy a 15% discount on romantic movie screenings during Valentine’s week.', '2025-02-10', '2025-02-14'),
('Indie Film Festival', 'Special discounts for all indie films during the festival!', '2025-09-01', '2025-09-14'),
('VIP Movie Night', 'Exclusive VIP movie screenings with a 25% discount for members.', '2025-07-20', '2025-07-20'),
('Kids Movie Weekend', 'Discounted tickets for all kids’ movies every weekend in May!', '2025-05-01', '2025-05-31'),
('Cinema Anniversary Sale', 'Celebrate our anniversary with a 30% discount on all tickets for one week only!', '2025-11-01', '2025-11-07')
INSERT INTO SERVICES VALUES
('101', 50), -- Popcorn: 50,000 VND
('102', 40), -- Hotdog: 40,000 VND
('103', 35), -- Nachos: 35,000 VND
('104', 30), -- Fries: 30,000 VND
('105', 45), -- Chicken Nuggets: 45,000 VND
('106', 80), -- Combo Meal: 80,000 VND
('201', 20), -- Coke: 20,000 VND
('202', 20), -- Pepsi: 20,000 VND
('203', 18), -- Iced Tea: 18,000 VND
('204', 22), -- Orange Juice: 22,000 VND
('205', 15), -- Water Bottle: 15,000 VND
('206', 25), -- Coffee: 25,000 VND
('301', 100), -- Game 1: 100,000 VND
('302', 110), -- Game 2: 110,000 VND
('303', 120); -- Game 3: 120,000 VND
INSERT INTO ATTENDEE 
VALUES 
('01', 'Bruce Willis', '1955-03-19', 0, 50, 0, 1),
('02', 'Tom Hardy', '1977-09-15', 0, 30, 0, 1),
('03', 'Keanu Reeves', '1964-09-02', 0, 40, 0, 1),
('04', 'Harrison Ford', '1942-07-13', 0, 60, 0, 1),
('05', 'Leonardo DiCaprio', '1974-11-11', 0, 35, 0, 1),
('06', 'Charlize Theron', '1975-08-07', 0, 45, 0, 1),
('07', 'Emma Stone', '1988-11-06', 0, 25, 0, 1),
('08', 'Ryan Gosling', '1980-11-12', 0, 30, 0, 1),
('09', 'Amy Adams', '1974-08-20', 0, 30, 0, 1),
('10', 'Ridley Scott', '1937-11-30', 25, 0, 1, 0),
('11', 'Steven Spielberg', '1946-12-18', 33, 5, 1, 1),
('12', 'Chad Stahelski', '1968-09-20', 4, 5, 1, 1),
('13', 'Alfonso Cuarón', '1961-11-28', 10, 0, 1, 0),
('14', 'David Fincher', '1962-08-28', 12, 0, 1, 0),
('15', 'Wes Anderson', '1969-05-01', 11, 2, 1, 1),
('16', 'Denis Villeneuve', '1967-10-03', 10, 0, 1, 0),
('17', 'Park Chan-wook', '1963-08-23', 15, 0, 1, 0),
('18', 'Jack Nicholson', '1937-04-22', 0, 50, 0, 1),
('19', 'Ralph Fiennes', '1962-12-22', 0, 35, 0, 1),
('20', 'Morgan Freeman', '1937-06-01', 0, 50, 0, 1),
('21', 'Brad Pitt', '1963-12-18', 2, 50, 1, 1),
('22', 'Jake Gyllenhaal', '1980-12-19', 0, 30, 0, 1),
('23', 'Joaquin Phoenix', '1974-10-28', 0, 40, 0, 1),
('24', 'Michael Cera', '1988-06-07', 0, 20, 0, 1),
('25', 'Jonah Hill', '1983-12-20', 1, 30, 1, 1),
('26', 'Asghar Farhadi', '1972-05-07', 12, 0, 1, 0),
('27', 'Tom Hanks', '1956-07-09', 2, 70, 1, 1),
('28', 'Matt Damon', '1970-10-08', 0, 60, 0, 1),
('29', 'Javier Bardem', '1969-03-01', 0, 40, 0, 1),
('30', 'Josh Brolin', '1968-02-12', 0, 40, 0, 1),
('31', 'Clint Eastwood', '1930-05-31', 30, 60, 1, 1),
('32', 'Casey Affleck', '1975-08-12', 0, 25, 0, 1),
('33', 'Sergio Leone', '1929-01-03', 12, 0, 1, 0),
('34', 'Damien Chazelle', '1985-01-19', 5, 0, 1, 0),
('35', 'Baz Luhrmann', '1962-09-17', 6, 1, 1, 1),
('36', 'Nicole Kidman', '1967-06-20', 0, 45, 0, 1),
('37', 'Ewan McGregor', '1971-03-31', 0, 50, 0, 1),
('38', 'Rumi Hiiragi', '1987-08-01', 0, 10, 0, 1),
('39', 'Hayao Miyazaki', '1941-01-05', 25, 0, 1, 0),
('40', 'Jake Johnson', '1978-05-28', 0, 25, 0, 1),
('41', 'Greta Gerwig', '1983-08-04', 4, 20, 1, 1),
('42', 'Julie Delpy', '1969-12-21', 3, 25, 1, 1),
('43', 'Ethan Hawke', '1970-11-06', 0, 45, 0, 1),
('44', 'Keira Knightley', '1985-03-26', 0, 30, 0, 1),
('45', 'Matthew Macfadyen', '1974-10-17', 0, 25, 0, 1),
('46', 'Humphrey Bogart', '1899-12-25', 0, 40, 0, 1),
('47', 'Ingrid Bergman', '1915-08-29', 0, 35, 0, 1)