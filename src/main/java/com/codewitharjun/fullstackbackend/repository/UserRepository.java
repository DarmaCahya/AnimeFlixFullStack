package com.codewitharjun.fullstackbackend.repository;

import com.codewitharjun.fullstackbackend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
    User findByEmail(String email);


    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
}
