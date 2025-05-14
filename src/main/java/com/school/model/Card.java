package com.school.model;

public class Card {
	
	private String cardNum;
	private String expDate;
	private int cvv;
	private String bank;
	public String getCardNum() {
		return cardNum;
	}
	public String getExpDate() {
		return expDate;
	}
	public int getCvv() {
		return cvv;
	}
	public String getBank() {
		return bank;
	}
	public Card(String cardNum, String expDate, int cvv, String bank) {
		
		this.cardNum = cardNum;
		this.expDate = expDate;
		this.cvv = cvv;
		this.bank = bank;
	}


}
