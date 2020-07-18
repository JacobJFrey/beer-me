package com.beerme.controller;

import java.util.List;

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
	public String testMethod() {
		return "hello world";
	}
	
	
//	@RequestMapping(path = "/brewery", method = RequestMethod.GET)
//	public List<Brewery> getBreweries() {
//		List<Brewery> breweryList = breweryDAO.viewAllBreweries();
//		return breweryList;
//	}
	
}
