package com.codewitharjun.fullstackbackend.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.codewitharjun.fullstackbackend.exception.UserNotFoundException;
import com.codewitharjun.fullstackbackend.model.Admin;
import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.Customer;
import com.codewitharjun.fullstackbackend.model.FK_Customer;
import com.codewitharjun.fullstackbackend.model.Publisher;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.model.UserHistory;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;
import com.codewitharjun.fullstackbackend.repository.UserHistoryRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import com.codewitharjun.fullstackbackend.repository.User_CustomerRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/AnimeManager")
public class PublisherController extends UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private User_CustomerRepository user_CustomerRepository;

    
    @Autowired
    private UserHistoryRepository userHistoryRepository;

    @Autowired
    private AnimeRepository animeRepository;

    

    @GetMapping("")
    public ModelAndView getAllUser() {
        List<User> users = userRepository.getAllUsers();
        Long userCount = userRepository.countAllUsers();

        // Count users for each role
        long adminCount = users.stream().filter(user -> user instanceof Admin).count();
        long customerCount = users.stream().filter(user -> user instanceof Customer).count();
        long publisherCount = users.stream().filter(user -> user instanceof Publisher).count();

        ModelAndView modelAndView = new ModelAndView("cantAccess");

        modelAndView.addObject("banyakuser", userCount);
        modelAndView.addObject("adminCount", adminCount);
        modelAndView.addObject("customerCount", customerCount);
        modelAndView.addObject("publisherCount", publisherCount);

        return modelAndView;
    }
    
}
