package com.arankin.BookClub.Controller;

import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.arankin.BookClub.Services.*;
import com.arankin.BookClub.Models.*;
import com.arankin.BookClub.Services.BookProductService;


@Controller
@RequestMapping("/bookclub")
public class BookClubController {
	@Autowired
	private UserService userService;
	@Autowired
	private BookProductService bpService;
	@Autowired
	private ReviewService rvService;	
	@Autowired
	private CounterService ctrService;
	
    //Render dashboard
	@GetMapping("/dashboard")
	public String dashboard(@ModelAttribute("reviews") Reviews review, Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		List<BookProduct> bkProdList =  this.bpService.displayAll();	
		List<Reviews> reviewList = rvService.displayAll();
		List<Counter> count = ctrService.displayAll();
		
        int total = 0;
        
        for (Counter temp : count) {
        	 total = total + temp.getQuantity();
        }
		
		 
		viewModel.addAttribute("user", currUser);	
		viewModel.addAttribute("count", total);	
		viewModel.addAttribute("productList", bkProdList);	
		viewModel.addAttribute("reviewList", reviewList);
		
		return "dashboard.jsp";
	}
	
	
	 /*================================*/
	 //Method: searchByGenreOrAuthor()
	 /*================================*/ 		    
	 @RequestMapping(value="/search", method=RequestMethod.GET)
	 public String searchByGenreOrAuthor(@RequestParam("author") String author, Model viewModel) {
		List<BookProduct> allProduct = this.bpService.displayAll();
		 
		// if (category.equalsIgnoreCase("author")) {
		 List<BookProduct> bookList = this.bpService.displayByAuthor(author); 
 		//System.out.println(bookList); 

//		 }else if (category.equalsIgnoreCase("genre")) {			 
//			 bookList = this.bpService.displayByGenre(request); 
//		 }
	 
		List<Counter> count = ctrService.displayAll();	
        int total = 0;      
        for (Counter temp : count) {
        	 total = total + temp.getQuantity();
         }
		
		 viewModel.addAttribute("count", total);	
	     viewModel.addAttribute("bookList", bookList);
	     viewModel.addAttribute("author", author);
	     viewModel.addAttribute("allProduct", allProduct);
	       
		 return "/searchResults.jsp";
		   
   }//searchByGenreOrAuthor	
	
	
    //Render search results
	@GetMapping("/results")
	public String search(Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		List<BookProduct> bkProdList =  this.bpService.displayAll();		
		List<Counter> count = ctrService.displayAll();	
        int total = 0;      
        for (Counter temp : count) {
        	 total = total + temp.getQuantity();
         }
		
		viewModel.addAttribute("count", total);
		viewModel.addAttribute("user", currUser);	
		viewModel.addAttribute("productList", bkProdList);	
		return "searchResults.jsp";
	}
	
	
	
