package com.beerme.JDBC;

import java.util.LinkedList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;
import com.beerme.dao.BreweryDAO;
import com.beerme.model.Brewery;


@Service
public class JDBCBreweryDAO implements BreweryDAO{

	private JdbcTemplate jdbcTemplate;
	
	public JDBCBreweryDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// all breweries
	@Override
	public List<Brewery> viewAllBreweries() {
		Brewery brewery = new Brewery();
		List<Brewery> allBreweries = new LinkedList<>();
		String sqlGetAllBreweries = 
				"SELECT * " +
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

	// breweries list by city id (location id)
	@Override
	public List<Brewery> viewByLocationId(int locationId) {
		Brewery brewery = new Brewery();
		List<Brewery> breweryByCity = new LinkedList<>();
		String sqlGetBreweriesByLocation = 
				"SELECT * " + 
				"FROM brewery b " + 
				"JOIN location l ON l.locationId = b.locationId " + 
				"WHERE l.locationId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBreweriesByLocation, locationId);
		while(results.next()) {
			brewery = mapRowToBrewery(results);
			breweryByCity.add(brewery);
		}
		return breweryByCity;
	}

	// view visited or unvisited breweries
	@Override
	public List<Brewery> viewUnvisited(boolean visited) {
		Brewery brewery = new Brewery();
		List<Brewery> unvisitedBreweries = new LinkedList<>();
		String sqlGetUnvisited = 
				"SELECT * " + 
				"FROM brewery b " + 
				"JOIN location l ON l.locationId = b.locationId " + 
				"WHERE b.visited = ? " + 
				"ORDER BY b.breweryid";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUnvisited, visited);
		while(results.next()) {
			brewery = mapRowToBrewery(results);
			unvisitedBreweries.add(brewery);
		}
		return unvisitedBreweries;
	}

	// get breweries by if they serve food or not
	@Override
	public List<Brewery> breweriesByFood(boolean hasFood) {
		Brewery brewery = new Brewery();
		List<Brewery> breweryByFood = new LinkedList<>();
		String sqlGetByFood = 
				"SELECT * " + 
				"FROM brewery b " + 
				"JOIN location l ON l.locationId = b.locationId " + 
				"WHERE b.hasFood = ? " + 
				"ORDER BY b.breweryid";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetByFood, hasFood);
		while(results.next()) {
			brewery = mapRowToBrewery(results);
			breweryByFood.add(brewery);
		}
		return breweryByFood;
	}

	// get all breweries by direction in relation to downtown
	@Override
	public List<Brewery> breweriesByDirection(String direction) {
		Brewery brewery = new Brewery();
		List<Brewery> breweryByDirection = new LinkedList<>();
		String sqlGetByFood = 
				"SELECT * " + 
				"FROM brewery b " + 
				"JOIN location l ON l.locationId = b.locationId " + 
				"WHERE l.direction = ? " + 
				"ORDER BY b.breweryid";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetByFood, direction);
		while(results.next()) {
			brewery = mapRowToBrewery(results);
			breweryByDirection.add(brewery);
		}
		return breweryByDirection;
	}

	// get brewery details by breweryID
	@Override
	public Brewery getBreweryDetails(int breweryId) {
		Brewery brewery = new Brewery();
		String sqlGetBreweryDetails = 
				"SELECT * " + 
				"FROM brewery b " + 
				"JOIN location l ON l.locationId = b.locationId " + 
				"JOIN beer be ON be.beerid = b.beerid " + 
				"WHERE b.breweryid = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBreweryDetails, breweryId);
		while (results.next()) {
			brewery = mapRowToBrewery(results);
		}
		return brewery;
	}

	
	// FOR SOME REASON PULLS UP BREWERY BY BEER ID - 1
	// 29 PULLS UP BREWERY WITH BEER ID OF 28
	@Override
	public Brewery getBreweryByBeerId(int beerId) {
		Brewery brewery = new Brewery();
		String sqlGetBreweryByBeerId = 
				"SELECT * " + 
				"FROM beer b " + 
				"JOIN beertype bt ON b.typeid = bt.typeid " + 
				"JOIN brewery br ON br.beerid = b.beerid " + 
				"WHERE b.beerid = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBreweryByBeerId, beerId);
		while(results.next()) {
			brewery = mapRowToBrewery(results);
		}
		return brewery;
	}

	// update visited from false to true
	@Override
	public void updateVisited(int breweryId) {
		String sqlUpdateVisited = 
				"UPDATE brewery " + 
				"SET visited = true " + 
				"WHERE breweryid = ?";
		jdbcTemplate.update(sqlUpdateVisited, breweryId);
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

//-- get beer details by beerid
//SELECT br.breweryid, br.name, b.name, bt.name, b.description
//FROM beer b
//JOIN beertype bt ON b.typeid = bt.typeid
//JOIN brewery br ON br.beerid = b.beerid
//WHERE bt.typeid = 9;
//
//-- add brewery to history
//INSERT INTO history (breweryname, date)
//VALUES ('Sly Fox', --will get current date from java);
//*/
