package com.codewitharjun.fullstackbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.codewitharjun.fullstackbackend.model.FK_Publisher;

public interface User_PublisherRepository extends JpaRepository<FK_Publisher,Long>{
}
