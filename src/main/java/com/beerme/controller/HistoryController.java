package com.beerme.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.beerme.JDBC.JDBCHistoryDAO;
import com.beerme.model.History;

@RestController
public class HistoryController {

	private JDBCHistoryDAO historyDAO;
	
	public HistoryController(JDBCHistoryDAO historyDAO) {
		this.historyDAO = historyDAO;
	}
	
	@RequestMapping(path = "/breweries/{id}", method = RequestMethod.POST)
	public void addHistory(@PathVariable int id, @RequestBody History history) {
		historyDAO.addHistory(id);
	}
	
}
