package com.arankin.BookClub.Repositories;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.arankin.BookClub.Models.Counter;


@Repository
public interface CounterRepository extends CrudRepository<Counter, Long>{       
	    List<Counter> findAll();   
	    
}//class