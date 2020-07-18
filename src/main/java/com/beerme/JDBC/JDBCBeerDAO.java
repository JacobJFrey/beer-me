package com.beerme.JDBC;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.beerme.dao.BeerDAO;
import com.beerme.model.Beer;

@Service
public class JDBCBeerDAO implements BeerDAO {

	private JdbcTemplate jdbcTemplate;
	
	public JDBCBeerDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public Beer getBeerDetails(int beerId) {
		Beer beerDetails = new Beer();
		String sqlGetBeerDetails = 
				"SELECT * " + 
				"FROM beer b " + 
				"JOIN beertype bt ON b.typeid = bt.typeid " + 
				"JOIN brewery br ON br.beerid = b.beerid " + 
				"WHERE b.beerid = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBeerDetails, beerId);
		while(results.next()) {
			beerDetails = mapRowToBeer(results);
		}
		return beerDetails;
	}

	private Beer mapRowToBeer(SqlRowSet results) {
		Beer beerObject = new Beer();
		beerObject.setBeerid(results.getInt("beerid"));
		beerObject.setDescription(results.getString("description"));
		beerObject.setName(results.getString("beername"));
		beerObject.setTypeid(results.getInt("typeid"));
		beerObject.setBreweryName(results.getString("name"));
		beerObject.setTypeName(results.getString("typename"));
		return beerObject;
	}

}
