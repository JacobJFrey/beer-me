package com.beerme.JDBC;

import java.util.LinkedList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.beerme.dao.BreweryDAO;
import com.beerme.model.Brewery;

public class JDBCBreweryDAO implements BreweryDAO{

	private JdbcTemplate jdbcTemplate;
	
	public JDBCBreweryDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<Brewery> viewAllBreweries() {
		Brewery brewery = new Brewery();
		List<Brewery> allBreweries = new LinkedList<>();
		String sqlGetAllBreweries = 
				"SELECT b.breweryid, b.name, b.address, l.city, b.visited " +
				"FROM brewery b " +
				"JOIN location l ON l.locationId = b.locationId " +
				"ORDER BY b.breweryid";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBreweries);
		while(results.next()) {
			brewery = mapRowToBrewery(results);
			allBreweries.add(brewery);
		}
		return allBreweries;
	}

	@Override
	public Brewery viewByLocationId(int locationId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Brewery> viewUnvisited(boolean visited) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Brewery> breweriesByFood(boolean hasFood) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Brewery> breweriesByDirection(String direction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Brewery getBreweryDetails(int breweryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Brewery getBreweryByBeerId(int beerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateVisited(int breweryId) {
		// TODO Auto-generated method stub
		
	}
	
	private Brewery mapRowToBrewery(SqlRowSet results) {
		Brewery breweryObject = new Brewery();
		breweryObject.setBreweryid(results.getInt("breweryid"));
		breweryObject.setName(results.getString("name"));
		breweryObject.setAddress(results.getString("address"));
		breweryObject.setLocationid(results.getInt("locationid"));
		breweryObject.setHasfood(results.getBoolean("hasFood"));
		breweryObject.setBeerid(results.getInt("beerid"));
		breweryObject.setDescription(results.getString("description"));
		breweryObject.setVisited(results.getBoolean("visited"));
		return breweryObject;
	}

}


/*
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
*/
