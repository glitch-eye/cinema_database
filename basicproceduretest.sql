USE TEST;
GO

-- === Cleanup ===
PRINT '--- Cleaning up W_USER table ---';
DELETE FROM W_USER;
GO

-- === INSERT TESTS ===
PRINT '--- INSERT TESTS ---';

BEGIN TRY
    EXEC sp_InsertWUser 1, 'Alice', 'NYC', '2000-01-01', 123456789, 1;
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser 1, 'Bob', 'LA', '1990-01-01', 234567890, 0; -- Duplicate ID
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser 2, 'Alice', 'LA', '1990-01-01', 345678901, 0; -- Duplicate username
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser NULL, 'Charlie', 'Boston', '1995-01-01', 456789012, 0; -- NULL ID
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser 3, '   ', 'Chicago', '1995-01-01', 567890123, 0; -- Empty username
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser 4, 'David', 'Seattle', '2099-01-01', 678901234, 0; -- Future B_Date
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser 5, 'Eva', 'Houston', '2015-01-01', 789012345, 0; -- Too young
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

BEGIN TRY
    EXEC sp_InsertWUser 6, 'Frank', 'Miami', '1990-01-01', 1234567890, 0; -- Invalid phone
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- === UPDATE TESTS ===
PRINT '--- UPDATE TESTS ---';

-- Valid update by ID
BEGIN TRY
    EXEC sp_UpdateWUser @ID = 1, @New_User_Name = 'Alice_Updated';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: non-existent ID
BEGIN TRY
    EXEC sp_UpdateWUser @ID = 99, @New_User_Name = 'Ghost';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Add another valid user
BEGIN TRY
    EXEC sp_InsertWUser 7, 'Henry', 'DC', '1990-01-01', 987654321, 0;
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: username collision
BEGIN TRY
    EXEC sp_UpdateWUser @ID = 1, @New_User_Name = 'Henry';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: future birthdate
BEGIN TRY
    EXEC sp_UpdateWUser @ID = 1, @New_B_Date = '2090-01-01';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: bad phone number
BEGIN TRY
    EXEC sp_UpdateWUser @ID = 1, @New_Phone_number = 111;
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Valid update by User_Name
BEGIN TRY
    EXEC sp_UpdateWUser @User_Name = 'Henry', @New_U_Location = 'UpdatedDC';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: no ID or username
BEGIN TRY
    EXEC sp_UpdateWUser @New_User_Name = 'NoTarget';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- === DELETE TESTS ===
PRINT '--- DELETE TESTS ---';

-- Valid delete by ID
BEGIN TRY
    EXEC sp_DeleteWUser @ID = 7;
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: non-existent ID
BEGIN TRY
    EXEC sp_DeleteWUser @ID = 100;
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Valid delete by User_Name
BEGIN TRY
    EXEC sp_DeleteWUser @User_Name = 'Alice_Updated';
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH

-- Invalid: missing identifiers
BEGIN TRY
    EXEC sp_DeleteWUser;
END TRY BEGIN CATCH PRINT ERROR_MESSAGE(); END CATCH
