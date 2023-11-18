package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.Subscribe;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.SubscribeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

@RestController
public class SubscribeController {
    private final SubscribeRepository subscribeRepository;

    @Autowired
    public SubscribeController( SubscribeRepository subscribeRepository) {
        this.subscribeRepository = subscribeRepository;
    }

    @GetMapping("/user/subscribe")
    public ResponseEntity<Map<String, String>> getSubscriptionStatus(HttpSession session) {
        // Get the currently logged-in user from the session
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // If the user is logged in, check the subscription status
            Optional<Subscribe> optionalSubscribe = subscribeRepository.findByUser(loggedInUser);

            if (optionalSubscribe.isPresent()) {
                Subscribe subscribe = optionalSubscribe.get();
                int duration = subscribe.getDuration();

                Map<String, String> response = new HashMap<>();
                response.put("message", "User is subscribed for " + duration + " months.");
                response.put("username", loggedInUser.getUsername());

                return ResponseEntity.ok(response);
            } else {
                // If the user is not subscribed
                Map<String, String> response = new HashMap<>();
                response.put("message", "User is not subscribed.");
                response.put("username", loggedInUser.getUsername());

                return ResponseEntity.ok(response);
            }
        } else {
            // If no user is logged in, return an unauthorized response
            Map<String, String> response = new HashMap<>();
            response.put("message", "User is not logged in");

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }

    @PostMapping("/user/subscribe")
    public ResponseEntity<Map<String, String>> subscribeUser(
        HttpSession session,
        @RequestBody Map<String, Integer> requestPayload
        ) {
            // Get the currently logged-in user from the session
            User loggedInUser = (User) session.getAttribute("loggedInUser");

            if (loggedInUser != null) {
                // Check if the user is already subscribed
                Optional<Subscribe> existingSubscription = subscribeRepository.findByUser(loggedInUser);

                int duration = requestPayload.getOrDefault("duration", 0);

                if (existingSubscription.isPresent()) {
                    // If the user is already subscribed, update the subscription duration
                    Subscribe subscribe = existingSubscription.get();
                    subscribe.setDuration(subscribe.getDuration() + duration);
                    subscribeRepository.save(subscribe);
                } else {
                    // If the user is not subscribed, create a new subscription
                    Subscribe subscribe = new Subscribe();
                    subscribe.setUser(loggedInUser);
                    subscribe.setDuration(duration);
                    subscribeRepository.save(subscribe);
                }

                Map<String, String> response = new HashMap<>();
                response.put("message", "Add User subscribed successfully for " + duration + " months.");
                response.put("username", loggedInUser.getUsername());

                return ResponseEntity.ok(response);
            } else {
                // If no user is logged in, return an unauthorized response
                Map<String, String> response = new HashMap<>();
                response.put("message", "User is not logged in");

                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
            }
        }

    @DeleteMapping("/user/subscribe")
    public ResponseEntity<Map<String, String>> resetSubscription(HttpSession session) {
        // Get the currently logged-in user from the session
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // Check if the user is subscribed
            Optional<Subscribe> existingSubscription = subscribeRepository.findByUser(loggedInUser);

            if (existingSubscription.isPresent()) {
                // If the user is subscribed, delete the subscription
                subscribeRepository.delete(existingSubscription.get());

                Map<String, String> response = new HashMap<>();
                response.put("message", "Subscription reset successfully for user: " + loggedInUser.getUsername());

                return ResponseEntity.ok(response);
            } else {
                // If the user is not subscribed, return a message indicating that there is no subscription to reset
                Map<String, String> response = new HashMap<>();
                response.put("message", "No subscription found for user: " + loggedInUser.getUsername());

                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
            }
        } else {
            // If no user is logged in, return an unauthorized response
            Map<String, String> response = new HashMap<>();
            response.put("message", "User is not logged in");

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }


}
