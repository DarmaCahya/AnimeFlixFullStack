package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Like;
import com.codewitharjun.fullstackbackend.model.Subscribe;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.model.UserHistory;
import com.codewitharjun.fullstackbackend.repository.AnimeEpisodeRepository;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;
import com.codewitharjun.fullstackbackend.repository.LikeRepository;
import com.codewitharjun.fullstackbackend.repository.SubscribeRepository;
import com.codewitharjun.fullstackbackend.repository.UserHistoryRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
//import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;


@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/Home")
public class AnimeController_pages {

    @Autowired
    private AnimeRepository animeRepository;

    @Autowired
    private AnimeEpisodeRepository animeEpisodeRepository;

    @Autowired
    private SubscribeRepository subscribeRepository;

    @Autowired
    private UserHistoryRepository userHistoryRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LikeRepository likeRepository;

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

    @PostMapping("/nonton/{animeId}/eps/{episodeNumber}")
    public ModelAndView getWatchAnimeEpisode(
        @PathVariable Long animeId,
        @PathVariable Integer episodeNumber,
        HttpSession session) {
    
        // Check if the anime exists
        Anime anime = animeRepository.findById(animeId).orElse(null);
    
        if (anime != null) {
            // Check if the episode exists for the given anime and episode number
            AnimeEpisode episode = animeEpisodeRepository.findByEpisodeNumberAndAnime_Id(episodeNumber, animeId)
                    .orElse(null);
    
            if (episode != null) {
                // Get the currently logged-in user from the session
                User loggedInUser = (User) session.getAttribute("loggedInUser");
    
                // Check if the episode requires subscription
                boolean requiresSubscription = episode.isRequiresSubscription();
    
                if (requiresSubscription) {
                    // If the episode requires subscription, check if the user is subscribed
                    boolean isSubscribed = checkUserSubscription(loggedInUser);
    
                    if (isSubscribed) {
                        // If the user is subscribed, update the user history
                        UserHistory userHistory = new UserHistory();
                        userHistory.setUser(loggedInUser);  // Ensure user is not null
                        userHistory.setAnimeEpisode(episode);
                        userHistory.setWatchedAt(new Date());
    
                        userHistoryRepository.save(userHistory);
    
                        ModelAndView modelAndView = new ModelAndView("watchAnimeEps");
                        modelAndView.addObject("AnimeDetail", anime);
                        modelAndView.addObject("episode", episode);
                        

                        // Get the user from the repository
                        User user = userRepository.findByUsername(loggedInUser.getUsername());
                                // Check if the user has already liked the episode
                        if (likeRepository.existsByUserAndAnimeEpisode(user, episode)) {
                            modelAndView.addObject("errorMessage", "User already liked this episode.");
                        }

                        // Save the like
                        Like like = new Like();
                        like.setUser(user);
                        like.setAnimeEpisode(episode);
                        likeRepository.save(like);
                        modelAndView.addObject("errorMessage", "Episode liked.");


                        return modelAndView;
                    } else {
                        // Handle case where subscription is required but user is not subscribed
                        ModelAndView modelAndView = new ModelAndView("subscriptionError");
                        modelAndView.addObject("errorMessage", "You need to be subscribed to watch this episode.");
                        return modelAndView;
                    }
                } else {
                    // If the episode does not require subscription, allow the user to watch
                    UserHistory userHistory = new UserHistory();
                    userHistory.setUser(loggedInUser);  // Ensure user is not null
                    userHistory.setAnimeEpisode(episode);
                    userHistory.setWatchedAt(new Date());
    
                    userHistoryRepository.save(userHistory);
                    ModelAndView modelAndView = new ModelAndView("watchAnimeEps");
                    modelAndView.addObject("animeDetail", anime);
                    modelAndView.addObject("episode", episode);
                    return modelAndView;
                }
            } else {
                // Handle case where the episode is not found
                ModelAndView modelAndView = new ModelAndView("episodeNotFound");
                modelAndView.addObject("errorMessage", "Episode not found");
                return modelAndView;
            }
        } else {
            // Handle case where the anime is not found
            ModelAndView modelAndView = new ModelAndView("animeNotFound");
            modelAndView.addObject("errorMessage", "Anime not found");
            return modelAndView;
        }
    }
    

        private boolean checkUserSubscription(User user) {
            // Implement your logic to check if the user is subscribed

            // Example: Check if there is a subscription record for the user
            Optional<Subscribe> subscription = subscribeRepository.findByUser(user);

            // Return true if the user is subscribed, false otherwise
            return subscription.isPresent();
        }

}
