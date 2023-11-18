package com.codewitharjun.fullstackbackend.repository;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface AnimeEpisodeRepository extends JpaRepository<AnimeEpisode, Long> {

    // Metode untuk mencari episode berdasarkan anime
    List<AnimeEpisode> findByAnime(Anime anime);


    @Query(value = "SELECT * FROM anime_episode WHERE episode_number = :episodeNumber AND anime_id = :animeId", nativeQuery = true)
    Optional<AnimeEpisode> findByEpisodeNumberAndAnime_Id(@Param("episodeNumber") Integer episodeNumber, @Param("animeId") Long animeId);

}

