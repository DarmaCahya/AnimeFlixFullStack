package com.codewitharjun.fullstackbackend.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class UserHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "anime_episode_id", nullable = false)
    private AnimeEpisode animeEpisode;  // Ganti dari "anime" menjadi "animeEpisode"

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Temporal(TemporalType.TIMESTAMP)
    private Date watchedAt;

    // Constructors, getters, and setters

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

    public Date getWatchedAt() {
        return watchedAt;
    }

    public void setWatchedAt(Date watchedAt) {
        this.watchedAt = watchedAt;
    }
}
