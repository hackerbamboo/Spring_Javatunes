/*
 * This code is sample code, provided as-is, and we make no
 * warranties as to its correctness or suitability for
 * any purpose.
 *
 * We hope that it's useful to you.  Enjoy.
 * Copyright 2006-12 LearningPatterns Inc.
 */
 
package com.javatunes.web;



import java.util.Set;
import java.util.TreeSet;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javatunes.service.Catalog;

// TODO - Add annotations to make this a controller responding to search.do requests
@Controller 
@RequestMapping(Urls.SEARCH)
public class SearchController {

	@Inject
	Catalog catalog;
	
	// TODO - Annotate this method so it gets HTTP GET requests
	@RequestMapping(method=RequestMethod.GET)
	public String get(@ModelAttribute("uiModel") SearchModel uiModel) {
	    // TODO - return the correct view page
		return "searchForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView post(@ModelAttribute("uiModel") SearchModel uiModel) {
		
		return new ModelAndView("searchResults", "results", catalog.findByKeyword(uiModel.getKeyword(), uiModel.getCatalog()));
		
	}  
	
}

