package com.arankin.BookClub.Validator;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;


import com.arankin.BookClub.Models.User;
import com.arankin.BookClub.Repositories.UserRepository;


@Component
public class UserValidator {
	@Autowired
	private UserRepository userRepos;
	
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		if(!user.getPassword().equals(user.getConfirmPassword())){
			errors.rejectValue("password", "Match", "Hey you, Passwords Do Not Match!");
		}
		
		// Make sure email is unique in the database
		if(this.userRepos.existsByEmail(user.getEmail())) {
			errors.rejectValue("email", "Unique", "Email has already been registered there, person!");
		}
	
	}
}
