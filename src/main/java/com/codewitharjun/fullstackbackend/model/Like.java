package com.codewitharjun.fullstackbackend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "likes") // Specify a different name for the table
public class Like {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private AnimeEpisode animeEpisode;

    // Add other fields as needed

    // Constructors, getters, and setters

    public Like() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public AnimeEpisode getAnimeEpisode() {
        return animeEpisode;
    }

    public void setAnimeEpisode(AnimeEpisode animeEpisode) {
        this.animeEpisode = animeEpisode;
    }

    // Add other getters and setters for additional fields
}
