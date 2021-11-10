package com.arankin.BookClub.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.arankin.BookClub.Models.BookProduct;


@Repository
public interface BookProductRepository extends CrudRepository<BookProduct, Long>{       
	    List<BookProduct> findAll();   	    
	    List<BookProduct> findByGenreContaining(String search);	    
	    List<BookProduct> findByAuthorContaining(String search);
	    
	    // this method counts how many titles contain a certain string
	    Long countByTitleContaining(String search);
	    
	    // this method deletes a book that starts with a specific title
	    Long deleteByTitleStartingWith(String search);	    
	
}//BookRepository
