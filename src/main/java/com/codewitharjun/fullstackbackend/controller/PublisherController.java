package com.codewitharjun.fullstackbackend.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.codewitharjun.fullstackbackend.exception.UserNotFoundException;
import com.codewitharjun.fullstackbackend.model.Admin;
import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.Customer;
import com.codewitharjun.fullstackbackend.model.FK_Customer;
import com.codewitharjun.fullstackbackend.model.Publisher;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.model.UserHistory;
import com.codewitharjun.fullstackbackend.repository.AnimeEpisodeRepository;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;
import com.codewitharjun.fullstackbackend.repository.CommentRepository;
import com.codewitharjun.fullstackbackend.repository.LikeRepository;
import com.codewitharjun.fullstackbackend.repository.UserHistoryRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import com.codewitharjun.fullstackbackend.repository.User_CustomerRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/AnimeManager")
public class PublisherController extends UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private User_CustomerRepository user_CustomerRepository;

    
    @Autowired
    private AnimeEpisodeRepository animeEpisodeRepository;

    @Autowired
    private AnimeRepository animeRepository;

    @Autowired
    private LikeRepository likeRepository;

    @Autowired
    private CommentRepository commentRepository;

    

    @GetMapping("")
    public ModelAndView getAllUser() {
        Long animeCount = animeRepository.count();
        Long likeCount = likeRepository.count();
        Long commnetCount = commentRepository.count();
        Long customerCount = user_CustomerRepository.count();

        ModelAndView modelAndView = new ModelAndView("AnimeManager");

        modelAndView.addObject("BanyakAnime", animeCount);
        modelAndView.addObject("BanyakLike", likeCount);
        modelAndView.addObject("BanyakComment", commnetCount);
        modelAndView.addObject("BanyakCustomer", customerCount);
        return modelAndView;
    }


    @GetMapping("/ListAnime")
    public ModelAndView getAllAnimeList() {
        List<Anime> animeList = animeRepository.findAll();

        ModelAndView modelAndView = new ModelAndView("AnimeManager_ListAnime");
        modelAndView.addObject("animeList", animeList);

        return modelAndView;
    }

    @GetMapping("/TambahAnime")
    public ModelAndView FromaddAnime() {
        ModelAndView modelAndView = new ModelAndView("AnimeManager_AddAnime");
        return modelAndView;
    }

    @PostMapping("/TambahAnime")
    public ModelAndView addAnime(@RequestParam String title,
                              @RequestParam String genre,
                              @RequestParam String description,
                              @RequestParam String publisher,
                              @RequestParam String thumbnail,
                              @RequestParam String release_year,
                              @RequestParam String video_url,
                              @RequestParam String likes) {
        //ModelAndView modelAndView = new ModelAndView("AnimeManager_AddAnime");
        Anime newAnime = new Anime((long) animeRepository.count() + 1,title, genre, description, Integer.parseInt(release_year), thumbnail, video_url, publisher, Integer.parseInt(likes));
        animeRepository.save(newAnime);

        return new ModelAndView("redirect:./ListAnime");
    }


    @GetMapping("/TambahAnimeEpisode")
    public ModelAndView FromaddAnimeEpisode() {
        ModelAndView modelAndView = new ModelAndView("AnimeManager_AddAnimeEpisode");
        List<Anime> animeList = animeRepository.findAll();
        modelAndView.addObject("animeList", animeList);
        return modelAndView;
    }

    @PostMapping("/TambahAnimeEpisode")
    public ModelAndView addAnimeEpisode(@RequestParam String episode_title,
                              @RequestParam String episode_number,
                              @RequestParam String video_url,
                              @RequestParam String requires_subscription,
                              @RequestParam String anime_id) {
        
        Anime anime = animeRepository.findById(Long.parseLong(anime_id)).orElse(null);
        AnimeEpisode newAnimeEpisode = new AnimeEpisode((long) animeRepository.count() + 1,episode_title, video_url, Boolean.parseBoolean(requires_subscription), Integer.parseInt(episode_number), anime);
        animeEpisodeRepository.save(newAnimeEpisode);
        return new ModelAndView("redirect:./ListAnime");
    }
    
}
