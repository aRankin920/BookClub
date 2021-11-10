package com.arankin.BookClub.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.arankin.BookClub.Models.Reviews;

public interface ReviewRepository extends CrudRepository<Reviews, Long> {
	List<Reviews> findAll(); 
	
}//Repository
