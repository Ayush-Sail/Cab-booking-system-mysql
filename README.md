# Cab-booking-system-mysql
Designed and queried a cab booking database in MySQL — covering bookings, trips, driver performance, and revenue analysis.

# 🚖 Cab Booking System — SQL Project

A relational database project built in MySQL that simulates a real-world cab booking platform. It covers database design, data insertion, and business-driven SQL queries to extract meaningful operational insights.

---

## Overview

This project models a cab booking system with customers, drivers, cabs, bookings, trip details, and feedback. The goal is to practice SQL concepts including joins, aggregations, pivot-style queries, and conditional logic to answer real business questions.

---

## Database Schema

The database `CabBookingSystem` consists of 6 interconnected tables:

| Table | Description |
|---|---|
| `Customers` | Stores customer details — name, gender, phone, email |
| `Drivers` | Stores driver details — license, phone, rating |
| `Cabs` | Maps cabs to drivers — model, cab number, capacity |
| `Bookings` | Records each booking — pickup/drop location, date, status |
| `TripDetails` | Stores trip metrics — distance, fare, duration, payment mode |
| `Feedback` | Customer ratings and comments for completed bookings |

### Entity Relationships

```
Customers ──< Bookings >── Cabs ──── Drivers
                  │
             TripDetails
                  │
              Feedback
```

---

## Problem Statements & Queries

| # | Business Question |
|---|---|
| 1 | Identify customers with the most completed bookings |
| 2 | Calculate cancellation percentage per customer |
| 3 | Determine the busiest day of the week for bookings |
| 4 | Find top 5 drivers by total distance covered |
| 5 | Calculate total revenue from completed bookings in the last 6 months |
| 6 | Identify the top 3 most frequently travelled routes |
| 7 | Determine if higher-rated drivers earn higher total fares |
| 8 | Analyze weekend vs weekday booking patterns |
| 9 | Find the average customer rating for each driver |

---

## Key SQL Concepts Used

- `JOIN` (INNER JOIN across multiple tables)
- `GROUP BY` with aggregate functions (`COUNT`, `SUM`, `AVG`, `ROUND`)
- `CASE WHEN` for conditional logic
- `HAVING` for post-aggregation filtering
- `DATE_SUB` and `CURDATE()` for date-based filtering
- `DAYNAME` and `DAYOFWEEK` for weekday analysis
- `LIMIT` for top-N queries
- Foreign key constraints for referential integrity

---

## Sample Data

- **10 Customers** — Indian names with realistic phone numbers and email IDs
- **10 Drivers** — Ratings ranging from 4.1 to 4.9
- **10 Cabs** — Popular Indian car models (Innova, Nexon, Seltos, etc.)
- **10 Bookings** — Pune-based pickup/drop locations with mixed statuses
- **10 Trip Records** — Distances, fares, and payment modes (UPI, Cash, Credit Card)
- **10 Feedback Entries** — Ratings from 1 to 5 with comments

---

## How to Run

1. Open your MySQL client (MySQL Workbench, DBeaver, or CLI)
2. Run the full `.sql` file:
   ```sql
   SOURCE My_NEW_SQL_PROJECT_FILE.sql;
   ```
3. Or copy-paste sections to run table creation, data insertion, and queries separately

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL | Database engine |
| MySQL Workbench | Query execution and schema visualization |
| SQL | DDL (schema design) + DML (data + queries) |

---

## Project Structure

```
cab-booking-sql/
│
├── My_NEW_SQL_PROJECT_FILE.sql   # Full SQL script (schema + data + queries)
└── README.md                     # Project documentation
```
