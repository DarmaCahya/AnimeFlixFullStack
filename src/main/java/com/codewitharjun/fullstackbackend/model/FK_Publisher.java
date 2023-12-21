package com.codewitharjun.fullstackbackend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FK_Publisher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String namaPerusahaan;
    private String TahunDidirikan;
    private String Alamat;
    private String Deskripsi;


    // Constructors, getters, and setters

    // Constructors
    public FK_Publisher() {
    }

    public FK_Publisher(String namaPerusahaan) {
        this.namaPerusahaan = namaPerusahaan;
    }

    public FK_Publisher(String namaPerusahaan, String tahunDidirikan, String alamat, String deskripsi) {
        this.namaPerusahaan = namaPerusahaan;
        TahunDidirikan = tahunDidirikan;
        Alamat = alamat;
        Deskripsi = deskripsi;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getNamaPerusahaan() {
        return namaPerusahaan;
    }


    public void setNamaPerusahaan(String namaPerusahaan) {
        this.namaPerusahaan = namaPerusahaan;
    }


    public String getTahunDidirikan() {
        return TahunDidirikan;
    }


    public void setTahunDidirikan(String tahunDidirikan) {
        TahunDidirikan = tahunDidirikan;
    }


    public String getAlamat() {
        return Alamat;
    }


    public void setAlamat(String alamat) {
        Alamat = alamat;
    }


    public String getDeskripsi() {
        return Deskripsi;
    }


    public void setDeskripsi(String deskripsi) {
        Deskripsi = deskripsi;
    }
    
}
