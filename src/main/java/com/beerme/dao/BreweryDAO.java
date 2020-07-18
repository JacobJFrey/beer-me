package com.beerme.dao;

import java.util.List;

import com.beerme.model.Brewery;


public interface BreweryDAO {
	
	List <Brewery> viewAllBreweries();
	
	List<Brewery> viewByLocationId(int locationId);
	
	List <Brewery> viewUnvisited(boolean visited);
	
	List <Brewery> breweriesByFood(boolean hasFood);
	
	List <Brewery> breweriesByDirection(String direction);
	
	Brewery getBreweryDetails(int breweryId);
	
	Brewery getBreweryByBeerId(int beerId);
	
	void updateVisited(int breweryId);
}
