package com.beerme.controller;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.beerme.JDBC.JDBCBreweryDAO;
import com.beerme.model.Brewery;

@RestController
public class BreweryController {
	private JDBCBreweryDAO breweryDAO;

	public BreweryController(JDBCBreweryDAO breweryDAO) {
		this.breweryDAO = breweryDAO;
	}
	
	@RequestMapping(path = "", method = RequestMethod.GET)
<<<<<<< HEAD
	public String testMethod() {
		return "hello world";
	}
	
	
//	@RequestMapping(path = "/brewery", method = RequestMethod.GET)
//	public List<Brewery> getBreweries() {
//		List<Brewery> breweryList = breweryDAO.viewAllBreweries();
//		return breweryList;
//	}
=======
	public String greeting() {
		return "Hello World!";
	}
	
	@RequestMapping(path = "/breweries", method = RequestMethod.GET)
	public List<Brewery> getBreweries() {
		List<Brewery> breweryList = breweryDAO.viewAllBreweries();
		return breweryList;
	}
>>>>>>> ee527d369e4bee68c9a4065f0b4818fe309ec86b
	
	@RequestMapping(path = "/breweries/location/{id}", method = RequestMethod.GET)
	public List<Brewery> getBreweryByLocationId(@PathVariable int id) {
		List<Brewery> breweryList = breweryDAO.viewByLocationId(id);
		return breweryList;
	}
	
	@RequestMapping(path = "/breweries/visited/{yesOrNo}", method = RequestMethod.GET)
	public List<Brewery> getBreweryByVisited(@PathVariable boolean yesOrNo) {
		List<Brewery> breweryList = breweryDAO.viewUnvisited(yesOrNo);
		return breweryList;
	}
	
	@RequestMapping(path = "/breweries/food/{food}", method = RequestMethod.GET)
	public List<Brewery> getBreweryByHasFood(@PathVariable boolean food) {
		List<Brewery> breweryList = breweryDAO.breweriesByFood(food);
		return breweryList;
	}
	
	@RequestMapping(path = "/breweries/direction/{direction}", method = RequestMethod.GET)
	public List<Brewery> getBreweriesByDirection(@PathVariable String direction) {
		List<Brewery> breweryList = breweryDAO.breweriesByDirection(direction);
		return breweryList;
	}
	
	@RequestMapping(path = "/breweries/{breweryId}", method = RequestMethod.GET)
	public Brewery getDetails(@PathVariable int breweryId) {
		Brewery breweryDetails = breweryDAO.getBreweryDetails(breweryId);
		return breweryDetails;
	}
	
	@RequestMapping(path = "/breweries/beer/{beerId}", method = RequestMethod.GET)
	public Brewery getBreweryByBeer(@PathVariable int beerId) {
		Brewery breweryDetails = breweryDAO.getBreweryByBeerId(beerId);
		return breweryDetails;
	}
	
	@RequestMapping(path = "/breweries/details/{breweryId}", method = RequestMethod.PUT)
	public void updateVisited(@PathVariable int breweryId, @RequestBody Brewery brewery) {
		breweryDAO.updateVisited(breweryId);
	}
	
}
