package com.arankin.BookClub.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.arankin.BookClub.Models.BookProduct;
import com.arankin.BookClub.Repositories.*;

@Service
public class BookProductService {

	@Autowired
	private BookProductRepository bpRepos;

	
	
	//*******   Create   ********//
	public BookProduct create(BookProduct bp) {
		return this.bpRepos.save(bp);		
	}
	
		
	//*******   Read   ********//
	public List<BookProduct> displayAll(){
		return this.bpRepos.findAll();
	}
	
	public List<BookProduct> displayByAuthor(String author){
		return this.bpRepos.findByAuthorContaining(author);
	}
	
	public List<BookProduct> displayByGenre(String genre){
		return this.bpRepos.findByGenreContaining(genre);
	}
	
	public BookProduct findABookProduct(Long id) {
		return this.bpRepos.findById(id).orElse(null);
	}	
	

	//*******   Update   ********//
	public BookProduct update(BookProduct bp) {
		return this.bpRepos.save(bp);
	}	
	
	//*******   Delete   ********//
	public void deleteBookProduct(Long id) {
		 this.bpRepos.deleteById(id);
	}
	
}//class
