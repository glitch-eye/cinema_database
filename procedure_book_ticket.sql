USE TEST
GO
CREATE OR ALTER PROCEDURE BookTicket
    @MovieID INT,
    @TheatreID INT,
    @ScreeningDate DATE,
    @ScreeningTime TIME,
    @SeatID INT,
    @UserID INT,
    @PaymentMethod CHAR(1),
    @TicketCost INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ReceiptID INT;

    BEGIN TRY
        -- Start transaction
        IF @@TRANCOUNT = 0
            BEGIN TRANSACTION;

        -- Check if the seat is available and exists for the theatre
        IF NOT EXISTS (
            SELECT 1
            FROM SEAT
            WHERE T_ID = @TheatreID
              AND ID = @SeatID
              AND Status_ = 'A'
        )
        BEGIN
            THROW 50001, 'Seat is not available or does not exist.', 1;
        END

        -- Check if the screening exists
        IF NOT EXISTS (
            SELECT 1
            FROM Screening
            WHERE M_ID = @MovieID
              AND T_ID = @TheatreID
              AND DATE_of_screening = @ScreeningDate
              AND Time_of_screening = @ScreeningTime  -- Đã sửa
        )
        BEGIN
            THROW 50002, 'Specified screening does not exist.', 1;
        END

        -- Check if the user exists
        IF NOT EXISTS (
            SELECT 1
            FROM W_USER
            WHERE ID = @UserID
        )
        BEGIN
            THROW 50003, 'User does not exist.', 1;
        END

        -- Validate payment method
        IF @PaymentMethod NOT IN ('C', 'D', 'P')
        BEGIN
            THROW 50004, 'Invalid payment method.', 1;
        END

        -- Create a new receipt
        INSERT INTO Receipt (U_ID, Receipt_Date, Method)  -- Đã sửa 'S_ID' và 'Type_of_method'
        VALUES (@UserID, GETDATE(), @PaymentMethod);

        -- Get the generated Receipt_ID
        SET @ReceiptID = SCOPE_IDENTITY();

        -- Create the ticket
        INSERT INTO TICKET (Ticket_ID, Film_ID, Room_ID, Chair_ID, Date_frame, Time_frame, Cost, Trans_ID)
        VALUES (
            (SELECT ISNULL(MAX(Ticket_ID), 0) + 1 FROM TICKET), -- Generate new Ticket_ID
            @MovieID,
            @TheatreID,
            @SeatID,
            @ScreeningDate,
            @ScreeningTime,
            @TicketCost,
            @ReceiptID
        );

        -- Update seat status to 'B' (Booked)
        UPDATE SEAT
        SET Status_ = 'B'
        WHERE T_ID = @TheatreID
          AND ID = @SeatID;

        -- Commit transaction
        IF @@TRANCOUNT > 0
            COMMIT TRANSACTION;

        -- Return success message
        SELECT 'Ticket booked successfully. Receipt ID: ' + CAST(@ReceiptID AS VARCHAR(10)) AS Message;
    END TRY
    BEGIN CATCH
        -- Rollback transaction on error
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Return error details
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
