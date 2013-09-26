package com.javatunes.web;

import java.util.Collection;

import com.javatunes.domain.*;

public class CheckoutModel {

	
	
	
	// total price after tax
			private float totalPriceAfterTax;

			// price beofre tax
			private float totalPriceBeforeTax;

			// tax
			private float tax;

			
			private Collection<ViewCartModel> passBack;
			
			private String state;
			
			public float getTotalPriceAfterTax() {
				return totalPriceAfterTax;
			}

			public void setTotalPriceAfterTax(float totalPriceAfterTax) {
				this.totalPriceAfterTax = totalPriceAfterTax;
			}

			public float getTotalPriceBeforeTax() {
				return totalPriceBeforeTax;
			}

			public void setTotalPriceBeforeTax(float totalPriceBeforeTax) {
				this.totalPriceBeforeTax = totalPriceBeforeTax;
			}

			public float getTax() {
				return tax;
			}

			public void setTax(float tax) {
				this.tax = tax;
			}


			public String getState() {
				return state;
			}

			public void setState(String state) {
				this.state = state;
			}

			public Collection<ViewCartModel> getPassBack() {
				return passBack;
			}

			public void setPassBack(Collection<ViewCartModel> passBack) {
				this.passBack = passBack;
			}
}
