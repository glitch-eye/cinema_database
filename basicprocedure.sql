USE TEST
GO
-- CREATE PROCEDURE sp_InsertWUser
--     @ID INT,
--     @User_Name VARCHAR(50),
--     @U_Location VARCHAR(50) = NULL,
--     @B_Date DATE,
--     @Phone_number BIGINT,
--     @Is_Employee BIT = 0
-- AS
-- BEGIN
--     SET NOCOUNT ON;
--     BEGIN TRY
--         IF @ID IS NULL
--             THROW 50001, 'ID cannot be NULL.', 1;

--         IF EXISTS (SELECT 1 FROM W_USER WHERE ID = @ID)
--             THROW 50002, 'ID already exists in W_USER.', 1;

--         IF @User_Name IS NULL OR LTRIM(RTRIM(@User_Name)) = ''
--             THROW 50003, 'User_Name cannot be NULL or empty.', 1;

--         IF LEN(@User_Name) > 50
--             THROW 50004, 'User_Name cannot exceed 50 characters.', 1;

--         IF EXISTS (SELECT 1 FROM W_USER WHERE User_Name = @User_Name)
--             THROW 50005, 'User_Name is already taken.', 1;

--         IF @B_Date IS NULL
--             THROW 50006, 'B_Date cannot be NULL.', 1;

--         IF @B_Date > GETDATE()
--             THROW 50007, 'B_Date cannot be in the future.', 1;

--         IF DATEDIFF(YEAR, @B_Date, GETDATE()) < 12
--             THROW 50008, 'User must be at least 12 years old.', 1;

--         IF @Phone_number IS NULL
--             THROW 50009, 'Phone_number cannot be NULL.', 1;

--         IF @Phone_number < 100000000 OR @Phone_number > 999999999
--             THROW 50010, 'Phone_number must be a 9-digit number.', 1;

--         INSERT INTO W_USER (ID, User_Name, U_Location, B_Date, Phone_number, Is_Employee)
--         VALUES (@ID, @User_Name, @U_Location, @B_Date, @Phone_number, @Is_Employee);

--         PRINT 'User inserted successfully: ID = ' + CAST(@ID AS VARCHAR(10));
--     END TRY
--     BEGIN CATCH
--         DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
--         RAISERROR (@ErrorMessage, 16, 1);
--     END CATCH
-- END;

CREATE OR ALTER PROCEDURE sp_UpdateWUser
    @ID INT = NULL,
    @User_Name VARCHAR(50) = NULL,
    @New_User_Name VARCHAR(50) = NULL,
    @New_U_Location VARCHAR(50) = NULL,
    @New_B_Date DATE = NULL,
    @New_Phone_number BIGINT = NULL,
    @New_Is_Employee BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @ID IS NULL AND (@User_Name IS NULL OR LTRIM(RTRIM(@User_Name)) = '')
            THROW 50011, 'Must provide either ID or User_Name to update.', 1;

        IF NOT EXISTS (
            SELECT 1 FROM W_USER
            WHERE (@ID IS NOT NULL AND ID = @ID)
               OR (@User_Name IS NOT NULL AND User_Name = @User_Name)
        )
            THROW 50012, 'No matching user found to update.', 1;

        -- Validate New_User_Name
        IF @New_User_Name IS NOT NULL
        BEGIN
            IF LEN(@New_User_Name) > 50
                THROW 50013, 'New User_Name cannot exceed 50 characters.', 1;

            IF EXISTS (SELECT 1 FROM W_USER WHERE User_Name = @New_User_Name AND ID != @ID)
                THROW 50014, 'New User_Name is already taken.', 1;
        END

        -- Validate New_B_Date
        IF @New_B_Date IS NOT NULL
        BEGIN
            IF @New_B_Date > GETDATE()
                THROW 50015, 'B_Date cannot be in the future.', 1;

            IF DATEDIFF(YEAR, @New_B_Date, GETDATE()) < 12
                THROW 50016, 'User must be at least 12 years old.', 1;
        END

        -- Validate New_Phone_number
        IF @New_Phone_number IS NOT NULL
        BEGIN
            IF @New_Phone_number < 100000000 OR @New_Phone_number > 999999999
                THROW 50017, 'Phone_number must be a 9-digit number.', 1;
        END

        -- Update
        UPDATE W_USER
        SET 
            User_Name = COALESCE(@New_User_Name, User_Name),
            U_Location = COALESCE(@New_U_Location, U_Location),
            B_Date = COALESCE(@New_B_Date, B_Date),
            Phone_number = COALESCE(@New_Phone_number, Phone_number),
            Is_Employee = COALESCE(@New_Is_Employee, Is_Employee)
        WHERE (@ID IS NOT NULL AND ID = @ID)
           OR (@User_Name IS NOT NULL AND User_Name = @User_Name);

        PRINT 'User updated successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

-- CREATE PROCEDURE sp_DeleteWUser
--     @ID INT = NULL,
--     @User_Name VARCHAR(50) = NULL
-- AS
-- BEGIN
--     SET NOCOUNT ON;
--     BEGIN TRY
--         IF @ID IS NULL AND (@User_Name IS NULL OR LTRIM(RTRIM(@User_Name)) = '')
--             THROW 50018, 'Must provide either ID or User_Name to delete.', 1;

--         IF NOT EXISTS (
--             SELECT 1 FROM W_USER
--             WHERE (@ID IS NOT NULL AND ID = @ID)
--                OR (@User_Name IS NOT NULL AND User_Name = @User_Name)
--         )
--             THROW 50019, 'No matching user found to delete.', 1;

--         DELETE FROM W_USER
--         WHERE (@ID IS NOT NULL AND ID = @ID)
--            OR (@User_Name IS NOT NULL AND User_Name = @User_Name);

--         PRINT 'User deleted successfully.';
--     END TRY
--     BEGIN CATCH
--         DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
--         RAISERROR (@ErrorMessage, 16, 1);
--     END CATCH
-- END;