	/*======================================*/
	// Method: selectedProduct() Rendering
	/*======================================*/
	 @GetMapping("details/{id}")
	 public String selectedProduct(@ModelAttribute("count") Counter quantity, @PathVariable("id") Long id, Model viewModel,HttpSession session) {
		 User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));		    	
		 BookProduct thisBook =  bpService.findABookProduct(id);
	      viewModel.addAttribute("thisBook", thisBook);  
	      
	      List<BookProduct> tempProdList =  currUser.getbProducts();	
	      
	      if (thisBook.getCount() > 0) {
	    	  tempProdList.add(thisBook);
	    	  currUser.setbProducts(tempProdList);
	      }
	      return "/details.jsp";	
	      
	 }//selectedProduct		

		
		/*======================================*/
		// Method: postProduct() Post
		/*======================================*/
		 @PostMapping("details/{id}")
		 public String postProduct(@Valid @ModelAttribute("count") Counter counter,  BindingResult result, @PathVariable("id") Long id, Model viewModel,HttpSession session) {
			 User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
			 BookProduct thisBook =  bpService.findABookProduct(id);			 
		     List<Counter> count = ctrService.displayAll();	
		     Counter cnt = ctrService.findACount(id);
			 
	         int total = 0;      
	         for (Counter temp : count) {
	        	  total = total + temp.getQuantity();
	          }
	         
	         int countAmt = counter.getQuantity() + total;
	         
	         cnt.setQuantity(counter.getQuantity());
	         //System.out.println("countAmt is " + countAmt);
  
			 thisBook.setCount(counter.getQuantity());
			 cnt.setQuantity(countAmt);
			 this.ctrService.update(cnt);
			 this.bpService.update(thisBook);			 
			 
			 viewModel.addAttribute("cnt", cnt);
			 viewModel.addAttribute("thisBook", thisBook);
			 counter.setCounts(thisBook);
			 

			 this.ctrService.update(counter);		
	      
		  	 if(result.hasErrors()) {
				return "details.jsp";
		      }
		  	 	      		      
		      return "redirect:/bookclub/details/{id}";	
		      
		 }//selectedProduct		 
	 	
	
	//Render checkout results
	@GetMapping("/checkout")
		public String checkout(Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		List<BookProduct> bkProdList =  this.bpService.displayAll();	 
        List<BookProduct> userProdList =  currUser.getbProducts();
        
		List<Counter> count = ctrService.displayAll();	
        int totCnt = 0;      
        for (Counter temp : count) {
        	totCnt = totCnt + temp.getQuantity();
         }
		
		viewModel.addAttribute("count", totCnt);
        
        float total = 0;
        float totalDiscount = 0;
        
        for (BookProduct temp : bkProdList) {
        	 if (temp.getCount() > 0) {
        		 userProdList.add(temp);
        		 total = total + temp.getPrice();
        		 totalDiscount = totalDiscount + temp.getDiscount();
        	 }
        }
        
        currUser.setbProducts(userProdList);
		
		viewModel.addAttribute("user", currUser);	
		viewModel.addAttribute("productList", userProdList);	
		viewModel.addAttribute("total", total);
		viewModel.addAttribute("totalDiscount", totalDiscount);
		

		return "checkout.jsp";
		
	}//checkout
	
	
		
	//Render checkout results
	@GetMapping("/receipt")
		public String receipt(Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		List<BookProduct> bkProdList =  this.bpService.displayAll();	 
        List<BookProduct> userProdList =  currUser.getbProducts();
        
        float total = 0;
        float totalDiscount = 0;
        
        for (BookProduct temp : bkProdList) {
        	 if (temp.getCount() > 0) {
        		 userProdList.add(temp);
        		 total = total + temp.getPrice();
        		 totalDiscount = totalDiscount + temp.getDiscount();
        	 }
        }
        
       // currUser.setbProducts(userProdList);
		
		viewModel.addAttribute("user", currUser);	
		viewModel.addAttribute("productList", userProdList);	
		viewModel.addAttribute("total", total);
		viewModel.addAttribute("totalDiscount", totalDiscount);
		
		return "receipt.jsp";		
	}//checkout
	
	
	@PostMapping("/reviews")
	public String newReview(@Valid @ModelAttribute("reviews") Reviews review, BindingResult result, Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		
		if(result.hasErrors())
			return "dashboard.jsp";
		this.rvService.createReview(review);
		List<Reviews> reviewList = rvService.displayAll();
		System.out.println("review list is: " + reviewList);
		
		String defaultValue = "Enter a review or request";
		viewModel.addAttribute("defaultValue", defaultValue);
		viewModel.addAttribute("user", currUser);
		viewModel.addAttribute("reviewList", reviewList);
		
        for (Reviews temp : reviewList) {
       		System.out.println("review list is: " + temp.getReviewInput());
       }
	
		return "redirect:/bookclub/dashboard";
	}
	
	//Render Review
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String renderUpdate(@PathVariable("id") Long id, @ModelAttribute("reviews") Reviews review, Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		List<Reviews> reviewList = rvService.displayAll();	
		List<BookProduct> bkProdList =  this.bpService.displayAll();
		
		String defaultValue = "Enter a review or request";
		viewModel.addAttribute("defaultValue", defaultValue);	
		viewModel.addAttribute("reviewList", reviewList);
		viewModel.addAttribute("user", currUser);	
		viewModel.addAttribute("productList", bkProdList); 
		viewModel.addAttribute("id", id);	
		
		//Reset counters
		 List<BookProduct> bpList =  bpService.displayAll();
         int totCnt = 0;      
         for (BookProduct temp : bpList) {
        	 temp.setCount(0);
        	 this.bpService.update(temp);
          }
                 
		 List<Counter> count = ctrService.displayAll();	     
         for (Counter temp : count) {
        	  temp.setQuantity(0);
        	  this.ctrService.update(temp);     	  
         }		
			
		return "/dashboard.jsp";
		
	}
	//Update a review
	@RequestMapping(value="/update/{id}", method=RequestMethod.POST)
	public String update(@Valid @ModelAttribute("reviews") Reviews review, BindingResult result, @PathVariable("id") Long id, Model viewModel, HttpSession session) {
		User currUser = this.userService.findOneUser((Long)session.getAttribute("user_id"));
		//Reviews currReview = rvService.findAReview(id);
		List<BookProduct> bkProdList =  this.bpService.displayAll();
		List<Reviews> reviewList = rvService.displayAll();
		
		String defaultValue = "Enter a review or request";
		viewModel.addAttribute("defaultValue", defaultValue);	
		viewModel.addAttribute("reviewList", reviewList);
		viewModel.addAttribute("user", currUser);	
		viewModel.addAttribute("productList", bkProdList);
		viewModel.addAttribute("id", id);
		
		if(result.hasErrors()) {
			return "/dashboard.jsp";
		}else {
		this.rvService.update(review); 
			
		return "redirect:/bookclub/dashboard";
		}
	}
	
	
	//Remove a review
	@GetMapping("/delete/{id}")
	public String remove(@PathVariable("id") Long id) {
		rvService.removeAReview(id); 
		
		return "redirect:/bookclub/dashboard";
	}
	
	
}//bookclubcontroller



