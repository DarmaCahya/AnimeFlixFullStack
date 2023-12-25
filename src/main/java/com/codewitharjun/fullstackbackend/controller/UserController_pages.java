package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import com.codewitharjun.fullstackbackend.repository.User_AdminRepository;
import com.codewitharjun.fullstackbackend.repository.User_CustomerRepository;
import com.codewitharjun.fullstackbackend.repository.User_PublisherRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.codewitharjun.fullstackbackend.model.Admin;
import com.codewitharjun.fullstackbackend.model.Customer;
import com.codewitharjun.fullstackbackend.model.FK_Admin;
import com.codewitharjun.fullstackbackend.model.FK_Customer;
import com.codewitharjun.fullstackbackend.model.FK_Publisher;
import com.codewitharjun.fullstackbackend.model.Publisher;

import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

/* Created by Arjun Gautam */
@RestController
@CrossOrigin("http://localhost:3000")
public class UserController_pages {

    @Autowired
    private UserRepository userRepository;

     @Autowired
    private User_AdminRepository user_AdminRepository;

    @Autowired
    private User_CustomerRepository user_CustomerRepository;

    @Autowired
    private User_PublisherRepository user_PublisherRepository;

    @GetMapping("/login")
    public ModelAndView loginPage() {
        ModelAndView modelAndView = new ModelAndView("/user/login");
        return modelAndView;
    }

    @PostMapping("/login")
    public ModelAndView login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        User user = userRepository.findByUsername(username);

        if (user != null) {
            // If username is found
            if (user.getPassword().equals(password)) {
                // If password is correct, save user information in the session
                session.setAttribute("loggedInUser", user);

                // Return ModelAndView with success message and user type
                ModelAndView modelAndView = new ModelAndView("/user/loginSuccess");
                modelAndView.addObject("message", "Login successful");
                modelAndView.addObject("username", user.getUsername());
                if (user instanceof Admin) {
                    modelAndView.addObject("userType", "ADMIN");
                } else if (user instanceof Customer) {
                    modelAndView.addObject("userType", "CUSTOMER");
                } else if (user instanceof Publisher) {
                    modelAndView.addObject("userType", "PUBLISHER");
                }

                return modelAndView;
            } else {
                // If password is incorrect, return ModelAndView with error message
                ModelAndView modelAndView = new ModelAndView("login");
                modelAndView.addObject("errorMessage", "Incorrect password");
                return modelAndView;
            }
        } else {
            // If username is not found, return ModelAndView with error message
            ModelAndView modelAndView = new ModelAndView("login");
            modelAndView.addObject("errorMessage", "Username not found");
            return modelAndView;
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpSession session, RedirectAttributesModelMap redirectAttributes) {
        // Get user information from the session
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // Remove user information from the session for logout
            session.removeAttribute("loggedInUser");
            redirectAttributes.addFlashAttribute("logoutMessage", "Logout successful");
            return ResponseEntity.status(HttpStatus.FOUND)
                    .header("Location", "http://localhost:8080/login")
                    .build();
        } else {
            // If no user is logged in, return JSON response with UNAUTHORIZED status
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .header("Location", "http://localhost:8080/login?error=User not logged in")
                    .build();
        }
    }


    @GetMapping("/register")
    public ModelAndView registerPage() {
        ModelAndView modelAndView = new ModelAndView("/user/register");
        return modelAndView;
    }

    @PostMapping("/register")
    public ModelAndView register(@RequestParam String username, @RequestParam String email, @RequestParam String password, @RequestParam String usertype, HttpSession session) {
        
        User newUser;
        if (usertype.equals("ADMIN")) {
            newUser = new Admin();
            FK_Admin newfkadmin  = new FK_Admin(username);
            user_AdminRepository.save(newfkadmin);
            ((Admin) newUser).setAdminCHMOD(newfkadmin);

        }else if (usertype.equals("CUSTOMER")) {
            newUser = new Customer();
            FK_Customer newfkcustomer  = new FK_Customer("Mr/Ms. "+ username);
            user_CustomerRepository.save(newfkcustomer);
            ((Customer) newUser).setCustomerCHMOD(newfkcustomer);

        } else {
            newUser = new Publisher();
            FK_Publisher newfkpublisher  = new FK_Publisher("PT. "+username);
            newfkpublisher.setNama(username);
            user_PublisherRepository.save(newfkpublisher);
            ((Publisher) newUser).setPublisherCHMOD(newfkpublisher);
        }
        newUser.setEmail(email);
        newUser.setUsername(username);
        newUser.setPassword(password);

        ModelAndView modelAndView = new ModelAndView("register");
        if (userRepository.findByUsername(newUser.getUsername()) != null) {
            modelAndView.addObject("Error Message", "Username already exists");
            return modelAndView;
        }

        // Cek apakah email sudah digunakan
        if (userRepository.findByEmail(newUser.getEmail()) != null) {
            modelAndView.addObject("Error Message", "Email already exists");
            return modelAndView;
        }

        // Simpan pengguna baru ke basis data
        userRepository.save(newUser);

        return new ModelAndView("redirect:/login");
    }
}
