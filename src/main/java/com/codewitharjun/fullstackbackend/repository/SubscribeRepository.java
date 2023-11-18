package com.codewitharjun.fullstackbackend.repository;

import com.codewitharjun.fullstackbackend.model.Subscribe;
import com.codewitharjun.fullstackbackend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SubscribeRepository extends JpaRepository<Subscribe, Long> {
    Optional<Subscribe> findByUser(User user);
}
