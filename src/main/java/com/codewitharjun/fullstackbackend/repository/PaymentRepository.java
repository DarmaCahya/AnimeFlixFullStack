package com.codewitharjun.fullstackbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codewitharjun.fullstackbackend.model.Payment;
import com.codewitharjun.fullstackbackend.model.User;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {

    Iterable<Payment> findByUser(User user);
    
}
