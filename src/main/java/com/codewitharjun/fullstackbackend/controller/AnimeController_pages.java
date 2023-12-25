package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Comment;
import com.codewitharjun.fullstackbackend.model.Customer;
import com.codewitharjun.fullstackbackend.model.FK_Customer;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
//import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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
    public ModelAndView getAllAnime(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }
        ModelAndView modelAndView = new ModelAndView("Home");


        User user = (User) session.getAttribute("loggedInUser");

        if(user instanceof Customer){
            FK_Customer fk_customer = ((Customer) user).getCustomerCHMOD();
            modelAndView.addObject("PesanAlert", fk_customer.getPesan());
        }
    
        List<Anime> animeList = animeRepository.findAll();
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

    @GetMapping("/genre/")
    public ModelAndView getAllGenre() {
        ModelAndView modelAndView = new ModelAndView("AllGenre");
        List<String> allGenres = animeRepository.findAllGenres();
        modelAndView.addObject("allGenres", allGenres);
        return modelAndView;
    }

    @GetMapping("/genre/{genre}")
    public ModelAndView getAnimeByGenre(@PathVariable String genre) {
        List<Anime> animeList = animeRepository.findByGenre(genre);
        ModelAndView modelAndView = new ModelAndView("AnimebyGenre");
        modelAndView.addObject("animeList", animeList);
        return modelAndView;
    }

    @GetMapping("/history")
    public ModelAndView getUserWatchHistory(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");

        // Fetch all user history and order by watchedAt in descending order
        List<UserHistory> userHistoryList = userHistoryRepository.findByUserOrderByWatchedAtDesc(loggedInUser);

        // Use a Set to keep track of unique combinations of user and animeEpisode
        Set<Long> uniqueAnimeEpisodeIds = new HashSet<>();
        List<UserHistory> uniqueUserHistoryList = new ArrayList<>();

        for (UserHistory userHistory : userHistoryList) {
            Long animeEpisodeId = userHistory.getAnimeEpisode().getId();
            if (!uniqueAnimeEpisodeIds.contains(animeEpisodeId)) {
                uniqueAnimeEpisodeIds.add(animeEpisodeId);
                uniqueUserHistoryList.add(userHistory);
            }
        }

        ModelAndView modelAndView = new ModelAndView("HistoryLastWatched");
        modelAndView.addObject("userHistoryList", uniqueUserHistoryList);
        return modelAndView;
    }

    @GetMapping("/history/all")
    public ModelAndView getUserAllWatchHistory(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        // Fetch all user history and order by watchedAt in descending order
        List<UserHistory> userHistoryList = userHistoryRepository.findByUserOrderByWatchedAtDesc(loggedInUser);

        ModelAndView modelAndView = new ModelAndView("AllHistory");
        modelAndView.addObject("userHistoryList", userHistoryList);
        return modelAndView;
    }

    @GetMapping("/profile")
    public ModelAndView getProfile(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());

        ModelAndView modelAndView = new ModelAndView("profile");
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    
    @GetMapping("/search/")
    public ModelAndView getAnimeByGenre(
            @RequestParam("searchType") String searchType,
            @RequestParam("Cari") String searchTerm) {

        List<Anime> animeList;

        if ("genre".equals(searchType)) {
            // Handle genre-based search
            animeList = animeRepository.findByGenre(searchTerm);
        } else if ("title".equals(searchType)) {
            // Handle title-based search
            animeList = animeRepository.findByTitleCustomQuery(searchTerm);
        } else {
            // Handle other cases if needed
            animeList = Collections.emptyList();
        }

        ModelAndView modelAndView = new ModelAndView("SearchAnime");
        modelAndView.addObject("animeList", animeList);
        return modelAndView;
    }

    // @GetMapping("/search/judul/{judul_anime}")
    // public ModelAndView getAnimeByJudul(@PathVariable String judul_anime) {
    //     List<Anime> animeList = animeRepository.findByTitleCustomQuery(judul_anime);
    //     ModelAndView modelAndView = new ModelAndView("SearchAnimebyName");
    //     modelAndView.addObject("animeList", animeList);
    //     return modelAndView;
    // }

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
                        ModelAndView modelAndView = new ModelAndView("ErorrPage");
                        modelAndView.addObject("erorrcode", "403");
                        modelAndView.addObject("errorMessage", "You need to be subscribed to watch this episode.");
                        modelAndView.addObject("erorrRoute", "../eps");
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
                ModelAndView modelAndView = new ModelAndView("ErorrPage");
                modelAndView.addObject("erorrcode", "404");
                modelAndView.addObject("errorMessage", "Episode not found");
                modelAndView.addObject("erorrRoute", "../eps");
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

        @PostMapping("/nonton/{animeId}/eps/{episodeNumber}/comment")
        public ModelAndView addComment(
                @PathVariable Long animeId,
                @PathVariable Integer episodeNumber,
                @RequestParam String comment,
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

                    // Create a new Comment object
                    Comment newComment = new Comment();
                    newComment.setUser(loggedInUser);
                    newComment.setAnimeEpisode(episode);
                    newComment.setComment(comment);
                    newComment.setCommentedAt(new Date());

                    // Save the comment to the episode
                    episode.getComments().add(newComment);
                    animeEpisodeRepository.save(episode);

                    ModelAndView modelAndView = new ModelAndView("watchAnimeEps");
                    modelAndView.addObject("AnimeDetail", anime);
                    modelAndView.addObject("episode", episode);
                    modelAndView.addObject("errorMessage", "Komentar ditambahkan.");
                    return modelAndView;
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


    @PostMapping("/nonton/{animeId}/eps/{episodeNumber}/like")
    public ResponseEntity<String> likeAnimeEpisode(
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

                    if (!isSubscribed) {
                        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                                .body("You need to be subscribed to like this episode.");
                    }
                }

                // Get the user from the repository
                User user = userRepository.findByUsername(loggedInUser.getUsername());

                // Check if the user has already liked the episode
                if (likeRepository.existsByUserAndAnimeEpisode(user, episode)) {
                    return ResponseEntity.ok("User already liked this episode.");
                }

                // Save the like
                Like like = new Like();
                like.setUser(user);
                like.setAnimeEpisode(episode);
                likeRepository.save(like);

                return ResponseEntity.ok("Episode liked.");
            } else {
                return ResponseEntity.notFound().build();
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/nonton/{animeId}/eps/{episodeNumber}/like")
    public ResponseEntity<String> unlikeAnimeEpisode(
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

                    if (!isSubscribed) {
                        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                                .body("You need to be subscribed to unlike this episode.");
                    }
                }

                // Get the user from the repository
                User user = userRepository.findByUsername(loggedInUser.getUsername());

                // Check if the user has liked the episode
                Like like = likeRepository.findByUserAndAnimeEpisode(user, episode);

                if (like != null) {
                    // User has liked the episode, delete the like
                    likeRepository.delete(like);
                    return ResponseEntity.ok("Like removed.");
                } else {
                    return ResponseEntity.ok("User has not liked this episode.");
                }
            } else {
                return ResponseEntity.notFound().build();
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
