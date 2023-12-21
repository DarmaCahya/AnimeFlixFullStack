package com.codewitharjun.fullstackbackend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FK_Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String namaCustomer;
    private String jenisKelamin;
    private String payment_id;
    private String pesan;


    // Constructors, getters, and setters

    public String getPesan() {
        return pesan;
    }

    public void setPesan(String pesan) {
        this.pesan = pesan;
    }

    // Constructors
    public FK_Customer() {
    }

    public FK_Customer(String namaCustomer) {
        this.namaCustomer = namaCustomer;
    }

    public FK_Customer(String namaCustomer, String jenisKelamin, String payment_id) {
        this.namaCustomer = namaCustomer;
        this.jenisKelamin = jenisKelamin;
        this.payment_id = payment_id;
    }

    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getNamaCustomer() {
        return namaCustomer;
    }


    public void setNamaCustomer(String namaCustomer) {
        this.namaCustomer = namaCustomer;
    }


    public String getJenisKelamin() {
        return jenisKelamin;
    }


    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }


    public String getPayment_id() {
        return payment_id;
    }


    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }

    

}
