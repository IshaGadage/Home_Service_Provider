package com.example.demo.controller;

import java.util.ArrayList;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.util.Optionals;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.bean.booking_list;
import com.example.demo.bean.contact;
import com.example.demo.bean.serviceprovider_register;
import com.example.demo.bean.services;

import com.example.demo.bean.user_register;
import com.example.demo.dao.booking_list_dao;
import com.example.demo.dao.contactdao;
import com.example.demo.dao.feedback_dao;
import com.example.demo.dao.services_dao;
import com.example.demo.dao.sreviceprovider_reg_dao;
import com.example.demo.dao.user_register_dao;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class services_controller {

	@RequestMapping("/index")
	public String index() {
		
		return "index";
		
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return"login";
	}
	
	@RequestMapping("/register")
	public String register() {
		
		return"register";
	}
	
	@RequestMapping("/serviceproviderreg")
	public String serviceproviderreg() {
		
		return "serviceproviderreg";
	}
	
	
	@RequestMapping("/admin_index")
	public String admin_index(HttpSession session) {
		List<booking_list> list=(List<booking_list>) bd.findAll();
		int total=0;
		for(booking_list b:list) {
			total=total+Integer.parseInt(b.getPrice());
		}
		session.setAttribute("bookingList", list);
		session.setAttribute("totaluser",((List) (urd.findAll())).size() );
		session.setAttribute("totalservice",((List) (srd.findAll())).size() );
		session.setAttribute("total", total);
		return "admin_index";
	}
	
	@RequestMapping("/admin_addservice")
	public String admin_addservice() {
		
		return "admin_addservice";
	}
	
	
	
//	@RequestMapping("/service")
//	public String service() {
//		
//		return "service";
//	}
	
	
//	@RequestMapping("/booking")
//	public String booking() {
//		
//		return"booking";
//	}
	
	
	
	
	
	
	
	
//	 user register
	
	@Autowired 
	
	user_register_dao urd;

//	@Autowired
//
//	JavaMailSender javamailSender;
		
	@RequestMapping("/user_insert")
		
			public String insert_data(user_register r)  {
			
		
				for(user_register r1 : urd.findAll()) {
			
					if( r1.getEmail().equals(r.getEmail())) {
						
						System.out.println("Email already exist");
						
						return "redirect:login";
					}
					else {
						
						 try {
							 urd.save(r);
							 
//							  MimeMessage messege=javamailSender.createMimeMessage();
//							  MimeMessageHelper helper=new MimeMessageHelper(messege);
//							  helper.setFrom("shreyasankpal17@gmail.com");
//							  helper.setTo(r.getEmail());
//							  helper.setSubject("Home Services");
//							// Create HTML content for the email
//							    String htmlContent = "<!DOCTYPE html>"
//							        + "<html>"
//							        + "<head>"
//							        + "<style>"
//							        + "body { font-family: Arial, sans-serif; background-color:#be6497f5; color: #333; margin: 0; padding: 0; }"
//							        + ".email-container { max-width: 600px; margin: 20px auto; background: #ffffff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); overflow: hidden; }"
//							        + ".header { background: #c17fa4f5; color:white; padding: 20px; text-align: center; font-size: 24px; font-weight: bold; }"
//							        + ".content { padding: 20px; }"
//							        + ".footer { background: #be6497f5; color: white; padding: 10px; text-align: center; font-size: 12px; }"
//							        + ".button { background: #c17fa4f5; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block; margin-top: 20px; }"
//							        + "</style>"
//							        + "</head>"
//							        + "<body>"
//							        + "<div class='email-container'>"
//							        + "  <div class='header'>Welcome to Home Services!</div>"
//							        + "  <div class='content'>"
//							        + "    <p>Dear " + r.getFname() + ",</p>"
//							        + "    <p>Thank you for registering with Home Services. We're thrilled to have you on board!</p>"
//							        + "    <p>Explore our range of new services just for you.</p>"
//							        + "    <a href='http://localhost:8080/index' class='button'>Start Services</a>"
//							        + "  </div>"
//							        + "  <div class='footer'>"
//							        + "    <p>Home Services; 2025. All rights reserved.</p>"
//							        + "    <p><a href='#'>Unsubscribe</a> | <a href='#'>Contact Us</a></p>"
//							        + "  </div>"
//							        + "</div>"
//							        + "</body>"
//							        + "</html>";
//
//							    // Set the email content as HTML
//							    helper.setText(htmlContent, true);
//							 
//							  System.out.println("email");
//							  javamailSender.send(messege);
							  
						  }catch(Exception e) {
							  System.out.println(e);
							  e.printStackTrace();
						  }
//						 session.setAttribute("msg", "send");
						return "redirect:login";
					}
						
					}
				return "register";
			}

//	user and admin login
	
	@Autowired
	sreviceprovider_reg_dao srd;

	@RequestMapping("/user_login")
	public String user_login(user_register r,HttpSession session) {
		
		
		String admin_email="admin@gmail.com";
		String admin_password="admin";
		
		if(admin_email.equals(r.getEmail()) && admin_password.equals(r.getPassword())) {
			
			System.out.println("admin logged in");
			
			return "redirect:admin_index";
		}
		
		int cnt=0;
		for(user_register r1 : urd.findAll()) {
			
			if(r1.getEmail().equals(r.getEmail()) && r1.getPassword().equals(r.getPassword())) {
				
//				System.out.println("logged in");
				session.setAttribute("login name",r1.getFname());
				session.setAttribute("email", r1.getEmail());
				
				return"index";
			}
			else {
				cnt++;
				
			}
		}
     for(serviceprovider_register r1 : srd.findAll()) {
			
			if(r1.getEmail().equals(r.getEmail())) {
				
//				System.out.println("logged in");
				session.setAttribute("provider name",r1.getFname());
				session.setAttribute("serviceprovider_email", r1.getEmail());
				
				return"redirect:serviceprovider_index";
			}
			else {
				cnt++;
				
			}
		}

		if(cnt>0) {
			
			return "login";
		}

		return "login";
	}
	
//	user admin logout
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, user_register r) {

		session.removeAttribute("login name");
		
		System.out.println("logout successfull");
		
		return "redirect:index";

	}
	
