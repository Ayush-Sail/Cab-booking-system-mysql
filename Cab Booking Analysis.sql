-- Database Creation --
CREATE DATABASE CabBookingSystem;
USE CabBookingSystem;

-- Table Creation --

-- Customers Table --
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Phone VARCHAR(15),
  Email_ID VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Gender, Phone, Email_ID)
VALUES
(1, 'Amit Sharma', 'Male', '9876543210', 'amit.sharma@gmail.com'),
(2, 'Priya Singh', 'Female', '9898989898', 'priya.singh@gmail.com'),
(3, 'Rohan Patel', 'Male', '9123456789', 'rohan.patel@gmail.com'),
(4, 'Sneha Mehta', 'Female', '9988776655', 'sneha.mehta@gmail.com'),
(5, 'Vikram Joshi', 'Male	', '9001234567', 'vikram.joshi@gmail.com'),
(6, 'Neelam Verma', 'Female', '9867891234', 'neelam.verma@gmail.com'),
(7, 'Rahul Nair', 'Male', '9812345670', 'rahul.nair@gmail.com'),
(8, 'Simran Kaur', 'Female', '9823987654', 'simran.kaur@gmail.com'),
(9, 'Aditya Deshpande', 'Male', '9876012345', 'aditya.deshpande@gmail.com'),
(10, 'Pooja Bhatia', 'Female', '9812312456', 'pooja.bhatia@gmail.com');

select * from Customers;

-- Drivers Table --
CREATE TABLE Drivers (
  DriverID INT PRIMARY KEY,
  DriverName VARCHAR(50),
  LicenseNo VARCHAR(30),
  Phone VARCHAR(15),
  Rating DECIMAL(2,1)
);


INSERT INTO Drivers (DriverID, DriverName, LicenseNo, Phone, Rating)
VALUES
(1, 'Rajesh Kumar', 'MH12DR001', '9823456789', 4.8),
(2, 'Anita Deshmukh', 'MH14DR002', '9812345678', 4.6),
(3, 'Suresh Yadav', 'DL10DR003', '9845671234', 4.9),
(4, 'Neha Gupta', 'GJ18DR004', '9876123456', 4.3),
(5, 'Arun Nair', 'KA05DR005', '9856741230', 4.7),
(6, 'Manoj Pillai', 'TN09DR006', '9845321789', 4.5),
(7, 'Deepa Singh', 'MH13DR007', '9890654321', 4.2),
(8, 'Ravi Patil', 'MH15DR008', '9887766554', 4.4),
(9, 'Sunita Reddy', 'TS10DR009', '9845098765', 4.9),
(10, 'Ajay Chauhan', 'RJ27DR010', '9810987654', 4.1);

select * from Drivers;

