const express = require("express");
const sql = require("mssql");
const cors = require("cors");

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

const config = {
    user: 'test',
    password: 'test123456789',
    server: 'localhost',
    database: 'TEST',
    options: {
        encrypt: false,
        trustServerCertificate: true
    }
};

// API: Lấy danh sách rạp chiếu
app.get("/api/cinemas", async (req, res) => {
    try {
        await sql.connect(config);
        const result = await sql.query("SELECT * FROM Cinema");
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// API: Thêm rạp mới
app.post("/api/cinemas", async (req, res) => {
    const { id, name, status, location } = req.body;

    try {
        await sql.connect(config);

        // 1. Tạo request để kiểm tra ID tồn tại
        const checkRequest = new sql.Request();
        const existing = await checkRequest
            .input("id", sql.Int, id)
            .query("SELECT * FROM Cinema WHERE ID = @id");

        if (existing.recordset.length > 0) {
            return res.status(400).json({ message: "ID đã tồn tại." });
        }

        // 2. Tạo request mới để insert
        const insertRequest = new sql.Request();
        await insertRequest
            .input("id", sql.Int, id)
            .input("name", sql.NVarChar, name)
            .input("status", sql.NVarChar, status)
            .input("location", sql.NVarChar, location)
            .query("INSERT INTO Cinema (ID, C_Name, C_Status, C_Location) VALUES (@id, @name, @status, @location)");

        res.json({ message: "Thêm rạp thành công!" });
    } catch (err) {
        console.error("Lỗi POST:", err);
        res.status(500).json({ message: "Lỗi server khi thêm rạp.", error: err.message });
    } finally {
        sql.close();
    }
});

app.delete("/api/cinemas/:id", async (req, res) => {
    const { id } = req.params;
    try {
        await sql.connect(config);
        const result = await sql.query`DELETE FROM Cinema WHERE ID = ${id}`;

        if (result.rowsAffected[0] === 0) {
            return res.status(404).json({ message: "Không tìm thấy rạp để xóa." });
        }

        res.json({ message: "Xóa rạp thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// API: Cập nhật rạp chiếu
app.put("/api/cinemas/:id", async (req, res) => {
    const { id } = req.params;
    const { name, status, location } = req.body;

    const numericId = Number(id);
    if (isNaN(numericId)) {
        return res.status(400).json({ message: "ID không hợp lệ." });
    }

    try {
        await sql.connect(config);

        const request = new sql.Request();
        request.input("id", sql.Int, numericId);
        request.input("name", sql.VarChar, name);
        request.input("status", sql.VarChar, status);
        request.input("location", sql.VarChar, location);

        const result = await request.query(`
            UPDATE Cinema
            SET C_Name = @name, C_Status = @status, C_Location = @location
            WHERE ID = @id
        `);

        if (result.rowsAffected[0] === 0) {
            return res.status(404).json({ message: "Không tìm thấy rạp để cập nhật." });
        }

        res.json({ message: "Cập nhật rạp thành công!" });
    } catch (err) {
        console.error("Lỗi khi cập nhật rạp:", err);
        res.status(500).json({ message: "Đã xảy ra lỗi khi cập nhật rạp.", error: err.message });
    }
});

app.get("/api/theatres", async (req, res) => {
    try {
        await sql.connect(config);
        const result = await sql.query("SELECT * FROM THEATRE");
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    } finally {
        sql.close();
    }
});

app.get("/api/screenings", async (req, res) => {
    console.log(">>> req.query:", req.query);
    const { cinemaId, startDate, endDate } = req.query;

    if (!cinemaId || !startDate || !endDate) {
        return res.status(400).json({ error: "Thiếu tham số cinemaId, startDate hoặc endDate." });
    }

    try {
        await sql.connect(config);
        const request = new sql.Request();

        const result = await request
            .input("CinemaID", sql.Int, parseInt(cinemaId))
            .input("StartDate", sql.Date, startDate)
            .input("EndDate", sql.Date, endDate)
            .execute("GetScreeningSchedule");

        res.json(result.recordset);
    } catch (err) {
        console.error("Lỗi khi gọi GetScreeningSchedule:", err);
        res.status(500).json({ error: err.message });
    } finally {
        sql.close();
    }
});

// API: Đặt vé xem phim
app.post("/api/book-ticket", async (req, res) => {
    const {
        movieId, theatreId, screeningDate, screeningTime,
        seatId, userId, paymentMethod, ticketCost
    } = req.body;

    try {
        await sql.connect(config);
        const request = new sql.Request();

        const result = await request
            .input("MovieID", sql.Int, movieId)
            .input("TheatreID", sql.Int, theatreId)
            .input("ScreeningDate", sql.Date, screeningDate)
            .input("ScreeningTime", sql.Time, screeningTime)
            .input("SeatID", sql.Int, seatId)
            .input("UserID", sql.Int, userId)
            .input("PaymentMethod", sql.Char(1), paymentMethod)
            .input("TicketCost", sql.Int, ticketCost)
            .execute("BookTicket");

        res.json({ message: result.recordset[0]?.Message || "Đặt vé thành công." });
    } catch (err) {
        console.error("Lỗi khi đặt vé:", err);
        res.status(500).json({ error: err.message });
    } finally {
        sql.close();
    }
});

// Khởi động server
app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
});

app.get("/", (req, res) => {
    res.send("API server đang hoạt động. Vui lòng truy cập qua các route như /cinemas.");
});

