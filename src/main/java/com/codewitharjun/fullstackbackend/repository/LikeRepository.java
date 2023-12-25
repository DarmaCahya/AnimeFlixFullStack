package com.codewitharjun.fullstackbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Like;
import com.codewitharjun.fullstackbackend.model.User;

public interface LikeRepository extends JpaRepository<Like, Long> {

    boolean existsByUserAndAnimeEpisode(User user, AnimeEpisode animeEpisode);
    Like findByUserAndAnimeEpisode(User user, AnimeEpisode animeEpisode);

    @Query("SELECT l FROM Like l WHERE l.user.id = :userId")
    List<Like> findByUserId(@Param("userId") Long userId);

}
