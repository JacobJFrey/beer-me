package com.beerme.model;


public class Brewery {

	private int breweryid;
	private String name;
	private String address;
	private int locationid;
	private boolean hasfood;
	private int beerid;
	private String description;
	private boolean visited;
	
	
	public int getBreweryid() {
		return breweryid;
	}
	public void setBreweryid(int breweryid) {
		this.breweryid = breweryid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getLocationid() {
		return locationid;
	}
	public void setLocationid(int locationid) {
		this.locationid = locationid;
	}
	public boolean isHasfood() {
		return hasfood;
	}
	public void setHasfood(boolean hasfood) {
		this.hasfood = hasfood;
	}
	public int getBeerid() {
		return beerid;
	}
	public void setBeerid(int beerid) {
		this.beerid = beerid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isVisited() {
		return visited;
	}
	public void setVisited(boolean visited) {
		this.visited = visited;
	}
}
