package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codewitharjun.fullstackbackend.model.Admin;


import javax.servlet.http.HttpSession;

/* Created by Arjun Gautam */
@RestController
@CrossOrigin("http://localhost:3000")
public class UserController_pages {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public ModelAndView loginPage() {
        ModelAndView modelAndView = new ModelAndView("login");
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
                ModelAndView modelAndView = new ModelAndView("loginSuccess");
                modelAndView.addObject("message", "Login successful");
                modelAndView.addObject("username", user.getUsername());
                modelAndView.addObject("userType", user instanceof Admin ? "ADMIN" : "REGULAR");

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
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        // Dapatkan informasi pengguna dari sesi
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // Hapus informasi pengguna dari sesi untuk logout
            session.removeAttribute("loggedInUser");
            redirectAttributes.addFlashAttribute("logoutMessage", "Logout successful");
            return "redirect:http://localhost:8080/login";
        } else {
            // Jika tidak ada pengguna yang login, kembalikan respons JSON dengan status UNAUTHORIZED
            return "redirect:http://localhost:8080/login?error=User not logged in";
        }
    }
}
