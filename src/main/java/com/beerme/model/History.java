package com.beerme.model;

import java.time.LocalDate;

public class History {

	private String breweryName;
	private LocalDate todaysDate;
	private int historyId;
	
	
	public int getHistoryId() {
		return historyId;
	}
	public void setHistoryId(int historyId) {
		this.historyId = historyId;
	}
	public String getBreweryName() {
		return breweryName;
	}
	public void setBreweryName(String breweryName) {
		this.breweryName = breweryName;
	}
	public LocalDate getTodaysDate() {
		return todaysDate;
	}
	public void setTodaysDate(LocalDate todaysDate) {
		this.todaysDate = todaysDate;
	}
	
}
