package com.codewitharjun.fullstackbackend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codewitharjun.fullstackbackend.model.Comment;
import com.codewitharjun.fullstackbackend.repository.CommentRepository;

import java.util.List;

@RestController
@RequestMapping("/api/anime")
public class CommentController {

    private final CommentRepository commentRepository;

    @Autowired
    public CommentController(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    //liat komen berdasarkan userid dan animeepsid
    @GetMapping("/nonton/{animeEpisodeId}/user/{userId}/komen")
    public List<Comment> getCommentsByAnimeEpisodeIdAndUserId(@PathVariable Long animeEpisodeId, @PathVariable Long userId) {
        return commentRepository.findByAnimeEpisodeIdAndUserId(animeEpisodeId, userId);
    }

    @GetMapping("/nonton/{animeId}/eps/{episodeId}/komen")
    public List<Comment> getByallAnimeEpisodeId(@PathVariable Long episodeId) {
        return commentRepository.findByallAnimeEpisodeId(episodeId);
    }
}
