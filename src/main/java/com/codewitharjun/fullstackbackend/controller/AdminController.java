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
@RequestMapping("/Dashboard")
public class AdminController extends UserController {
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

        ModelAndView modelAndView = new ModelAndView("Dashboard_Admin");

        modelAndView.addObject("banyakuser", userCount);
        modelAndView.addObject("adminCount", adminCount);
        modelAndView.addObject("customerCount", customerCount);
        modelAndView.addObject("publisherCount", publisherCount);

        return modelAndView;
    }

    

    @GetMapping("/ListCustomer")
    public ModelAndView getAllCustomer() {
        List<User> allUsers = userRepository.findAll();

        // Filter users based on their class type (instanceof)
        List<User> customerUsers = allUsers.stream()
                .filter(user -> user instanceof Customer)
                .collect(Collectors.toList());

        ModelAndView modelAndView = new ModelAndView("Dashboard_Admin_ListCustomer");
        modelAndView.addObject("users", customerUsers);
        return modelAndView;
    }

    @PostMapping("/ListCustomer/{id}")
    public ResponseEntity<String> AlertCustomer(@PathVariable String id){
        User user = userRepository.findById(Long.parseLong(id))
                .orElseThrow(() -> new UserNotFoundException(Long.parseLong(id)));
        FK_Customer fk_customer = ((Customer) user).getCustomerCHMOD();
        if (fk_customer.getPesan() == null){
            fk_customer.setPesan("Minimal Bayar dek");
            user_CustomerRepository.save(fk_customer);
            return ResponseEntity.status(HttpStatus.CREATED).body("User " + fk_customer.getId() + " has been Alert with Pesan:  " + fk_customer.getPesan()); 
        }
        else {
            fk_customer.setPesan(null);
            user_CustomerRepository.save(fk_customer);
            return ResponseEntity.status(HttpStatus.CREATED).body("User " + fk_customer.getId() + " Not Alerted with Pesan:  " + fk_customer.getPesan()); 
        }
            

        
    }

    @GetMapping("/ListPublisher")
    public ModelAndView getAllPublisher() {
        List<User> allUsers = userRepository.findAll();

        // Filter users based on their class type (instanceof)
        List<User> customerUsers = allUsers.stream()
                .filter(user -> user instanceof Publisher)
                .collect(Collectors.toList());

        ModelAndView modelAndView = new ModelAndView("Dashboard_Admin_ListPublisher");
        modelAndView.addObject("users", customerUsers);

        return modelAndView;
    }

    @GetMapping("/ListAnime")
    public ModelAndView getAllAnimeList() {
        List<Anime> animeList = animeRepository.findAll();

        ModelAndView modelAndView = new ModelAndView("Dashboard_Admin_ListAnime");
        modelAndView.addObject("animeList", animeList);

        return modelAndView;
    }

    



    // @Override
    // @GetMapping("/customer/{id}")
    // User getUserById(@PathVariable Long id) {
    //     return userRepository.findById(id)
    //             .orElseThrow(() -> new UserNotFoundException(id));
    // }

    // @Override
    // @PutMapping("/customer/{id}")
    // User updateUser(@RequestBody User newUser, @PathVariable Long id) {
    //     return userRepository.findById(id)
    //             .map(user -> {
    //                user.setUsername(newUser.getUsername());
    //                 user.setEmail(newUser.getEmail());
    //                 return userRepository.save(user);
    //             }).orElseThrow(() -> new UserNotFoundException(id));
    // }

    // @DeleteMapping("/customer/{id}")
    // String deleteUser(@PathVariable Long id){
    //     if(!userRepository.existsById(id)){
    //         throw new UserNotFoundException(id);
    //     }
    //     userRepository.deleteById(id);
    //     return  "User with id "+id+" has been deleted success.";
    // }

    @Override
    @GetMapping("/customer/status")
    public ResponseEntity<Map<String, String>> checkLogin(HttpSession session) {
        // Dapatkan informasi pengguna dari sesi
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // Jika pengguna sedang login, kembalikan respons JSON
            Map<String, String> response = new HashMap<>();
            response.put("message", "User is logged in");
            response.put("username", loggedInUser.getUsername());

            return ResponseEntity.ok(response);
        } else {
            // Jika tidak ada pengguna yang login, kembalikan respons JSON dengan pesan "User belum login"
            Map<String, String> response = new HashMap<>();
            response.put("message", "User is not logged in");

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }

    @Override
    @GetMapping("/customer/history")
    public ResponseEntity<List<UserHistory>> getUserWatchHistory(HttpSession session) {
        // Dapatkan informasi pengguna yang sedang login dari konteks keamanan
        // Dapatkan informasi pengguna dari sesi
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        String loggedInUsername = loggedInUser.getUsername();

        // Dapatkan pengguna berdasarkan username (misalnya, dari repositori pengguna)
        User user = userRepository.findByUsername(loggedInUsername);

        // Cari riwayat tontonan pengguna
        List<UserHistory> userHistoryList = userHistoryRepository.findByUser(user);

        if (userHistoryList != null && !userHistoryList.isEmpty()) {
            return ResponseEntity.ok(userHistoryList);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    
}
