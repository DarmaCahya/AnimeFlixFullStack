package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.repository.AnimeEpisodeRepository;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//import java.util.Collections;
import java.util.List;


@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/Home")
public class AnimeController_pages {

    @Autowired
    private AnimeRepository animeRepository;

    @Autowired
    private AnimeEpisodeRepository animeEpisodeRepository;

    @GetMapping("")
    public ModelAndView getAllAnime() {
        List<Anime> animeList = animeRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("allAnime");
        modelAndView.addObject("animeList", animeList);
    
        // Get all genres
        List<String> allGenres = animeRepository.findAllGenres();
        modelAndView.addObject("allGenres", allGenres);
    
        // Choose a random genre
        String randomGenre = getRandomGenre(allGenres);
    
        // Fetch animeList by the random genre
        List<Anime> animeListByRandomGenre = animeRepository.findByGenre(randomGenre);
        modelAndView.addObject("animeListgenre", animeListByRandomGenre);

        // Choose a random genre
        String randomGenre2 = getRandomGenre(allGenres);
    
        // Fetch animeList by the random genre
        List<Anime> animeListByRandomGenre2 = animeRepository.findByGenre(randomGenre2);
        modelAndView.addObject("animeListgenre2", animeListByRandomGenre2);
        

        // Choose a random genre
        String randomGenre3 = getRandomGenre(allGenres);
    
        // Fetch animeList by the random genre
        List<Anime> animeListByRandomGenre3 = animeRepository.findByGenre(randomGenre3);
        modelAndView.addObject("animeListgenre3", animeListByRandomGenre3);
        return modelAndView;
    }
    
    private String getRandomGenre(List<String> genres) {
        int randomIndex = (int) (Math.random() * genres.size());
        return genres.get(randomIndex);
    }
    
    @GetMapping("/search/genre/{nama_genre}")
    public ModelAndView getAnimeByGenre(@PathVariable String nama_genre) {
        List<Anime> animeList = animeRepository.findByGenre(nama_genre);
        ModelAndView modelAndView = new ModelAndView("SearchAnimebyGenre");
        modelAndView.addObject("animeList", animeList);
        return modelAndView;
    }

    @GetMapping("/search/judul/{judul_anime}")
    public ModelAndView getAnimeByJudul(@PathVariable String judul_anime) {
        List<Anime> animeList = animeRepository.findByTitleCustomQuery(judul_anime);
        ModelAndView modelAndView = new ModelAndView("SearchAnimebyName");
        modelAndView.addObject("animeList", animeList);
        return modelAndView;
    }

    @GetMapping("/nonton/{animeId}/eps")
    public ModelAndView watchAnime(@PathVariable Long animeId) {
        // Cek apakah anime dengan animeId ditemukan
        Anime anime = animeRepository.findById(animeId).orElse(null);

        //if (anime != null) {
            // Jika ditemukan, ambil daftar episode untuk anime tersebut
            List<AnimeEpisode> episodeList = animeEpisodeRepository.findByAnime(anime);
            ModelAndView modelAndView = new ModelAndView("watchAnime");
            modelAndView.addObject("AnimeDetail", anime);
            modelAndView.addObject("episodeList", episodeList);
            return modelAndView;
        
        //}
    }


}
