package com.codewitharjun.fullstackbackend.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("CUSTOMER")
public class Customer extends User {

    private int customerCHMOD;  // Add attributes specific to Customer

    public int getCustomerCHMOD() {
        return customerCHMOD;
    }

    public void setCustomerCHMOD(int customerCHMOD) {
        this.customerCHMOD = customerCHMOD;
    }


}
