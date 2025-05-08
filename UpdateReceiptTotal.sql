-- USE TEST
CREATE PROCEDURE UpdateReceiptTotal
    @ReceiptID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalAmount DECIMAL(10,2);

    -- Calculate total amount using CTEs to avoid nested aggregates
    WITH TicketDiscounts AS (
        SELECT 
            td.Tic_ID,
            MAX(CASE 
                WHEN td.T_Type = 'T' THEN td.T_Value
                ELSE t.Cost * td.T_Value / 100.0
            END) AS Discount
        FROM Ticket_Discount td
        INNER JOIN EVENT e ON e.E_NAME = td.Event_Name
        INNER JOIN TICKET t ON t.Ticket_ID = td.Tic_ID
        WHERE e.Start_dat_ <= GETDATE()
        AND GETDATE() <= e.END_date
        GROUP BY td.Tic_ID
    ),
    ServiceDiscounts AS (
        SELECT 
            sd.Serv_ID,
            MAX(CASE 
                WHEN sd.S_Type = 'P' THEN s.Price_VND * sd.S_Value / 100.0
                ELSE sd.S_Value
            END) AS Discount
        FROM Services_Discount sd
        INNER JOIN EVENT e ON e.E_NAME = sd.Event_Name
        INNER JOIN SERVICES s ON s.Service_ID = sd.Serv_ID
        WHERE e.Start_dat_ <= GETDATE()
        AND GETDATE() <= e.END_date
        GROUP BY sd.Serv_ID
    )
    SELECT @TotalAmount = CAST((
        -- Ticket costs with discounts
        COALESCE((
            SELECT SUM(CAST(
                t.Cost - COALESCE(td.Discount, 0) AS DECIMAL(10,2))
            )
            FROM TICKET t
            LEFT JOIN TicketDiscounts td ON td.Tic_ID = t.Ticket_ID
            WHERE t.Trans_ID = @ReceiptID
        ), 0) +
        -- Service costs with discounts
        COALESCE((
            SELECT SUM(CAST(
                sc.Amount * (s.Price_VND - COALESCE(sd.Discount, 0)) AS DECIMAL(10,2))
            )
            FROM Service_cost sc
            INNER JOIN SERVICES s ON s.Service_ID = sc.Ser_Bou_ID
            LEFT JOIN ServiceDiscounts sd ON sd.Serv_ID = s.Service_ID
            WHERE sc.Tran_ID = @ReceiptID
        ), 0)
    ) AS DECIMAL(10,2))

    -- Check for overflow
    IF @TotalAmount > 99999999.99
    BEGIN
        RAISERROR ('Total amount exceeds DECIMAL(10,2) limit of 99999999.99.', 16, 1);
        RETURN;
    END

    -- Update Receipt.Total_Amount
    UPDATE Receipt
    SET Total_Amount = @TotalAmount
    WHERE Receipt_ID = @ReceiptID
END;
GO
