Party Booking System - Database

Description - 
This is the "database part" of a Party Booking System. 

It manages:  
- Customers  
- Bookings  
- Event packages  
- Performers  
- Party items  
- Payments  

The database includes "sample data" for testing queries and reports.

 Database Technologies
- Oracle SQL 
- SQL scripts include "table creation, constraints, and sample data"  

## Features
- Complete **relational schema** with primary and foreign key constraints  
- Data integrity using **CHECK constraints**  
- Sample data for **customers, bookings, packages, performers, party items, and payments**  
- Supports queries with `JOIN`, `GROUP BY`, `BETWEEN`, `DISTINCT`, `TO_CHAR`, and subqueries  
- Referential integrity tested for **DELETE** and **UPDATE** operations  

## Setup
1. Open your Oracle SQL environment (e.g., SQL Developer).  
2. Run the SQL script `party_booking_db.sql` to create tables and insert sample data.  
3. Verify the tables and data using `SELECT * FROM TableName;`.  

## Sample Queries
- **Bookings with total amount between 4,000 and 8,000:**  
  ```sql
  SELECT BookingID, TotalAmount
  FROM Booking
  WHERE TotalAmount BETWEEN 4000 AND 8000;

- **Distinct payment methods:**
   
  ```sql
  SELECT DISTINCT Method FROM Payment;


- **Total revenue from completed payments:**

  ```sql
  SELECT SUM(Amount) AS Total_Revenue_Completed
  FROM Payment
  WHERE Status = 'Completed';


- **Customers with total payment > 8,000:**

  ```sql
  SELECT c.CustomerID, c.FirstName || ' ' || c.LastName AS CustomerName
  FROM Customer c
  WHERE c.CustomerID IN (
     SELECT b.CustomerID
     FROM Booking b
     JOIN Payment p ON b.BookingID = p.BookingID
     GROUP BY b.CustomerID
     HAVING SUM(p.Amount) > 8000
   );

-**Notes**

1.Foreign key constraints prevent deletion of parent rows if child records exist.

2.You can safely delete or update records by first handling dependent child rows.

3.The schema does not include ON DELETE CASCADE, so child rows must be removed manually.
