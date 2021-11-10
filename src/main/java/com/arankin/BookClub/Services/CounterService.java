package com.arankin.BookClub.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arankin.BookClub.Models.*;
import com.arankin.BookClub.Repositories.*;

@Service
public class CounterService {

	@Autowired
	private CounterRepository ctrRepos;
	
	
	//*******   Create   ********//
	public Counter createCount(Counter ct) {
		return this.ctrRepos.save(ct);	
	}
	
	//*******   Read   ********//
	public List<Counter> displayAll(){
		return this.ctrRepos.findAll();
	}
		
	public Counter findACount(Long id){
		return this.ctrRepos.findById(id).orElse(null);
	}	
	
	//*******   Update   ********//
	public Counter update(Counter ct) {
		return this.ctrRepos.save(ct);
	}		
	
	//*******   Delete   ********//
	public void removeACount (Long id) {
		 this.ctrRepos.deleteById(id);
	}		
	
}//class
