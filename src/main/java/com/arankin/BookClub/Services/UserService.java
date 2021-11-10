package com.arankin.BookClub.Services;


import java.util.List;

import com.arankin.BookClub.Models.*;
import com.arankin.BookClub.Repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class UserService {
	@Autowired
	private UserRepository userRepos;
	
	
	//*******   Create   ********//
	public User registerUser(User user) {
		
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hash);
		return this.userRepos.save(user);
	}
	
	// Authenticate
	public boolean authenticateUser(String email, String password) {

		User user = this.userRepos.findByEmail(email);
		
		if(user == null) {
			return false;
		}
		
		return BCrypt.checkpw(password, user.getPassword());
	}
		
	
	
	//*******   Read   ********//
	public User findOneUser(Long id) {
		User user = this.userRepos.findById(id).orElse(null);
		return user;
	}
	
	public List<User> allUsers(){
		return this.userRepos.findAll();
	}	

	public User getByEmail(String email) {
		return this.userRepos.findByEmail(email);
	}

}//class
