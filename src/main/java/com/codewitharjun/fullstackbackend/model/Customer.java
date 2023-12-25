package com.codewitharjun.fullstackbackend.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("CUSTOMER")
public class Customer extends User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "customerCHMOD_id", nullable = true)
    private FK_Customer customerCHMOD;

    

    public FK_Customer getCustomerCHMOD() {
        return customerCHMOD;
    }

    public void setCustomerCHMOD(FK_Customer customerCHMOD) {
        this.customerCHMOD = customerCHMOD;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    


}
