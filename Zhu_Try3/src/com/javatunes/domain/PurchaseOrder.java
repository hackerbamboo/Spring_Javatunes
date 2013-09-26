package com.javatunes.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PurchaseOrder implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long PoId;
	private int Status;
	private Date OrderDate;
	private Long UserId;
	private BigDecimal Total;
	
	public PurchaseOrder(){}
	
	public PurchaseOrder(int status, Date orderDate, Long userId, BigDecimal total){
		this.setStatus(status);
		this.setOrderDate(orderDate);
		this.setUserId(userId);
		this.setTotal(total);
	}

	public Long getPoId() {
		return PoId;
	}

	public void setPoId(Long poId) {
		PoId = poId;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public Date getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(Date orderDate) {
		OrderDate = orderDate;
	}

	public Long getUserId() {
		return UserId;
	}

	public void setUserId(Long userId) {
		UserId = userId;
	}

	public BigDecimal getTotal() {
		return Total;
	}

	public void setTotal(BigDecimal total) {
		Total = total;
	}
	
	
}