//	service provider register
	
	

	@RequestMapping("/serviceprovider_insert")
	public String serviceprovider_insert(serviceprovider_register spr) {
		
		System.out.println(spr.getPhoneno());
		System.out.println(spr.getDescription());
		System.out.println(spr.getPrice());
		System.out.println(spr.getService());
		
		srd.save(spr);
		
		return "redirect:login";
		
	}
	
//	add services from admin
	
	@Autowired 
	services_dao sd;
	
	@RequestMapping("/add_services")
	public String add_services(services s) {
		
		sd.save(s);
		System.out.println("Service added successfully");
		
		return "admin_showservice";
	}
	
//	admin show services
	
	@RequestMapping("/admin_showservices")
	public ArrayList admin_showservices(HttpServletRequest req , HttpServletResponse res) {
	
	ArrayList list = new ArrayList();
	
	for(services p : sd.findAll()) {
		
		list.add(p);
	}

	HttpSession session = req.getSession();
	session.setAttribute("servicelist",list);
	
	return list;
	
	}
	
//	show services to user
	
	@RequestMapping("/service")
	public ArrayList service(HttpServletRequest req , HttpServletResponse res) {
	
	ArrayList list = new ArrayList();
	
	for(services p : sd.findAll()) {
		
		list.add(p);
	}

	HttpSession session = req.getSession();
	session.setAttribute("services",list);
	
	return list;
	
	}
	
//	admin show users
	
	@RequestMapping("/admin_showusers")
	public ArrayList admin_showusers(HttpServletRequest req , HttpServletResponse res) {
	
	ArrayList list = new ArrayList();
	
	for(user_register p : urd.findAll()) {
		
		list.add(p);
	}

	HttpSession session = req.getSession();
	session.setAttribute("userlist",list);
	
	return list;
	
	}
	
//	admin show providers
	
	@RequestMapping("/admin_showproviders")
	public ArrayList admin_showproviders(HttpServletRequest req , HttpServletResponse res) {
	
	ArrayList list = new ArrayList();
	
	for(serviceprovider_register p : srd.findAll()) {
		
		list.add(p);
	}

	HttpSession session = req.getSession();
	session.setAttribute("providerslist",list);
	
	return list;
	
	}
	
	@Autowired
	feedback_dao fd;
	
	@RequestMapping("/admin_feedback")
	public ArrayList admin_feedback(HttpServletRequest req , HttpServletResponse res) {
	
	ArrayList list = new ArrayList();
	
	for(com.example.demo.bean.feedback p : fd.findAll()) {
		
		list.add(p);
	}

	HttpSession session = req.getSession();
	session.setAttribute("feedbacklist",list);
	
	return list;
	
	}
	
	@RequestMapping("/admin_contact")
	public ArrayList admin_contact(HttpServletRequest req , HttpServletResponse res) {
	
	ArrayList list = new ArrayList();
	
	for(com.example.demo.bean.contact p : cd.findAll()) {
		
		list.add(p);
	}
	HttpSession session = req.getSession();
	session.setAttribute("contactlist",list);
	
	return list;
	
	}
//	admin delete users
	
	@RequestMapping("/delete_users")
	public String delete_users(user_register ur) {
		
		urd.deleteById(ur.getU_id());
		
		return "redirect:admin_showusers";
	}
	
//	admin delete providers
	
	@RequestMapping("/delete_providers")
	public String delete_providers(serviceprovider_register ur) {
		
		srd.deleteById(ur.getS_id());
		
		return "redirect:admin_showproviders";
	}
	
//	admin delete services
	
	@RequestMapping("/delete_services")
	public String delete_services(services s) {
		
		sd.deleteById(s.getService_id());
		
		return "redirect:admin_showservices";
	}
	
	@Autowired 
	booking_list_dao bd;
	
