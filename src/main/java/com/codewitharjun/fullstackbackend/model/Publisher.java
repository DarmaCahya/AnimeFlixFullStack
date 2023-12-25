package com.codewitharjun.fullstackbackend.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("PUBLISHER")
public class Publisher extends User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "publisherCHMOD_id", nullable = true)
    private FK_Publisher publisherCHMOD;

    public FK_Publisher getPublisherCHMOD() {
        return publisherCHMOD;
    }

    public void setPublisherCHMOD(FK_Publisher publisherCHMOD) {
        this.publisherCHMOD = publisherCHMOD;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    
}
