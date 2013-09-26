/*
 * This code is sample code, provided as-is, and we make no
 * warranties as to its correctness or suitability for
 * any purpose.
 *
 * We hope that it's useful to you.  Enjoy.
 * Copyright 2006-12 LearningPatterns Inc.
 */


package com.javatunes.service;

import java.util.Collection;

import java.util.List;

import javax.inject.Inject;

import com.javatunes.domain.MusicItem;

import com.javatunes.persistence.MusicItemDAO;

// Implementation of Catalog interface using ItemDAO
public class CatalogImpl implements Catalog {

	@Inject
	private MusicItemDAO jpaItemDAO;
	

	/// Constructor - We require a JavaTunesCatalog to be initialized with a SearchUtility bean when created
	public CatalogImpl(MusicItemDAO jpaItemDAO) {
		this.jpaItemDAO = jpaItemDAO;
	}
	
	// Business methods

   public MusicItem findById(Long id) {
	   System.out.println("JavaTunesCatalog:findById - " + id);
      return jpaItemDAO.get(id);
  }

   public Collection<MusicItem> findByKeyword(String keyword, String choice)  {
	   String artist = "artist";
	  // String title = "title";
	  if (choice.equals(artist)){
		  return jpaItemDAO.searchByArtist(keyword);
	  }
	  else{
		  return jpaItemDAO.searchByArtistTitle(keyword);
	  }
   }
}
