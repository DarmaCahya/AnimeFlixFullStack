package com.codewitharjun.fullstackbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.codewitharjun.fullstackbackend.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    
    @Query(value = "SELECT * FROM comment c " +
            "WHERE c.anime_episode_id = :animeEpisodeId " +
            "AND c.user_id = :userId", nativeQuery = true)
    List<Comment> findByAnimeEpisodeIdAndUserId(@Param("animeEpisodeId") Long animeEpisodeId, @Param("userId") Long userId);

    @Query(value = "SELECT * FROM comment c " +
            "WHERE c.anime_episode_id = :animeEpisodeId ", nativeQuery = true)
    List<Comment> findByallAnimeEpisodeId(@Param("animeEpisodeId") Long animeEpisodeId);
}