//	user service providers display
	@GetMapping("/service_providers")
	public ArrayList<serviceprovider_register> datashow2(HttpServletRequest hsr, HttpServletResponse re,services s) {
		   
System.out.println(s.getService_name());
        
	    ArrayList<serviceprovider_register> list = new ArrayList<>();
	   
	    for (serviceprovider_register spr : srd.findAll()) {
//	        System.out.println(spr.getService());
	    	System.out.println(spr.getService().equals(s.getService_name()));
	    	int rating=0;
	    	int count=0;
	    	if(spr.getService().equals(s.getService_name())) {
	    		
	    		for(booking_list b:bd.findAll()) {
	    			if(b.getService_provider().equals(spr.getFname()+" "+spr.getLname())&& b.getService().equals(spr.getService())) {
	    				rating=rating+b.getStarRating();
	    				
	    				count++;
	    				
	    			}
	    		}
	    		if(count==0) {
	    			spr.setRating(rating);
	    		}else{
	    		int rate=rating/count;
	    	
	    		spr.setRating(rate);
	    		}
	    		list.add(spr);
	    	}
	    }
         
	    HttpSession session = hsr.getSession();
	    session.setAttribute("showdata", list);

	    return list;
	}
	
	@RequestMapping("/service_providers")
	public ArrayList<serviceprovider_register> datashow1(HttpServletRequest hsr, HttpServletResponse re,services s) {
	   
		System.out.println(s.getService_name());
        
	    ArrayList<serviceprovider_register> list = new ArrayList<>();
	   
	    for (serviceprovider_register spr : srd.findAll()) {
//	        System.out.println(spr.getService());
	    	System.out.println(spr.getService().equals(s.getService_name()));
	    	int rating=0;
	    	int count=0;
	    	if(spr.getService().equals(s.getService_name())) {
	    		
	    		for(booking_list b:bd.findAll()) {
	    			if(b.getService_provider().equals(spr.getFname()+" "+spr.getLname())&& b.getService().equals(spr.getService())) {
	    				rating=rating+b.getStarRating();
	    				System.out.println(rating);
	    				count++;
	    				System.out.println(count);
	    			}
	    		}
	    		System.out.println(rating);
	    		System.out.println(count);
	    		int rate=rating/count;
	    	
	    		spr.setRating(rate);
	    		list.add(spr);
	    	}
	    }
         
	    HttpSession session = hsr.getSession();
	    session.setAttribute("showdata", list);

	    return list;
	}

//	user service booking page display 
	
	@RequestMapping("/booking")
	public String booking(serviceprovider_register s,HttpServletRequest req , HttpServletResponse res) {
		
		
		Optional<serviceprovider_register> o= srd.findById(s.getS_id());
		
		serviceprovider_register  s1 = o.get();
		
		HttpSession session = req.getSession();
		session.setAttribute("servicedata",s1);
		
		return "booking";
		
	}
	
//	insert booking details 
	
	
	
	@RequestMapping("book_service")
	public String book_service(booking_list b) {
		
		bd.save(b);
		System.out.println("booked service succesfully");
		
		return"redirect:index";
	}
	
	
	@RequestMapping("/serviceprovider_index")
	public String services_showservices(HttpServletRequest req , HttpServletResponse res,HttpSession session) {
	
	List<booking_list> list = new ArrayList<>();
    
	String email=(String)session.getAttribute("serviceprovider_email");
     for(booking_list b:bd.findAll()) {
     if(email!=null) {
	 if(b.getServiceprovider_email().equals(email)){

	 list.add(b);
	 }
	 }
     }
	 session.setAttribute("bookinglist",list);
	return "serviceprovider_index";
	
	}
	
	@RequestMapping("/update_service_status")
	public String update_service_status(booking_list b) {
		Optional<booking_list> op=bd.findById(b.getB_id());
		
		booking_list b1=op.get();
		b1.setStatus(b.getStatus());
		bd.save(b1);
		return "redirect:serviceprovider_index";
	}
	
	
	
	@RequestMapping("/profile")
	public String rating(HttpSession session) {
	List<booking_list> list=(List<booking_list>) bd.findAll();
	session.setAttribute("bookinglist", list);
	
		return "profile";
	}
	
	@RequestMapping("/starUpdate")
	public String starUpdate(booking_list b,com.example.demo.bean.feedback f) {
		
		
		Optional<booking_list> op=bd.findById(b.getB_id());
		System.out.println(b.getB_id());
		booking_list b1=op.get();
		b1.setStarRating(b.getStarRating());
		System.out.println(b1.getStarRating());
		bd.save(b1);
		try {
		Optional<com.example.demo.bean.feedback> op1=fd.findById(b.getB_id());
		
		com.example.demo.bean.feedback f1=op1.get();
		
		f1.setRating(b.getStarRating());
		fd.save(f1);
		}catch(Exception e) {
			fd.save(f);
		}
		return "redirect:profile";
		
		
		
	    
		
	}
	
	
	@RequestMapping("/feedback")
	public String feedback(com.example.demo.bean.feedback f) {
		
		fd.save(f);
		
		return "redirect:index";
		
	}
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	//contact 
	@RequestMapping("/contactView")
	public String contact() {
		return "contact";
	}
	@Autowired
	contactdao cd;
	
	@RequestMapping("/contact")
	public String contacts(contact c) {
		cd.save(c);
		
		
		return "contact";
	}
	
	
	
}