package com.codewitharjun.fullstackbackend.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
public class AnimeEpisode {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "anime_id", nullable = false)
    private Anime anime;

    @OneToMany(mappedBy = "animeEpisode", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();

    private String episodeTitle;
    private String videoUrl;
    
    // New field to indicate if the episode requires subscription
    private boolean requiresSubscription;

    // New field to represent the episode number
    private int episodeNumber;

    // Constructors, getters, and setters

    public Anime getAnime() {
        return anime;
    }

    public AnimeEpisode() {
    }

    public AnimeEpisode(Long id, String episodeTitle, String videoUrl, boolean requiresSubscription, int episodeNumber, Anime anime) {
        this.id = id;
        this.anime = anime;
        this.episodeTitle = episodeTitle;
        this.videoUrl = videoUrl;
        this.requiresSubscription = requiresSubscription;
        this.episodeNumber = episodeNumber;
    }

    public void setAnime(Anime anime) {
        this.anime = anime;
    }

    public String getEpisodeTitle() {
        return episodeTitle;
    }

    public void setEpisodeTitle(String episodeTitle) {
        this.episodeTitle = episodeTitle;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public boolean isRequiresSubscription() {
        return requiresSubscription;
    }

    public void setRequiresSubscription(boolean requiresSubscription) {
        this.requiresSubscription = requiresSubscription;
    }

    public int getEpisodeNumber() {
        return episodeNumber;
    }

    public void setEpisodeNumber(int episodeNumber) {
        this.episodeNumber = episodeNumber;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
}
