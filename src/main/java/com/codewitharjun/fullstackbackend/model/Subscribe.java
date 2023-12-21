package com.codewitharjun.fullstackbackend.model;

import javax.persistence.*;

@Entity
public class Subscribe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long subscribeId;

    private int duration; // Representing the duration in months, for example

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // Constructors, getters, and setters

    // Constructors
    public Subscribe(User user) {
        this.user = user;
        this.duration = 2;
    }
    public Subscribe() {
    }


    public Subscribe(int duration, User user) {
        this.duration = duration;
        this.user = user;
    }

    public Subscribe(int duration) {
        this.duration = duration;
    }
    

    // Getters and Setters
    public Long getSubscribeId() {
        return subscribeId;
    }

    public void setSubscribeId(Long subscribeId) {
        this.subscribeId = subscribeId;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Subscribe{" +
                "subscribeId=" + subscribeId +
                ", duration=" + duration +
                ", user=" + user +
                '}';
    }
}
