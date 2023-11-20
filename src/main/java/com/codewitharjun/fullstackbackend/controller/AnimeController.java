package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Comment;
import com.codewitharjun.fullstackbackend.model.Like;
import com.codewitharjun.fullstackbackend.model.Subscribe;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.model.UserHistory;
import com.codewitharjun.fullstackbackend.repository.AnimeEpisodeRepository;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;
import com.codewitharjun.fullstackbackend.repository.CommentRepository;
import com.codewitharjun.fullstackbackend.repository.LikeRepository;
import com.codewitharjun.fullstackbackend.repository.SubscribeRepository;
import com.codewitharjun.fullstackbackend.repository.UserHistoryRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/api/anime")
public class AnimeController {

    @Autowired
    private AnimeRepository animeRepository;

    @Autowired
    private AnimeEpisodeRepository animeEpisodeRepository;

    @Autowired
    private UserHistoryRepository userHistoryRepository;
    
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private LikeRepository likeRepository;

    @Autowired
    private SubscribeRepository subscribeRepository;



    // @GetMapping("/all")
    // public ResponseEntity<List<Anime>> getAllAnime() {
    //     List<Anime> animeList = animeRepository.findAll();
    //     return ResponseEntity.ok(animeList);
    // }

   @GetMapping("/all")
    public ModelAndView getAllAnime() {
        List<Anime> animeList = animeRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("allAnime");
        modelAndView.addObject("animeList", animeList);
        return modelAndView;
    }

    @GetMapping("/all-json")
    public ResponseEntity<List<Anime>> getAllAnimeJson() {
        List<Anime> animeList = animeRepository.findAll();
        return ResponseEntity.ok(animeList);
    }



    @GetMapping("/search/genre/{nama_genre}")
    public ResponseEntity<List<Anime>> getAnimeByGenre(@PathVariable String nama_genre) {
        List<Anime> animeList = animeRepository.findByGenre(nama_genre);
        return ResponseEntity.ok(animeList);
    }

    @GetMapping("/search/judul/{judul_anime}")
    public ResponseEntity<List<Anime>> getAnimeByJudul(@PathVariable String judul_anime) {
        List<Anime> animeList = animeRepository.findByTitleCustomQuery(judul_anime);
        return ResponseEntity.ok(animeList);
    }

    @GetMapping("/search/publisher/{nama_publisher}")
    public ResponseEntity<List<Anime>> getAnimeByPublisher(@PathVariable String nama_publisher) {
        List<Anime> animeList = animeRepository.findByPublisher(nama_publisher);
        return ResponseEntity.ok(animeList);
    }
    
    @GetMapping("/search/id/{animeId}")
    public ResponseEntity<Anime> getAnimeById(@PathVariable Long animeId) {
        // Temukan anime berdasarkan animeId
        Optional<Anime> animeOptional = animeRepository.findById(animeId);
        if (animeOptional.isPresent()) {
            Anime anime = animeOptional.get();
            return ResponseEntity.ok(anime);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @GetMapping("/nonton/{animeId}/detail")
    public ResponseEntity<Anime> getAnimeByIdEps(@PathVariable Long animeId) {
        // Temukan anime berdasarkan animeId
        Optional<Anime> animeOptional = animeRepository.findById(animeId);
        if (animeOptional.isPresent()) {
            Anime anime = animeOptional.get();
            return ResponseEntity.ok(anime);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @GetMapping("/nonton/{animeId}/eps")
    public ResponseEntity<List<AnimeEpisode>> watchAnime(@PathVariable Long animeId) {
        // Cek apakah anime dengan animeId ditemukan
        Anime anime = animeRepository.findById(animeId).orElse(null);

        if (anime != null) {
            // Jika ditemukan, ambil daftar episode untuk anime tersebut
            List<AnimeEpisode> episodeList = animeEpisodeRepository.findByAnime(anime);
            return ResponseEntity.ok(episodeList);
        } else {
            // Jika tidak ditemukan, kembalikan respons dengan status NOT FOUND
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/nonton/{animeId}/eps/{episodeNumber}")
    public ResponseEntity<String> GetwatchAnimeEpisode(
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

                        return ResponseEntity.ok("Watching episode " + episodeNumber + " of anime " + anime.getTitle());
                    } else {
                        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                                .body("You need to be subscribed to watch this episode.");
                    }
                } else {
                    // If the episode does not require subscription, allow the user to watch
                    UserHistory userHistory = new UserHistory();
                    userHistory.setUser(loggedInUser);  // Ensure user is not null
                    userHistory.setAnimeEpisode(episode);
                    userHistory.setWatchedAt(new Date());

                    userHistoryRepository.save(userHistory);

                    return ResponseEntity.ok("Watching episode " + episodeNumber + " of anime " + anime.getTitle());
                }
            } else {
                return ResponseEntity.notFound().build();
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    private boolean checkUserSubscription(User user) {
        // Implement your logic to check if the user is subscribed

        // Example: Check if there is a subscription record for the user
        Optional<Subscribe> subscription = subscribeRepository.findByUser(user);

        // Return true if the user is subscribed, false otherwise
        return subscription.isPresent();
    }

    
    @PostMapping("/nonton/{animeId}/like")
    public ResponseEntity<String> likeAnime(@PathVariable Long animeId) {
        Anime anime = animeRepository.findByAnimeId(animeId);

        if (anime != null) {
            // Increment the likes
            animeRepository.incrementLikes(animeId);

            return ResponseEntity.ok("Liked the anime.");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/nonton/{animeId}/eps/{episodeNumber}/komen")
    public ResponseEntity<String> addComment(
            @PathVariable Long animeId,
            @PathVariable Integer episodeNumber,
            @RequestBody String comment,
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
                                .body("You need to be subscribed to add a comment for this episode.");
                    }
                }
    
                // Get the user from the repository
                User user = userRepository.findByUsername(loggedInUser.getUsername());
    
                // Add the comment
                Comment animeComment = new Comment();
                animeComment.setUser(user);
                animeComment.setAnimeEpisode(episode);
                animeComment.setComment(comment);
                animeComment.setCommentedAt(new Date());
    
                // Save the comment
                commentRepository.save(animeComment);
    
                return ResponseEntity.ok("Comment added successfully.");
            } else {
                return ResponseEntity.notFound().build();
            }
        } else {
            return ResponseEntity.notFound().build();
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
