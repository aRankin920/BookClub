package com.arankin.BookClub.Models;

    import com.arankin.BookClub.Models.User;

	import java.util.Date;
	import java.util.List;

	import javax.persistence.Column;
	import javax.persistence.Entity;
	import javax.persistence.FetchType;
	import javax.persistence.GeneratedValue;
	import javax.persistence.GenerationType;
	import javax.persistence.Id;
	import javax.persistence.JoinTable;
	import javax.persistence.JoinColumn;
	import javax.persistence.ManyToMany;
	import javax.persistence.PrePersist;
	import javax.persistence.PreUpdate;
	import javax.persistence.Table;
	import javax.validation.constraints.Min;
	import javax.validation.constraints.NotNull;
	import javax.validation.constraints.Size;
	import com.fasterxml.jackson.annotation.JsonIgnore;
	import org.springframework.format.annotation.DateTimeFormat;

	@Entity  //This entity means this is related to a database
	@Table(name="books")
	public class BookProduct {

		@Id //Means the primary key will be auto-generated.
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	   
		@NotNull
	    @Size(min = 5, max = 200)
	    private String title;
		
		@NotNull
	    @Size(min = 5, max = 200)
	    private String author;
	   
		@NotNull
	    @Size(min = 5, max = 200)
	    private String description;
	   
		@NotNull
	    @Size(min = 3, max = 40)
	    private String genre;
	   
		@NotNull
	    @Min(7)
	    private Integer numberOfPages;

		private float price;
		private float discount;
	    private int count;
	    private int total;

//		// This will not allow the createdAt column to be updated after creation
//	    @Column(updatable=false) //This is to ensure data is not updated every time the object is created
//	    
//	    @DateTimeFormat(pattern="yyyy-MM-dd")
//	    private Date createdAt;
//	   
//	    @DateTimeFormat(pattern="yyyy-MM-dd")
//	    private Date updatedAt;
//    

		@ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "users_books", 
	        joinColumns = @JoinColumn(name = "bookProd_id"), 
	        inverseJoinColumns = @JoinColumn(name = "user_id")
	    )     
	    @JsonIgnore
	    private List<User> users;
	
	    public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		//--------------------  
	    //Constructors
	    //-------------------        
	    public BookProduct() {
	    }
	    
	    public BookProduct(String title, String desc, String genre, int pages, float price, float discount, int count) {
	        this.title = title;
	        this.description = desc;
	        this.genre = genre;
	        this.numberOfPages = pages;
	        this.price = price;
	        this.discount = discount;
	        this.count = count;
	    }
	    
//	    
//	    @PrePersist
//	    protected void onCreate(){
//	        this.createdAt = new Date();
//	    }
//	    @PreUpdate
//	    protected void onUpdate(){
//	        this.updatedAt = new Date();
//	    }
//	    
	    //--------------------  
	    //getters and setters
	    //-------------------
		public Long getId() {
			return id;
		}

		public String getTitle() {
			return title;
		}

		public String getDescription() {
			return description;
		}

		public Integer getNumberOfPages() {
			return numberOfPages;
		}
		 
		public void setId(Long id) {
			this.id = id;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public void setDescription(String description) {
			this.description = description;
		}	
		public void setNumberOfPages(Integer numberOfPages) {
			this.numberOfPages = numberOfPages;
		}

	    public String getGenre() {
			return genre;
		}

		public void setGenre(String genre) {
			this.genre = genre;
		}
		
		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}
	    
		public float getPrice() {
			return price;
		}

		public void setPrice(float price) {
			this.price = price;
		}

		public float getDiscount() {
			return discount;
		}

		public void setDiscount(float discount) {
			this.discount = discount;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

		public List<User> getUsers() {
			return users;
		}

		public void setUsers(List<User> users) {
			this.users = users;
		}
	}//BookProduct
