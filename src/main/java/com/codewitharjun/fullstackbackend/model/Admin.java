package com.codewitharjun.fullstackbackend.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("ADMIN")
public class Admin extends User {

    private int adminCHMOD;  // Add attributes specific to Admin

    public int getAdminCHMOD() {
        return adminCHMOD;
    }

    public void setAdminCHMOD(int adminCHMOD) {
        this.adminCHMOD = adminCHMOD;
    }


}
