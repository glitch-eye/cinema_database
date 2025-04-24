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
    Previous_ID INT,
    CONSTRAINT fk_movie_restrict_age FOREIGN KEY(Age_restrict_tag)
        REFERENCES AGE_RESTRICT(TAG)
        ON DELETE SET NULL,
     CONSTRAINT fk_previous_part FOREIGN KEY (Previous_ID)
        REFERENCES Movie(ID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
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
    P_number BIGINT NOT NULL,
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
CREATE TABLE Movie_participant(
    M_ID INT NOT NULL,
    P_ID INT NOT NULL,
    PRIMARY KEY(M_ID, P_ID),
    CONSTRAINT fk_m_parti_movie FOREIGN KEY(M_ID)
                                REFERENCES Movie(ID)
                                ON DELETE CASCADE,
    CONSTRAINT fk_m_parti_attendee FOREIGN KEY(P_ID)
                                REFERENCES ATTENDEE(ID)
                                ON DELETE CASCADE
)
CREATE TABLE Movie_review_by_user(
    U_ID INT NOT NULL,
    M_ID INT NOT NULL,
    PRIMARY KEY(U_ID, M_ID),
    Details VARCHAR(200),
    Score INT NOT NULL,
    POST_date DATE NOT NULL
    CONSTRAINT fk_mov_rev_u_user FOREIGN KEY(U_ID)
                                    REFERENCES W_USER(ID)
                                    ON DELETE NO ACTION,
    CONSTRAINT fk_mov_rev_u_movie FOREIGN KEY(M_ID)
                                    REFERENCES Movie(ID)
                                    ON DELETE CASCADE
)
CREATE TABLE Screening(
    M_ID INT NOT NULL,
    T_ID INT NOT NULL,
    DATE_of_screening DATE NOT NULL,
    Time_of_srceening TIME NOT NULL,
    PRIMARY KEY(M_ID, T_ID, DATE_of_screening, Time_of_srceening),
    CONSTRAINT fk_screeninng_movie FOREIGN KEY(M_ID)
                                    REFERENCES Movie(ID)
                                    ON DELETE CASCADE,
    CONSTRAINT fk_screeninng_Theatre FOREIGN KEY(T_ID)
                                    REFERENCES Theatre(ID)
                                    ON DELETE CASCADE
)
CREATE TABLE SEAT(
    T_ID INT NOT NULL,
    ID INT NOT NULL,
    PRIMARY KEY(T_ID, ID),
    S_Type Char(1) DEFAULT 'N',
    Mutiplier_val INT DEFAULT 1,
    CONSTRAINT fk_SEAT_theatre FOREIGN KEY(T_ID)
                                REFERENCES Theatre(ID)
                                ON DELETE CASCADE,
    CONSTRAINT chk_S_Type_Mutiplier_val CHECK (
        (S_Type IN ('D', 'V') AND Mutiplier_val > 1)
        OR (S_Type NOT IN ('D', 'V'))
    )
)
CREATE TABLE EventDetails (
    Cinema_ID INT NOT NULL,
    Name_event CHAR(10) NOT NULL,
    PRIMARY KEY (Cinema_ID, Name_event),
    CONSTRAINT fk_Cinema FOREIGN KEY (Cinema_ID)
        REFERENCES Cinema(ID),
    CONSTRAINT fk_Event FOREIGN KEY (Name_event)
        REFERENCES EVENT(E_NAME)
)
CREATE TABLE Receipt (
    Receipt_ID INT PRIMARY KEY, 
    S_ID INT NULL, -- ID from W_USER
    Receipt_Date DATETIME, 
    Type_of_method CHAR(1) NOT NULL,
    CONSTRAINT fk_receipt_user FOREIGN KEY (S_ID)
        REFERENCES W_USER(ID)
        ON DELETE SET NULL
)

CREATE TABLE SERVICES (
    Service_ID INT PRIMARY KEY,
    Price INT NOT NULL
)
CREATE TABLE FOODS_DRINKS (
    FD_ID INT PRIMARY KEY,
    FD_Name VARCHAR(50) NOT NULL,
    Portion INT NOT NULL
    CONSTRAINT FD_ser_id FOREIGN KEY (FD_ID)
        REFERENCES SERVICES(Service_ID)
        ON DELETE CASCADE
)
CREATE TABLE GAMES (
    G_ID INT PRIMARY KEY,
    G_Type CHAR(1) DEFAULT 'G',
    CONSTRAINT G_ser_id FOREIGN KEY (G_ID)
        REFERENCES SERVICES(Service_ID)
        ON DELETE CASCADE
)
CREATE TABLE Services_time (
    Sell_ID INT NOT NULL,
    Sell_Time INT NOT NULL,
    PRIMARY KEY (Sell_ID,Sell_Time),
    CONSTRAINT S_ser_id FOREIGN KEY (Sell_ID)
        REFERENCES SERVICES(Service_ID) 
        ON DELETE CASCADE
)
CREATE TABLE Services_Theatre (
    T_ID INT NOT NULL,
    Ser_ID INT NOT NULL,
    PRIMARY KEY (T_ID,Ser_ID),
    CONSTRAINT Theatre_offer FOREIGN KEY (T_ID)
        REFERENCES Cinema(ID)
        ON DELETE CASCADE,
    CONSTRAINT Services_offered FOREIGN KEY (Ser_ID)
        REFERENCES Services(Service_ID)
        ON DELETE CASCADE
)
CREATE TABLE Service_cost (
    Ser_Bou_ID INT NOT NULL,
    Tran_ID INT NOT NULL,
    Amount INT NOT NULL,
    PRIMARY KEY (Ser_Bou_ID,Tran_ID),
    CONSTRAINT Services_Bought FOREIGN KEY (Ser_Bou_ID)
        REFERENCES SERVICES(Service_ID),
    CONSTRAINT Transactions FOREIGN KEY (Tran_ID)
        REFERENCES Receipt(Receipt_ID)
)
CREATE TABLE TICKET (
    Ticket_ID INT PRIMARY KEY,
    Film_ID INT NOT NULL,
    Room_ID INT NOT NULL,
    Chair_ID INT NOT NULL,
    Cost INT NOT NULL,
    Trans_ID INT NOT NULL,
    CONSTRAINT Tic_4_Film FOREIGN KEY (Film_ID)
        REFERENCES Movie(ID),
    CONSTRAINT Tic_4_Room FOREIGN KEY (Room_ID)
        REFERENCES Theatre(ID),
    CONSTRAINT Tic_4_Chair FOREIGN KEY (Chair_ID,Room_ID)
        REFERENCES SEAT(T_ID, ID)
)
CREATE TABLE Ticket_Discount (
    Event_Name CHAR(10) NOT NULL,
    Tic_ID INT NOT NULL,
    T_Type CHAR(1) DEFAULT 'T',
    T_Value INT NOT NULL,
    CONSTRAINT Dis_Events FOREIGN KEY (Event_Name)
        REFERENCES EVENT(E_Name)
        ON DELETE CASCADE,
    CONSTRAINT Dis_Tickets FOREIGN KEY (Tic_ID)
        REFERENCES TICKET(Ticket_ID)
        ON DELETE CASCADE
)
CREATE TABLE Services_Discount (
    Event_Name CHAR(10) NOT NULL,
    Serv_ID INT NOT NULL,
    S_Type CHAR(1) DEFAULT 'P',
    S_Value INT NOT NULL,
    CONSTRAINT SER_Dis_Events FOREIGN KEY (Event_Name)
        REFERENCES EVENT(E_Name)
        ON DELETE CASCADE,
    CONSTRAINT Dis_Services FOREIGN KEY (Serv_ID)
        REFERENCES SERVICES(Service_ID)
        ON DELETE CASCADE
)
