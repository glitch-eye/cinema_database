USE TEST
-- EXEC BookTicket 
--     @MovieID = 1,
--     @TheatreID = 401,
--     @ScreeningDate = '2025-05-10',
--     @ScreeningTime = '10:00:00',
--     @SeatID = 1,
--     @UserID = 15082010,
--     @PaymentMethod = 'C',
--     @TicketCost = 20;
-- Expected:" Ticket booked successfully. Receipt ID: X"
EXEC GetScreeningSchedule
    @CinemaID = 11,
    @StartDate = '2025-05-10',
    @EndDate = '2025-05-11'
-- Expected: Table containing 15 tuples for Hai Ba Trung Cinema