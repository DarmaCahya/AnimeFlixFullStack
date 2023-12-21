package com.codewitharjun.fullstackbackend.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("ADMIN")
public class Admin extends User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "adminCHMOD_id", nullable = true)
    private FK_Admin adminCHMOD;

    public FK_Admin getAdminCHMOD() {
        return adminCHMOD;
    }
    public void setAdminCHMOD(FK_Admin adminCHMOD) {
        this.adminCHMOD = adminCHMOD;
    }


}
