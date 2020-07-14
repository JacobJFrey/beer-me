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
