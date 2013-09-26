package com.javatunes.web;

import java.math.BigDecimal;
import java.util.Date;

import com.javatunes.domain.MusicItem;


public class ViewCartModel {

	private MusicItem musicItem;
	private int quantity;
	private BigDecimal totalPriceEach;
	
	public ViewCartModel(MusicItem musicItem, int quantity, BigDecimal totalPriceEach){
		this.setMusicItem(musicItem);
		this.setQuantity(quantity);
		this.setTotalPriceEach(totalPriceEach);
		
	}
	
	
	public MusicItem getMusicItem() {
		return musicItem;
	}
	public void setMusicItem(MusicItem musicItem) {
		this.musicItem = musicItem;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public BigDecimal getTotalPriceEach() {
		return totalPriceEach;
	}


	public void setTotalPriceEach(BigDecimal totalPriceEach) {
		this.totalPriceEach = totalPriceEach;
	}


	


	
	
	
	
}
