/*List all airports in USA	
select *
from airports	
*/

/* all airliners 
select *
from carriers	*/

/* Display the names of all airlines 
select name
from carriers	*/

/* Display all state abbreviations in the airports table 
select DISTINCT state
from airports */

/*Display all airline routes.	
select distinct departure_aid, arrival_aid
from flights	*/

/* Display 20 airlines	
select *
from carriers
LIMIT 20	*/

/* Display all airports in alphabetical order	
select *
FROM airports
order by state ASC, city ASC */

/* Display all cancelled flights 	
SELECT *
from flights
WHERE cancelled = 1		*/

/*	Display all mid-haul flights, i.e., the distance between 1500 km and 4100 km.	
select *
FROM flights
where distance between 1500 and 4100	*/

/*	Display all mid-haul flights, (i.e., the distance between 1500 km and 4100 km) operated by American Airlines Inc. (AA)	
select *
FROM flights
WHERE distance BETWEEN 1500 and 4100 and carrier_id = 'AA'	*/

/* . Display the airports in New York state and California state	
SELECT *
FROM airports
where state = 'New York' or state = 'California'	
														OR
SELECT *
FROM airports
where state in ('New York', 'California')	*/

/* Find out the most time-consuming flight	
SELECT *
FROM flights
order by actual_time desc
limit 1	*/

/* Display the airlines whose name start with C.		
SELECT *
FROM carriers
where name like 'C%'	*/

/* Display the airlines whose name includes cargo.	
SELECT *
FROM carriers
where name like '%cargo%'	*/

/* List all the airports in Alabama state.	
SELECT *
FROM airports
WHERE state = 'Alabama'	*/

/*	List all the flights canceled by AA carrier	
SELECT *
from flights
WHERE cancelled = '1' and carrier_id = 'AA'	*/

/* Count the number of actual flights operated by AA carrier, and the canceled flights are not included.
SELECT count(*)
FROM flights
WHERE cancelled = 0 and carrier_id = 'AA'	*/

/*List the top 10 delayed flights operated by AA carrier. (only consider arrival_delay) 	
SELECT *
FROM flights
WHERE carrier_id = 'AA'
order by arrival_delay DESC
limit 10	*/

/* Find the longest flight (in distance) in July 2019.	
select flight_no, max(distance), month_id
FROM flights
where month_id = 7 and year= 2019
													OR
select flight_no, distance
from flights
where month_id = 7 and year=2019
order by distance desc
limit 1
*/

/* What is the average arrival delay of all delayed flights operated by AA?	
select avg(arrival_delay)
from flights
where arrival_delay > 0 and carrier_id ='AA'
*/

/* Display all information about the flights cancelled on 1st, July 2019, including the full name of the carrier?	
SELECT *
FROM flights
join carriers on flights.carrier_id = carriers.cid
where flights.cancelled = 1 and flights.month_id = 7  and flights. day_of_month = 1 and year = 2019
*/

/* List all uncancelled flights departing from New York State on July 1, 2019	
 SELECT *
 FROM flights
 join airports on flights.departure_aid = airports.aid 
where flights.cancelled = 0 and flights.month_id = 7  and flights.day_of_month = 1 and flights.year = 2019 
																		and airports.state like 'New York'
*/

/* For all flights arriving in New York state on July 1, show the information on the 5 most time-consuming flights,
													including flight numbers and their departure cities and states. 	
SELECT 
  DD.city AS D_city, 
  DD.state AS D_state, 
  A.city AS A_city, 
  A.state AS A_state, 
  flights.flight_no, 
  flights.actual_time
FROM flights
JOIN airports DD ON flights.departure_aid = DD.aid  
JOIN airports A ON flights.arrival_aid = A.aid  -- Join for arrival airport
WHERE flights.cancelled = 0 
  AND flights.month_id = 7 
  AND flights.day_of_month = 1 
  AND flights.year = 2019 
  AND A.state = 'New York';  -- Filtering for arrival state 'New York'
*/

/* Show the number of cancelled and normal flights in the DB, respectively.	
Select cancelled, count(*)
from flights
GROUP by cancelled
	*/
	
/* Show the number of airports in each state, respectively		
Select state, count(*)
FROM airports
GROUP by state
*/

/* Find the 20 most frequent routes in 2019. (Cancelled flights are not included)	
SELECT 
  departure_aid, 
  arrival_aid, 
  COUNT(*) AS route_count
FROM flights
WHERE cancelled = 0  -- Exclude cancelled flights
AND year = 2019  -- Include only flights from 2019
GROUP BY departure_aid, arrival_aid  -- Group by route
ORDER BY route_count DESC  -- Sort by most frequent routes
LIMIT 20;  -- Limit to top 20
*/

/* Find the total number of flights cancelled by each airline in July ?	
select flights.carrier_id, count(*)
from flights join carriers on flights.carrier_id=carriers.cid
where flights.month_id = 7 and flights.cancelled = 1
group by flights.carrier_id
*/

/* Display the airlines that travels from California (state)- Hawaii(state) with least 30 times in July 2019.	
SELECT flights.carrier_id, count(*)
from flights
Join airports D on flights.departure_aid = D.aid
Join airports A on flights.arrival_aid = A.aid
where D.state = 'California' and A.state = 'Hawaii' and flights.cancelled = 0
group by flights.carrier_id
having count(*) >30
*/
