package com.codewitharjun.fullstackbackend.repository;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnimeEpisodeRepository extends JpaRepository<AnimeEpisode, Long> {

    // Metode untuk mencari episode berdasarkan anime
    List<AnimeEpisode> findByAnime(Anime anime);
}
