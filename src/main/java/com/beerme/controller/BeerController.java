package com.beerme.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.beerme.JDBC.JDBCBeerDAO;
import com.beerme.model.Beer;

@RestController
public class BeerController {
	private JDBCBeerDAO beerDAO;
	
	public BeerController(JDBCBeerDAO beerDAO) {
		this.beerDAO = beerDAO;
	}
	
	@RequestMapping(path = "/beer/{id}", method = RequestMethod.GET)
	public Beer getBeerDetails(@PathVariable int id) {
		Beer beerDetails = beerDAO.getBeerDetails(id);
		return beerDetails;
	}
	
}
