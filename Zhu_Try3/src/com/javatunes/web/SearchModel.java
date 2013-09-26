package com.javatunes.web;



public class SearchModel {

	
	private String catalog;
	private String keyword;
	private String selectedArtist;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSelectedArtist() {
		return selectedArtist;
	}

	public void setSelectedArtist(String selectedArtist) {
		this.selectedArtist = selectedArtist;
	}

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}
}
