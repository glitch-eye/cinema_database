CREATE PROCEDURE sp_ManageWUser
    @Operation CHAR(1), -- 'I' = INSERT, 'U' = UPDATE, 'D' = DELETE
    @ID INT,
    @User_Name VARCHAR(50),
    @U_Location VARCHAR(50) = NULL,
    @B_Date DATE,
    @Phone_number BIGINT,
    @Is_Employee BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate Operation parameter
        IF @Operation NOT IN ('I', 'U', 'D')
        BEGIN
            THROW 50001, 'Invalid operation. Must be ''I'' (INSERT), ''U'' (UPDATE), or ''D'' (DELETE).', 1;
        END

        -- *** INSERT Operation ***
        IF @Operation = 'I'
        BEGIN
            -- Validate ID
            IF @ID IS NULL
            BEGIN
                THROW 50002, 'ID cannot be NULL for INSERT.', 1;
            END
            IF EXISTS (SELECT 1 FROM W_USER WHERE ID = @ID)
            BEGIN
                THROW 50003, 'ID already exists in W_USER.', 1;
            END

            -- Validate User_Name
            IF @User_Name IS NULL OR LTRIM(RTRIM(@User_Name)) = ''
            BEGIN
                THROW 50004, 'User_Name cannot be NULL or empty.', 1;
            END
            IF LEN(@User_Name) > 50
            BEGIN
                THROW 50005, 'User_Name cannot exceed 50 characters.', 1;
            END
            IF EXISTS (SELECT 1 FROM W_USER WHERE User_Name = @User_Name)
            BEGIN
                THROW 50006, 'User_Name is already taken.', 1;
            END

            -- Validate B_Date
            IF @B_Date IS NULL
            BEGIN
                THROW 50007, 'B_Date cannot be NULL.', 1;
            END
            IF @B_Date > GETDATE()
            BEGIN
                THROW 50008, 'B_Date cannot be in the future.', 1;
            END
            IF DATEDIFF(YEAR, @B_Date, GETDATE()) < 12
            BEGIN
                THROW 50009, 'User must be at least 12 years old.', 1;
            END

            -- Validate Phone_number
            IF @Phone_number IS NULL
            BEGIN
                THROW 50010, 'Phone_number cannot be NULL.', 1;
            END
            IF @Phone_number < 1000000000 OR @Phone_number > 9999999999
            BEGIN
                THROW 50011, 'Phone_number must be a 10-digit number.', 1;
            END

            -- Perform INSERT
            INSERT INTO W_USER (ID, User_Name, U_Location, B_Date, Phone_number, Is_Employee)
            VALUES (@ID, @User_Name, @U_Location, @B_Date, @Phone_number, @Is_Employee);

            PRINT 'User inserted successfully: ID = ' + CAST(@ID AS VARCHAR(10));
        END

        -- *** UPDATE Operation ***
        IF @Operation = 'U'
        BEGIN
            -- Validate ID exists
            IF NOT EXISTS (SELECT 1 FROM W_USER WHERE ID = @ID)
            BEGIN
                THROW 50012, 'ID does not exist in W_USER for UPDATE.', 1;
            END

            -- Validate User_Name
            IF @User_Name IS NULL OR LTRIM(RTRIM(@User_Name)) = ''
            BEGIN
                THROW 50013, 'User_Name cannot be NULL or empty.', 1;
            END
            IF LEN(@User_Name) > 50
            BEGIN
                THROW 50014, 'User_Name cannot exceed 50 characters.', 1;
            END
            IF EXISTS (SELECT 1 FROM W_USER WHERE User_Name = @User_Name AND ID != @ID)
            BEGIN
                THROW 50015, 'User_Name is already taken by another user.', 1;
            END

            -- Validate B_Date
            IF @B_Date IS NULL
            BEGIN
                THROW 50016, 'B_Date cannot be NULL.', 1;
            END
            IF @B_Date > GETDATE()
            BEGIN
                THROW 50017, 'B_Date cannot be in the future.', 1;
            END
            IF DATEDIFF(YEAR, @B_Date, GETDATE()) < 12
            BEGIN
                THROW 50018, 'User must be at least 12 years old.', 1;
            END

            -- Validate Phone_number
            IF @Phone_number IS NULL
            BEGIN
                THROW 50019, 'Phone_number cannot be NULL.', 1;
            END
            IF @Phone_number < 1000000000 OR @Phone_number > 9999999999
            BEGIN
                THROW 50020, 'Phone_number must be a 10-digit number.', 1;
            END

            -- Perform UPDATE
            UPDATE W_USER
            SET 
                User_Name = @User_Name,
                U_Location = @U_Location,
                B_Date = @B_Date,
                Phone_number = @Phone_number,
                Is_Employee = @Is_Employee
            WHERE ID = @ID;

            PRINT 'User updated successfully: ID = ' + CAST(@ID AS VARCHAR(10));
        END

        -- *** DELETE Operation ***
        IF @Operation = 'D'
        BEGIN
            -- Validate ID exists
            IF NOT EXISTS (SELECT 1 FROM W_USER WHERE ID = @ID)
            BEGIN
                THROW 50021, 'ID does not exist in W_USER for DELETE.', 1;
            END

            -- Perform DELETE
            DELETE FROM W_USER
            WHERE ID = @ID;

            PRINT 'User deleted successfully: ID = ' + CAST(@ID AS VARCHAR(10));
        END
    END TRY
    BEGIN CATCH
        -- Capture and throw error details
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorNumber INT = ERROR_NUMBER();
        THROW @ErrorNumber, @ErrorMessage, 1;
    END CATCH
END;