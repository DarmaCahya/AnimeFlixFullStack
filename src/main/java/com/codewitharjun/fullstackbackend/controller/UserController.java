package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.exception.UserNotFoundException;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.model.UserHistory;
import com.codewitharjun.fullstackbackend.repository.UserHistoryRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.codewitharjun.fullstackbackend.model.Admin;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

/* Created by Arjun Gautam */
@RestController
@CrossOrigin("http://localhost:3000")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserHistoryRepository userHistoryRepository;

    @PostMapping("/user")
    public ResponseEntity<String> newUser(@RequestBody User newUser) {
        // Check if username or email already exists
        if (userRepository.existsByUsername(newUser.getUsername()) || userRepository.existsByEmail(newUser.getEmail())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Username or email is already in use");
        }

        // If username and email are unique, save the new user
        User savedUser = userRepository.save(newUser);
        return ResponseEntity.status(HttpStatus.CREATED).body("User created successfully with ID: " + savedUser.getId());
    }


    @GetMapping("/users")
    List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @GetMapping("/user/{id}")
    User getUserById(@PathVariable Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException(id));
    }

    @PutMapping("/user/{id}")
    User updateUser(@RequestBody User newUser, @PathVariable Long id) {
        return userRepository.findById(id)
                .map(user -> {
                    user.setUsername(newUser.getUsername());
                    user.setName(newUser.getName());
                    user.setEmail(newUser.getEmail());
                    return userRepository.save(user);
                }).orElseThrow(() -> new UserNotFoundException(id));
    }

    @DeleteMapping("/user/{id}")
    String deleteUser(@PathVariable Long id){
        if(!userRepository.existsById(id)){
            throw new UserNotFoundException(id);
        }
        userRepository.deleteById(id);
        return  "User with id "+id+" has been deleted success.";
    }


    @PostMapping("/login")
public ResponseEntity<Map<String, String>> login(@RequestBody Map<String, String> loginRequest, HttpSession session) {
    String username = loginRequest.get("username");
    String password = loginRequest.get("password");

    User user = userRepository.findByUsername(username);

    if (user != null) {
        // Jika username ditemukan
        if (user.getPassword().equals(password)) {
            // Jika password benar, simpan informasi pengguna dalam sesi
            session.setAttribute("loggedInUser", user);

            // Kembalikan respons JSON sukses dengan tambahan user_type
            Map<String, String> response = new HashMap<>();
            response.put("message", "Login successful");
            response.put("username", user.getUsername());
            response.put("user_type", user instanceof Admin ? "ADMIN" : "REGULAR");

            return ResponseEntity.ok(response);
        } else {
            // Jika password salah, kembalikan respons JSON dengan status UNAUTHORIZED
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("message", "Password salah"));
        }
    } else {
        // Jika username tidak ditemukan, kembalikan respons JSON dengan status UNAUTHORIZED
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("message", "Username tidak tersedia"));
    }
}

    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpSession session) {
        // Dapatkan informasi pengguna dari sesi
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // Hapus informasi pengguna dari sesi untuk logout
            session.removeAttribute("loggedInUser");
            return ResponseEntity.ok("Logout successful");
        } else {
            // Jika tidak ada pengguna yang login, kembalikan respons JSON dengan status UNAUTHORIZED
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
        }
    }


    @GetMapping("/user/status")
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


    @GetMapping("/user/history")
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


    @PostMapping("/register")
    ResponseEntity<String> registerUser(@RequestBody User newUser) {
        // Cek apakah username sudah digunakan
        if (userRepository.findByUsername(newUser.getUsername()) != null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Username already exists");
        }

        // Cek apakah email sudah digunakan
        if (userRepository.findByEmail(newUser.getEmail()) != null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Email already exists");
        }

        // Simpan pengguna baru ke basis data
        userRepository.save(newUser);

        return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully");
    }
}
