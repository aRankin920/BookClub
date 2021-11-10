package com.arankin.BookClub.Models;


//import java.util.Date;
import java.util.List;

//import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
//import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	@Size(max=200)
	private String userName;
	
	@Email
	@NotBlank
	private String email;
	
	@NotBlank
	private String password;
	
	@Transient
	private String confirmPassword;
	
	public User() {
		
	}

	//@OneToMany(mappedBy="creator", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	//List<BookProduct> bpList;
	//@JsonIgnore

	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_books", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "bookProd_id")
    )     
    @JsonIgnore
    private List<BookProduct> bProducts;
    
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_reviews", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "review_id")
    )     
    @JsonIgnore
    private List<Reviews> reviews;
	
	//Getter and Setter 
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
    public List<BookProduct> getbProducts() {
		return bProducts;
	}


	public void setbProducts(List<BookProduct> bProducts) {
		this.bProducts = bProducts;
	}
	
}//class
