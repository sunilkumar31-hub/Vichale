package com.DTO;

public class Bike {
	
//	bike_id, bikeName, bikeModel, bikeCC, bikePrice, bikeUrl
	
	private int bike_id;
	private String bikeName;
	private String bikeModel;
	private String bikeCC;
	private String bikePrice;
	private String bikeUrl;
	
	
	public Bike() {
		super();
	}


	public Bike(int bike_id, String bikeName, String bikeModel, String bikeCC, String bikePrice, String bikeUrl) {
		super();
		this.bike_id = bike_id;
		this.bikeName = bikeName;
		this.bikeModel = bikeModel;
		this.bikeCC = bikeCC;
		this.bikePrice = bikePrice;
		this.bikeUrl = bikeUrl;
	}


	@Override
	public String toString() {
		return "Bike [bike_id=" + bike_id + ", bikeName=" + bikeName + ", bikeModel=" + bikeModel + ", bikeCC=" + bikeCC
				+ ", bikePrice=" + bikePrice + ", bikeUrl=" + bikeUrl + "]";
	}


	public int getBike_id() {
		return bike_id;
	}


	public void setBike_id(int bike_id) {
		this.bike_id = bike_id;
	}


	public String getBikeName() {
		return bikeName;
	}


	public void setBikeName(String bikeName) {
		this.bikeName = bikeName;
	}


	public String getBikeModel() {
		return bikeModel;
	}


	public void setBikeModel(String bikeModel) {
		this.bikeModel = bikeModel;
	}


	public String getBikeCC() {
		return bikeCC;
	}


	public void setBikeCC(String bikeCC) {
		this.bikeCC = bikeCC;
	}


	public String getBikePrice() {
		return bikePrice;
	}


	public void setBikePrice(String bikePrice) {
		this.bikePrice = bikePrice;
	}


	public String getBikeUrl() {
		return bikeUrl;
	}


	public void setBikeUrl(String bikeUrl) {
		this.bikeUrl = bikeUrl;
	}
	
}
