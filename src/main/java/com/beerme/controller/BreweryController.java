package com.beerme.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BreweryController {

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String greeting() {
		return "Hello world!";
	}
	
}
