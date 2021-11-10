package com.arankin.BookClub.Models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PostPersist;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="reviews")
public class Reviews {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String reviewInput;		

    @Column(updatable=false)
   
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
   
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="bookProd_id")	
	private BookProduct review;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_reviews", 
        joinColumns = @JoinColumn(name = "review_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )     
    @JsonIgnore
    private List<User> users;
	
	public Reviews() {
		
	}
	
	//Getters and Setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getReviewInput() {
		return reviewInput;
	}
	public void setReviewInput(String reviewInput) {
		this.reviewInput = reviewInput;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public BookProduct getReview() {
		return review;
	}
	public void setReview(BookProduct review) {
		this.review = review;
	}
	
	
}//Reviews
