-- view all cities to search from
SELECT *
FROM location
ORDER BY locationid;

-- select breweries by locationid
SELECT *
FROM brewery b
JOIN location l ON l.locationId = b.locationId
WHERE l.locationId = 4;

-- select all breweries / ordered by breweryid
SELECT b.breweryid, b.name, b.address, l.city, b.visited
FROM brewery b
JOIN location l ON l.locationId = b.locationId
ORDER BY b.breweryid;

-- select all unvisited breweries
SELECT b.breweryid, b.name, b.address, l.city
FROM brewery b
JOIN location l ON l.locationId = b.locationId
WHERE b.visited = false
ORDER BY b.breweryid;

-- select breweries by hasFood = true
SELECT b.breweryid, b.name, b.address, l.city
FROM brewery b
JOIN location l ON l.locationId = b.locationId
WHERE b.hasFood = true
ORDER BY b.breweryid;

-- select breweries by location in relation to downtown
SELECT b.breweryid, b.name, b.address, l.city
FROM brewery b
JOIN location l ON l.locationId = b.locationId
WHERE l.direction = 'East'
ORDER BY b.breweryid;

-- get brewery details by breweryid
SELECT b.breweryid, b.name, b.address, l.city, b.description, be.name
FROM brewery b
JOIN location l ON l.locationId = b.locationId
JOIN beer be ON be.beerid = b.beerid
WHERE b.breweryid = 9;

-- get beer details by beerid
SELECT br.breweryid, br.name, b.name, bt.name, b.description
FROM beer b
JOIN beertype bt ON b.typeid = bt.typeid
JOIN brewery br ON br.beerid = b.beerid
WHERE bt.typeid = 9;

-- get brewery by beerid
SELECT b.breweryid, b.name, b.address, l.city
FROM brewery b
JOIN location l ON l.locationId = b.locationId
WHERE b.beerid = 3
ORDER BY b.breweryid;

-- update visisted from false to true
UPDATE brewery
SET visited = true
WHERE breweryid = 1;

-- add brewery to history
INSERT INTO history (breweryname, date)
VALUES ('Sly Fox', --will get current date from java);