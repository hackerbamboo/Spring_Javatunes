/*
 * This code is sample code, provided as-is, and we make no
 * warranties as to its correctness or suitability for
 * any purpose.
 *
 * We hope that it's useful to you.  Enjoy.
 * Copyright 2006-12 LearningPatterns Inc.
 */


package com.javatunes.persistence;

import com.javatunes.domain.MusicItem;

import java.util.Collection;


public interface MusicItemDAO {

  public MusicItem get(Long id);

  public Collection<MusicItem> getAll();

  public Collection<MusicItem> searchByArtistTitle(String keyword);
  
  public Collection<MusicItem> searchByArtist(String keyword);
  
  public Collection<MusicItem> searchByTitle(String keyword);
}