-- Cabs Table --
CREATE TABLE Cabs (
  CabID INT PRIMARY KEY,
  CabModel VARCHAR(50),
  CabNumber VARCHAR(20),
  Capacity INT,
  DriverID INT,
  FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

INSERT INTO Cabs (CabID, CabModel, CabNumber, Capacity, DriverID)
VALUES
(1, 'Hyundai i20', 'MH12AB1234', 4, 1),
(2, 'Maruti Swift', 'MH14CD5678', 4, 2),
(3, 'Honda City', 'DL10EF9012', 4, 3),
(4, 'Toyota Innova', 'GJ18GH3456', 6, 4),
(5, 'Tata Nexon', 'KA05JK7890', 4, 5),
(6, 'Suzuki WagonR', 'TN09KL4321', 4, 6),
(7, 'Mahindra XUV700', 'MH13MN8765', 6, 7),
(8, 'Hyundai Verna', 'MH15PQ2345', 4, 8),
(9, 'Kia Seltos', 'TS10RS5432', 4, 9),
(10, 'Honda Amaze', 'RJ27TU6789', 4, 10);

select * from Cabs;

-- Bookings Table --
CREATE TABLE Bookings (
  BookingID INT PRIMARY KEY,
  CustomerID INT,
  CabID INT,
  PickupLocation VARCHAR(100),
  DropLocation VARCHAR(100),
  BookingDate DATE,
  Status VARCHAR(20),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

INSERT INTO Bookings (BookingID, CustomerID, CabID, PickupLocation, DropLocation, BookingDate, Status)
VALUES
(1, 1, 3, 'Pune Station', 'Hadapsar', '2025-09-10', 'Completed'),
(2, 2, 1, 'Kothrud', 'Viman Nagar', '2025-09-12', 'Completed'),
(3, 3, 5, 'Baner', 'Shivajinagar', '2025-09-15', 'Cancelled'),
(4, 4, 2, 'FC Road', 'Katraj', '2025-09-18', 'Completed'),
(5, 5, 4, 'Swargate', 'Wakad', '2025-09-20', 'Pending'),
(6, 6, 6, 'Aundh', 'Pimpri', '2025-09-22', 'Completed'),
(7, 7, 7, 'Magarpatta', 'Kharadi', '2025-09-25', 'Completed'),
(8, 8, 8, 'Camp', 'Koregaon Park', '2025-09-26', 'Cancelled'),
(9, 9, 9, 'Hadapsar', 'Pune Airport', '2025-09-28', 'Completed'),
(10, 10, 10, 'Viman Nagar', 'Baner', '2025-09-29', 'Completed');

select * from Bookings;

-- TripDetails Table --
CREATE TABLE TripDetails (
  TripID INT PRIMARY KEY,
  BookingID INT,
  Distance_KM DECIMAL(5,2),
  Fare DECIMAL(7,2),
  TripDuration_Min INT,
  PaymentMode VARCHAR(20),
  FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO TripDetails (TripID, BookingID, Distance_KM, Fare, TripDuration_Min, PaymentMode)
VALUES
(1, 1, 12.5, 300.00, 25, 'UPI'),
(2, 2, 18.0, 450.00, 35, 'Cash'),
(3, 3, 10.2, 0.00, 0, 'Cash'),
(4, 4, 20.5, 520.00, 40, 'Credit Card'),
(5, 5, 15.8, 0.00, 0, 'UPI'),
(6, 6, 9.5, 250.00, 20, 'Cash'),
(7, 7, 14.7, 380.00, 28, 'UPI'),
(8, 8, 11.0, 0.00, 0, 'Cash'),
(9, 9, 21.3, 560.00, 42, 'Credit Card'),
(10, 10, 19.4, 490.00, 36, 'UPI');

select * from TripDetails;

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    CustomerID INT,
    Rating FLOAT,
    Comments VARCHAR(255),
    FeedbackDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Feedback (BookingID, CustomerID, Rating, Comments, FeedbackDate)
VALUES
(1, 1, 5, 'Excellent service!', '2025-10-01 10:30:00'),
(2, 2, 3, 'Cab arrived late', '2025-10-02 12:45:00'),
(3, 3, 4, 'Good ride', '2025-10-03 09:15:00'),
(4, 1, 2, 'Driver was rude', '2025-10-04 14:20:00'),
(5, 4, 5, 'Very comfortable ride', '2025-10-05 11:10:00'),
(6, 5, 1, 'Trip cancelled, disappointed', '2025-10-06 16:50:00'),
(7, 2, 4, 'Driver polite and punctual', '2025-10-07 08:25:00'),
(8, 3, 3, 'Average experience', '2025-10-08 17:40:00'),
(9, 4, 5, 'Loved the service!', '2025-10-09 19:00:00'),
(10, 5, 2, 'Vehicle not clean', '2025-10-10 13:35:00');

select * from Feedback;
----------------             ------------------

-- Problem Statements --

-- 1. Identify customers who have completed the most bookings --

SELECT 
    C.Name AS CustomerName,
    COUNT(B.BookingID) AS Completed_Bookings
FROM Bookings B
JOIN Customers C ON B.CustomerID = C.CustomerID
WHERE B.Status = 'Completed'
GROUP BY C.Name
ORDER BY Completed_Bookings DESC;

-- 2. Calculate cancellation percentage for each customer

SELECT 
    C.Name AS CustomerName,
    COUNT(CASE WHEN B.Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*) AS Cancel_Percentage
FROM Bookings B
JOIN Customers C ON B.CustomerID = C.CustomerID
GROUP BY C.Name
HAVING COUNT(CASE WHEN B.Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*) > 30;

-- 3. Determine the busiest day of the week for bookings. --

SELECT 
    DAYNAME(BookingDate) AS DayOfWeek,
    COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY DayOfWeek
ORDER BY TotalBookings DESC;

-- 4. Find the top 5 drivers who have completed the longest trips in terms of total distance.-

SELECT 
    D.DriverName,
    SUM(T.Distance_KM) AS TotalDistance
FROM TripDetails T
JOIN Bookings B ON T.BookingID = B.BookingID
JOIN Cabs C ON B.CabID = C.CabID
JOIN Drivers D ON C.DriverID = D.DriverID
WHERE B.Status = 'Completed'
GROUP BY D.DriverName
ORDER BY TotalDistance DESC
LIMIT 5;

-- 5. Calculate total revenue generated by completed bookings in the last 6 months.

SELECT 
    SUM(T.Fare) AS Total_Revenue
FROM TripDetails T
JOIN Bookings B ON T.BookingID = B.BookingID
WHERE B.Status = 'Completed'
  AND B.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);


-- 6. Identify the top 3 most frequently traveled routes.

SELECT 
    B.PickupLocation,
    B.DropLocation,
    COUNT(*) AS RouteCount
FROM Bookings B
WHERE B.Status = 'Completed'
GROUP BY B.PickupLocation, B.DropLocation
ORDER BY RouteCount DESC
LIMIT 3;


-- 7. Determine if higher-rated drivers earn higher total fares.

SELECT 
    D.DriverName,
    D.Rating,
    SUM(T.Fare) AS Total_Fare
FROM Drivers D
JOIN Cabs C ON D.DriverID = C.DriverID
JOIN Bookings B ON C.CabID = B.CabID
JOIN TripDetails T ON B.BookingID = T.BookingID
WHERE B.Status = 'Completed'
GROUP BY D.DriverName, D.Rating
ORDER BY D.Rating DESC;

-- 8. Analyze whether weekend bookings differ from weekday bookings.

SELECT 
    CASE 
        WHEN DAYOFWEEK(BookingDate) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS DayType,
    COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY DayType;

-- 9 Find the average customer rating for each driver

-- Calculate each driver's average rating from customer feedback
SELECT 
    D.DriverName,
    ROUND(AVG(F.Rating), 2) AS AverageRating,
    COUNT(F.FeedbackID) AS TotalFeedbacks
FROM Feedback F
JOIN Bookings B ON F.BookingID = B.BookingID
JOIN Cabs C ON B.CabID = C.CabID
JOIN Drivers D ON C.DriverID = D.DriverID
GROUP BY D.DriverName
ORDER BY AverageRating DESC;

