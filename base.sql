-- CREATE DATABASE TEST
USE TEST
CREATE TABLE CINEMA(
    ID INT PRIMARY KEY,
    C_Name VARCHAR(20) NOT NULL,
    C_Status CHAR(10),
    C_Location VARCHAR(20) NOT NULL 
)

CREATE TABLE THEATRE(
    ID INT PRIMARY KEY,
    Size_Type CHAR(1) NOT NULL,
    Capacity INT NOT NULL,
    C_ID INT NOT NULL,
    CONSTRAINT fk_Theatre_cine_ID FOREIGN KEY(C_ID)
                            REFERENCES CINEMA(ID)
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
    TAG VARCHAR(5) PRIMARY KEY,
    Age_permit INT NOT NULL
)
CREATE TABLE MOVIE(
    ID INT PRIMARY KEY,
    M_name VARCHAR(50) NOT NULL,
    M_duration INT NOT NULL,
    M_premise DATE,
    SUB_language VARCHAR(10),
    DUB_language VARCHAR(10) NOT NULL,
    Age_restrict_tag VARCHAR(5),
    Previous_ID INT,
    Avg_Score DECIMAL(4, 2) DEFAULT 0,
    CONSTRAINT fk_movie_restrict_age FOREIGN KEY(Age_restrict_tag)
        REFERENCES AGE_RESTRICT(TAG)
        ON DELETE SET NULL,
     CONSTRAINT fk_previous_part FOREIGN KEY (Previous_ID)
        REFERENCES MOVIE(ID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE EVENT(
    E_Name VARCHAR(30) PRIMARY KEY,
    D_cription VARCHAR(5000),
    Start_dat_ DATE NOT NULL,
    END_date DATE NOT NULL
)
CREATE TABLE W_USER(
    ID INT PRIMARY KEY,
    User_Name VARCHAR(50) NOT NULL UNIQUE,
    U_Location VARCHAR(50),
    B_Date DATE NOT NULL,
    Phone_number BIGINT NOT NULL,
    Is_Employee BIT,
    CONSTRAINT chk_birth_date CHECK (
        DATEDIFF(YEAR, B_Date, GETDATE()) >= 12
    )
)

CREATE TABLE GENRE(
    G_name VARCHAR(20) PRIMARY KEY,
    G_Description CHAR(5000)
)
CREATE TABLE Movie_Genre(
    ID INT NOT NULL,
    M_Genre VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID, M_Genre),
    CONSTRAINT fk_GENRE_table_movie FOREIGN KEY (ID)
        REFERENCES MOVIE(ID)       -- Links to Movie table
        ON DELETE CASCADE,
    CONSTRAINT fk_GENRE_table_genre FOREIGN KEY (M_Genre)
        REFERENCES GENRE(G_name) -- Links to Genre table
        ON DELETE CASCADE
)

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
CREATE TABLE Movie_Participant(
    M_ID INT NOT NULL,
    P_ID INT NOT NULL,
    PRIMARY KEY(M_ID, P_ID),
    CONSTRAINT fk_m_parti_movie FOREIGN KEY(M_ID)
                                REFERENCES MOVIE(ID)
                                ON DELETE CASCADE,
    CONSTRAINT fk_m_parti_attendee FOREIGN KEY(P_ID)
                                REFERENCES ATTENDEE(ID)
                                ON DELETE CASCADE
)
CREATE TABLE Movie_Review(
    U_ID INT NOT NULL,
    M_ID INT NOT NULL,
    PRIMARY KEY(U_ID, M_ID),
    Details VARCHAR(5000),
    Score INT NOT NULL,
    Post_Date DATE NOT NULL
    CONSTRAINT fk_mov_rev_u_user FOREIGN KEY(U_ID)
                                    REFERENCES W_USER(ID)
                                    ON DELETE NO ACTION,
    CONSTRAINT fk_mov_rev_u_movie FOREIGN KEY(M_ID)
                                    REFERENCES MOVIE(ID)
                                    ON DELETE CASCADE
)
CREATE TABLE SCREENING(
    M_ID INT NOT NULL,
    T_ID INT NOT NULL,
    Date_of_screening DATE NOT NULL,
    Time_of_srceening TIME NOT NULL,
    PRIMARY KEY(M_ID, T_ID, Date_of_screening, Time_of_srceening),
    CONSTRAINT fk_screeninng_movie FOREIGN KEY(M_ID)
                                    REFERENCES MOVIE(ID)
                                    ON DELETE CASCADE,
    CONSTRAINT fk_screeninng_Theatre FOREIGN KEY(T_ID)
                                    REFERENCES THEATRE(ID)
                                    ON DELETE CASCADE
)
CREATE TABLE SEAT(
    T_ID INT NOT NULL,
    ID INT NOT NULL,
    PRIMARY KEY(T_ID, ID),
    S_Type Char(1) DEFAULT 'N',
    Mutiplier_Val INT DEFAULT 1,
    Status_ CHAR(1) DEFAULT 'A',
    CONSTRAINT fk_SEAT_theatre FOREIGN KEY(T_ID)
                                REFERENCES THEATRE(ID)
                                ON DELETE CASCADE,
    CONSTRAINT chk_S_Type_Mutiplier_val CHECK (
        (S_Type IN ('D', 'V') AND Mutiplier_val > 1)
        OR (S_Type NOT IN ('D', 'V'))
    )
)
CREATE TABLE Event_Details (
    Cinema_ID INT NOT NULL,
    Name_event VARCHAR(30) NOT NULL,
    PRIMARY KEY (Cinema_ID, Name_event),
    CONSTRAINT fk_Cinema FOREIGN KEY (Cinema_ID)
        REFERENCES CINEMA(ID),
    CONSTRAINT fk_Event FOREIGN KEY (Name_event)
        REFERENCES EVENT(E_Name)
)
CREATE TABLE RECEIPT (
    Receipt_ID INT PRIMARY KEY, 
    U_ID INT NULL, -- ID from W_USER
    Receipt_Date DATETIME, 
    Method CHAR(1) NOT NULL,
    Total_Amount DECIMAL(5,2) DEFAULT 0,
    CONSTRAINT fk_receipt_user FOREIGN KEY (U_ID)
        REFERENCES W_USER(ID)
        ON DELETE SET NULL
)

CREATE TABLE SERVICES (
    Service_ID INT PRIMARY KEY,
    Price_VND INT NOT NULL
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
CREATE TABLE Services_Time (
    Sell_ID INT NOT NULL,
    Sell_Time VARCHAR(11) NOT NULL,
    PRIMARY KEY (Sell_ID,Sell_Time),
    CONSTRAINT S_ser_id FOREIGN KEY (Sell_ID)
        REFERENCES SERVICES(Service_ID) 
        ON DELETE CASCADE
)
CREATE TABLE Services_Cinema (
    C_ID INT NOT NULL,
    Ser_ID INT NOT NULL,
    PRIMARY KEY (C_ID,Ser_ID),
    CONSTRAINT Theatre_offer FOREIGN KEY (C_ID)
        REFERENCES Cinema(ID)
        ON DELETE CASCADE,
    CONSTRAINT Services_offered FOREIGN KEY (Ser_ID)
        REFERENCES Services(Service_ID)
        ON DELETE CASCADE
)
CREATE TABLE Service_Cost (
    Ser_Bou_ID INT NOT NULL,
    Tran_ID INT NOT NULL,
    Amount INT NOT NULL,
    Cost INT NULL,
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
    Date_frame DATE NOT NULL,
    Time_frame TIME NOT NULL,
    Cost INT NULL,
    Trans_ID INT NOT NULL,
    CONSTRAINT Tic_4_Film FOREIGN KEY (Film_ID,Date_frame,Time_frame)
        REFERENCES SCREENING(M_ID,Date_of_screening,Time_of_screening),
    CONSTRAINT Tic_4_Chair FOREIGN KEY (Room_ID,Chair_ID)
        REFERENCES SEAT(T_ID,ID),
    CONSTRAINT odered_by FOREIGN KEY (Trans_ID)
        REFERENCES Receipt(Receipt_ID),
)
CREATE TABLE Ticket_Discount (
    Event_Name VARCHAR(30) NOT NULL,
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
    Event_Name VARCHAR(30) NOT NULL,
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
