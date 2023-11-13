package com.codewitharjun.fullstackbackend.repository;

import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.model.UserHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserHistoryRepository extends JpaRepository<UserHistory, Long> {

    // Metode untuk mencari riwayat pengguna berdasarkan pengguna
    List<UserHistory> findByUser(User user);

    // Metode untuk mencari riwayat pengguna berdasarkan epsanime
    List<UserHistory> findByAnimeEpisode(AnimeEpisode animeEpisode);
}
