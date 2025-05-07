-- use TEST
CREATE PROCEDURE update_dta_user
    @ID INT,
    @USER_NAME VARCHAR(50) = NULL,
    @U_LOCATION VARCHAR(20) = NULL,
    @B_Date DATE = NULL,
    @P_number BIGINT = NULL,
    @Pass_word NVARCHAR(256) = NULL
AS
BEGIN
    -- Kiểm tra nếu ngày sinh hợp lệ (>= 12 tuổi)
    IF @B_Date IS NOT NULL AND DATEDIFF(YEAR, @B_Date, GETDATE()) < 12
    BEGIN
        PRINT 'Ngày sinh không hợp lệ. Người dùng phải từ 12 tuổi trở lên.';
        RETURN;
    END

    -- Cập nhật dữ liệu trong bảng
    UPDATE W_USER
    SET 
        USER_NAME = COALESCE(@USER_NAME, USER_NAME),
        U_LOCATION = COALESCE(@U_LOCATION, U_LOCATION),
        B_Date = COALESCE(@B_Date, B_Date),
        P_number = COALESCE(@P_number, P_number),
        Pass_word = COALESCE(@Pass_word, Pass_word)
    WHERE ID = @ID;
END
GO
-- Thủ tục xóa người dùng theo ID
-- CREATE PROCEDURE delete_user
--     @ID INT
-- AS
-- BEGIN
--     DELETE FROM W_USER WHERE ID = @ID;
-- END
-- GO