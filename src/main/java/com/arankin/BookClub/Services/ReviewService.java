package com.arankin.BookClub.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arankin.BookClub.Models.Reviews;
import com.arankin.BookClub.Repositories.*;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository rwRepos;
	
	
	//*******   Create   ********//
	public Reviews createReview(Reviews rv) {
		return this.rwRepos.save(rv);	
	}
	
	//*******   Read   ********//
	public List<Reviews> displayAll(){
		return this.rwRepos.findAll();
	}
		
	public Reviews findAReview(Long id){
		return this.rwRepos.findById(id).orElse(null);
	}	
	
	//*******   Update   ********//
	public Reviews update(Reviews rv) {
		return this.rwRepos.save(rv);
	}		
	
	//*******   Delete   ********//
	public void removeAReview (Long id) {
		 this.rwRepos.deleteById(id);
	}		

}//ReviewService
