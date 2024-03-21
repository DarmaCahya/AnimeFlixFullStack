package com.codewitharjun.fullstackbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.codewitharjun.fullstackbackend.model.FK_Admin;

public interface User_AdminRepository extends JpaRepository<FK_Admin,Long>{
}
