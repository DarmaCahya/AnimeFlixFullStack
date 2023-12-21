package com.codewitharjun.fullstackbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.codewitharjun.fullstackbackend.model.FK_Customer;

public interface User_CustomerRepository extends JpaRepository<FK_Customer,Long>{
}
