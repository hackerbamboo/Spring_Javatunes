package com.javatunes.domain;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PurchaseMusicItem implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long PoId;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Lineidber;
	
	
	private Long MusicItemID;
	
	private int Quantity;
	private BigDecimal UnitPrice;
	
	
	public PurchaseMusicItem(){}
	
	public PurchaseMusicItem(Long poId, Long musicItemID, int quantity, BigDecimal unitPrice){
		this.setPoId(poId);
		this.setMusicItemID(musicItemID);
		this.setQuantity(quantity);
		this.setUnitPrice(unitPrice);
	}
	
	public Long getMusicItemID() {
		return MusicItemID;
	}
	public void setMusicItemID(Long musicItemID) {
		MusicItemID = musicItemID;
	}
	public Long getPoId() {
		return PoId;
	}
	public void setPoId(Long poId) {
		PoId = poId;
	}
	public int getLineidber() {
		return Lineidber;
	}
	public void setLineidber(int lineidber) {
		Lineidber = lineidber;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public BigDecimal getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(BigDecimal unitPrice) {
		UnitPrice = unitPrice;
	}


	
	
}
