package com.codewitharjun.fullstackbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Like;
import com.codewitharjun.fullstackbackend.model.User;

public interface LikeRepository extends JpaRepository<Like, Long> {

    boolean existsByUserAndAnimeEpisode(User user, AnimeEpisode animeEpisode);
    Like findByUserAndAnimeEpisode(User user, AnimeEpisode animeEpisode);

}
