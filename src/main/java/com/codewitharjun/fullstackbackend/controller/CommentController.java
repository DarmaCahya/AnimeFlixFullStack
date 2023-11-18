package com.codewitharjun.fullstackbackend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Comment;
import com.codewitharjun.fullstackbackend.model.Subscribe;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.AnimeEpisodeRepository;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;
import com.codewitharjun.fullstackbackend.repository.CommentRepository;
import com.codewitharjun.fullstackbackend.repository.SubscribeRepository;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/anime")
public class CommentController {

    private final CommentRepository commentRepository;

    @Autowired
    private AnimeRepository animeRepository;
    
    @Autowired
    private AnimeEpisodeRepository animeEpisodeRepository;

    @Autowired
    private SubscribeRepository subscribeRepository;

    @Autowired
    public CommentController(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    //liat komen berdasarkan userid dan animeepsid
    @GetMapping("/nonton/{animeEpisodeId}/user/{userId}/komen")
    public List<Comment> getCommentsByAnimeEpisodeIdAndUserId(@PathVariable Long animeEpisodeId, @PathVariable Long userId) {
        return commentRepository.findByAnimeEpisodeIdAndUserId(animeEpisodeId, userId);
    }

    

    @GetMapping("/nonton/{animeId}/eps/{episodeNumber}/komen")
    public ResponseEntity<List<Comment>> getByallAnimeEpisodeNumber(
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
                                .body(Collections.emptyList());
                    }
                }

                // Fetch comments for the specified anime episode
                List<Comment> comments = commentRepository.findByallAnimeEpisodeId(episode.getId());
                return ResponseEntity.ok(comments);
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


}
