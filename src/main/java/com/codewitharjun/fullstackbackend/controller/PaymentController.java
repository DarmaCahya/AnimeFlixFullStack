package com.codewitharjun.fullstackbackend.controller;

import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.codewitharjun.fullstackbackend.model.Payment;
import com.codewitharjun.fullstackbackend.model.Subscribe;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.PaymentRepository;
import com.codewitharjun.fullstackbackend.repository.SubscribeRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;

@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/Home/profile/payment")
public class PaymentController {
    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubscribeRepository subscribeRepository;

    @GetMapping("")
    public ModelAndView getPaymentPage(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }
        return new ModelAndView("Payment-Bayar");
    }

    @PostMapping("")
    public ModelAndView getPaymentStatus(HttpSession session, @RequestParam String paymentMethod, @RequestParam String duration) { 
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());

        Payment payment = new Payment(user, paymentMethod,true,new Date());
        paymentRepository.save(payment);
        if (loggedInUser != null) {
                int durationValue = Integer.parseInt(duration);

                Optional<Subscribe> existingSubscription = subscribeRepository.findByUser(loggedInUser);

                Subscribe subscribe;
        
                if (existingSubscription.isPresent()) {
                    // If the user is already subscribed, update the subscription duration
                    subscribe = existingSubscription.get();
                    subscribe.setDuration(subscribe.getDuration() + durationValue);
                } else {
                    // If the user is not subscribed, create a new subscription with the given duration
                    subscribe = new Subscribe(loggedInUser);
                    subscribe.setDuration(durationValue);
                }
        
                // Save or update the subscription
                subscribeRepository.save(subscribe);
        }
        return new ModelAndView("redirect:/Home/profile");
    }

    @GetMapping("/riwayat")
    public ModelAndView getPaymentHistory(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());
        Iterable<Payment> paymentList = paymentRepository.findByUser(user);
        ModelAndView modelAndView = new ModelAndView("Payment-Riwayat");
        modelAndView.addObject("riwayatpembayaran", paymentList);
        if(paymentList.spliterator().getExactSizeIfKnown() == 0){
            modelAndView = new ModelAndView("/error Page/ErorrPage");
            modelAndView.addObject("errorMessage", "Kamu belum pernah beli apapun");
            modelAndView.addObject("erorrRoute", "../");
        }
        return modelAndView;
    }

}
