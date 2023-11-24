package com.codewitharjun.fullstackbackend.repository;

import com.codewitharjun.fullstackbackend.model.Anime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

public interface AnimeRepository extends JpaRepository<Anime, Long> {

    List<Anime> findByGenre(String genre);

    Optional<Anime> findByTitle(String title);

    // Menggunakan kueri kustom untuk mencari anime berdasarkan judul dengan awalan tertentu
    @Query("SELECT a FROM Anime a WHERE a.title LIKE :judulAnime%")
    List<Anime> findByTitleCustomQuery(@Param("judulAnime") String judulAnime);

    List<Anime> findByPublisher(String publisher);
    
    // Method to find anime by ID
    Anime findByAnimeId(Long animeId);

    // Method to increment likes for an anime
    @Modifying
    @Transactional
    @Query("UPDATE Anime a SET a.likes = a.likes + 1 WHERE a.animeId = :animeId")
    void incrementLikes(Long animeId);


    @Query("SELECT DISTINCT a.genre FROM Anime a")
    List<String> findAllGenres();
}
