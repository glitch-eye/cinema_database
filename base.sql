CREATE DATABASE TEST
USE TEST
CREATE TABLE Cinema(
    ID INT PRIMARY KEY,
    C_Name VARCHAR(20) NOT NULL,
    C_Status CHAR(10),
    C_location VARCHAR(20) NOT NULL 
)

CREATE TABLE Theatre(
    ID INT PRIMARY KEY,
    Size_Type CHAR(1) NOT NULL,
    Capacity INT NOT NULL,
    C_ID INT NOT NULL,
    CONSTRAINT fk_Theatre_cine_ID FOREIGN KEY(C_ID)
                            REFERENCES Cinema(ID)
                            ON DELETE CASCADE
)

-- INSERT INTO Cinema (ID, C_Name, C_Status, C_location) VALUES
-- (1, 'Central Cineplex', 'Active', 'Downtown'),
-- (2, 'Grand Theatre', 'Active', 'Uptown'),
-- (3, 'Movie World', 'Closed', 'City Center');

-- INSERT INTO Theatre (ID, Size_Type, Capacity, C_ID) VALUES
-- (101, 'L', 250, 1),  -- Linked to 'Central Cineplex'
-- (102, 'S', 100, 2),  -- Linked to 'Grand Theatre'
-- (103, 'M', 150, 3);  -- Linked to 'Movie World'
CREATE TABLE AGE_RESTRICT(
    TAG CHAR(10) PRIMARY KEY,
    Age_permit INT NOT NULL
)
CREATE TABLE Movie(
    ID INT PRIMARY KEY,
    M_name CHAR(20) NOT NULL,
    M_duration INT NOT NULL,
    M_premise DATE,
    SUB_language CHAR(10),
    DUB_language CHAR(10) NOT NULL,
    Age_restrict_tag CHAR(10),
    CONSTRAINT fk_movie_restrict_age FOREIGN KEY(Age_restrict_tag)
                                        REFERENCES AGE_RESTRICT(TAG)
                                        ON DELETE SET NULL
)
CREATE TABLE EVENT(
    E_NAME CHAR(10) PRIMARY KEY,
    D_cription VARCHAR(30),
    Start_dat_ DATE NOT NULL,
    END_date DATE NOT NULL
)
CREATE TABLE W_USER(
    ID INT PRIMARY KEY,
    USER_NAME VARCHAR(50) NOT NULL UNIQUE,
    U_LOCATION VARCHAR(20),
    B_Date DATE NOT NULL,
    P_number INT NOT NULL,
    S_FLAG BIT,
    CONSTRAINT chk_birth_date CHECK (
        DATEDIFF(YEAR, B_Date, GETDATE()) >= 12
    )
)

CREATE TABLE GENRE(
    G_name char(10) PRIMARY KEY,
    G_DESCRIPTION CHAR(50)
)
CREATE TABLE Movie_Genre(
    ID INT NOT NULL,
    M_Genre CHAR(10) NOT NULL,
    PRIMARY KEY(ID, M_Genre),
    CONSTRAINT fk_GENRE_table_movie FOREIGN KEY (ID)
        REFERENCES MOVIE(ID)       -- Links to Movie table
        ON DELETE CASCADE,
    CONSTRAINT fk_GENRE_table_genre FOREIGN KEY (M_Genre)
        REFERENCES GENRE(G_name) -- Links to Genre table
        ON DELETE CASCADE
)
CREATE TABLE SERI(
    M_ID_1 INT NOT NULL,
    M_ID_2 INT NOT NULL,
    PRIMARY KEY(M_ID_1, M_ID_2),
    CONSTRAINT chk_SERI_no_self_relationship CHECK (M_ID_1 != M_ID_2),
    CONSTRAINT fk_seri_m_1 FOREIGN KEY (M_ID_1)
        REFERENCES MOVIE(ID)       -- Links to Movie table
        ON DELETE NO ACTION,
    CONSTRAINT fk_seri_m_2 FOREIGN KEY (M_ID_2)
        REFERENCES MOVIE(ID) -- Links to Genre table
        ON DELETE NO ACTION
)
-- ở đây là seri nên khi có 3 phim trong seri thì ta có sample table
-- ID_1       |ID_2
-- 1          |2
-- 1          |3
-- 2          |1
-- 2          |3
-- 3          |1
-- 3          |2
CREATE TABLE ATTENDEE(
    ID INT PRIMARY KEY,
    P_NAME VARCHAR(50) NOT NULL,
    B_Date DATE,
    Total_Directed INT DEFAULT 0,       
    Total_Acted INT DEFAULT 0  ,
    Is_Director BIT DEFAULT 0,          -- 1 = Director, 0 = Not a Director
    Is_Actor BIT DEFAULT 0,             -- 1 = Actor, 0 = Not an Actor         
    CONSTRAINT chk_director_total CHECK (
        (Is_Director = 1 AND Total_Directed >= 0) OR 
        (Is_Director = 0 AND Total_Directed = 0)
    ),
    CONSTRAINT chk_actor_total CHECK (
        (Is_Actor = 1 AND Total_Acted >= 0) OR 
        (Is_Actor = 0 AND Total_Acted = 0)
    )
)
