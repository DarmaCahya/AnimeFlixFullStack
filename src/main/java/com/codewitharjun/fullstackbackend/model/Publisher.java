package com.codewitharjun.fullstackbackend.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("PUBLISHER")
public class Publisher extends User {

    private int publisherCHMOD;  // Add attributes specific to Publisher

    public int getPublisherCHMOD() {
        return publisherCHMOD;
    }

    public void setPublisherCHMOD(int publisherCHMOD) {
        this.publisherCHMOD = publisherCHMOD;
    }

}
