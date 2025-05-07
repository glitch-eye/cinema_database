
CREATE PROCEDURE register
    @USER_NAME VARCHAR(50),
    @U_LOCATION VARCHAR(20),
    @B_Date DATE,
    @P_number BIGINT,
    @Pass_word NVARCHAR(256),
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    -- Kiểm tra nếu ngày sinh hợp lệ (>= 12 tuổi)
    IF DATEDIFF(YEAR, @B_Date, GETDATE()) < 12
    BEGIN
        PRINT 'Ngày sinh không hợp lệ. Người dùng phải từ 12 tuổi trở lên.';
        RETURN;
    END
    -- Generate new ID by finding the maximum ID and adding 1
    DECLARE @NewUserID INT;
    SELECT @NewUserID = ISNULL(MAX(ID), 0) + 1 FROM W_USER;
    
    -- Insert the new user
    INSERT INTO W_USER (ID, USER_NAME, U_LOCATION, B_Date, P_number, S_FLAG, Pass_word)
    VALUES (@NewUserID, @USER_NAME, @U_LOCATION, @B_Date, @P_number, 0, @Pass_word);

    -- Set the output parameter
    SET @NewID = @NewUserID;

    -- Return the new ID (optional, for query result)
    SELECT @NewID AS ID;
END;