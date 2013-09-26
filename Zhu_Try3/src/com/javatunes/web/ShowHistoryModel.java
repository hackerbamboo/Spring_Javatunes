package com.javatunes.web;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import com.javatunes.domain.MusicItem;

public class ShowHistoryModel {

	private Date orderdate;
	private MusicItem musicitem;
	private int quantity;
	private BigDecimal unitprice;
	
	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public MusicItem getMusicitem() {
		return musicitem;
	}
	public void setMusicitem(MusicItem musicitem) {
		this.musicitem = musicitem;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(BigDecimal unitprice) {
		this.unitprice = unitprice;
	}
	
	public ShowHistoryModel(Date orderdate, MusicItem musicitem, int quantity, BigDecimal unitprice){
		this.setReleaseDate(orderdate);
		this.setMusicitem(musicitem);
		this.setQuantity(quantity);
		this.setUnitprice(unitprice);
	}
	public SimpleDateFormat getDf() {
		return df;
	}
	public void setDf(SimpleDateFormat df) {
		this.df = df;
	}
	
	public void setReleaseDate(Date orderDate) {
		this.orderdate = orderDate;
	}
}
