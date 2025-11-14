use OLA;
Create database OLA;
SELECT * FROM bookings;

-- 1. Retrieve all successful bookings:
Create view Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status  = 'Successful';

-- 2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_vehicle AS
SELECT Vehicle_Type,AVG(`Ride_Distance(km)`)
FROM bookings
GROUP BY  Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
Create view  cancelled_rides_by_customer AS
SELECT count(*)
FROM bookings
where Booking_Status = 'Cancelled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
Create view Top_5_Customers AS 
SELECT Customer_ID, COUNT(Booking_ID)AS NO_OF_RIDES
FROM bookings
GROUP BY Customer_ID
ORDER BY NO_OF_RIDES DESC
LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view  Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(Reason_for_cancelling_by_Driver)
FROM bookings
WHERE Reason_for_cancelling_by_Driver ='Personal & Car related issues';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Create view Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings),MiN(Driver_Ratings)
FROM bookings
WHERE Vehicle_Type = 'prime Sedan';


-- 7. Find the average customer rating per vehicle type:
Create view  AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating)
FROM bookings
GROUP BY Vehicle_Type;

-- 8. Calculate the total booking value of rides completed successfully:
Create view  total_successful_ride_value AS
SELECT SUM(`Booking_Value(INR)`)
FROM bookings
WHERE Booking_Status = 'Successful';

-- 9. List all incomplete rides along with the reason:
Create view  Incomplete_Rides_Reason AS
SELECT Booking_ID,Incomplete_Rides
FROM bookings
WHERE Incomplete_Rides = 1 ;

