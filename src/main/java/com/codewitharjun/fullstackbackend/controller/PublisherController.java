package com.codewitharjun.fullstackbackend.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.model.AnimeEpisode;
import com.codewitharjun.fullstackbackend.model.FK_Publisher;
import com.codewitharjun.fullstackbackend.model.Publisher;
import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.AnimeEpisodeRepository;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;
import com.codewitharjun.fullstackbackend.repository.CommentRepository;
import com.codewitharjun.fullstackbackend.repository.LikeRepository;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import com.codewitharjun.fullstackbackend.repository.User_CustomerRepository;

import java.util.List;

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
    public ModelAndView getAllUser(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());
        FK_Publisher fkPublisher = ((Publisher) user).getPublisherCHMOD();
        List<Anime> animePublisher = animeRepository.findByPublisher(fkPublisher);
        

        Long animeCount = animeRepository.count();
        Long likeCount = likeRepository.count();
        Long commnetCount = commentRepository.count();
        Long customerCount = user_CustomerRepository.count();

        ModelAndView modelAndView = new ModelAndView("/animeManager/AnimeManager");

        modelAndView.addObject("BanyakAnime", animeCount);
        modelAndView.addObject("BanyakAnimemu", animePublisher.size());
        modelAndView.addObject("BanyakLike", likeCount);
        modelAndView.addObject("BanyakComment", commnetCount);
        modelAndView.addObject("BanyakCustomer", customerCount);
        return modelAndView;
    }


    @GetMapping("/ListAnime")
    public ModelAndView getAllAnimeList(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());
        FK_Publisher fkPublisher = ((Publisher) user).getPublisherCHMOD();
        List<Anime> animePublisher = animeRepository.findByPublisher(fkPublisher);

        ModelAndView modelAndView = new ModelAndView("/animeManager/AnimeManager_ListAnime");
        modelAndView.addObject("animeList", animePublisher);

        return modelAndView;
    }

    @GetMapping("/TambahAnime")
    public ModelAndView FromaddAnime(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());
        
        ModelAndView modelAndView = new ModelAndView("/animeManager/AnimeManager_AddAnime");
        modelAndView.addObject("publiser", user);
        return modelAndView;
    }

    @PostMapping("/TambahAnime")
    public ModelAndView addAnime(@RequestParam String title,
                              @RequestParam String genre,
                              @RequestParam String description,
                              @RequestParam String thumbnail,
                              @RequestParam String release_year,
                              @RequestParam String video_url,
                              HttpSession session) {
         if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());
        FK_Publisher fkPublisher = ((Publisher) user).getPublisherCHMOD();
        Anime newAnime = new Anime((long) animeRepository.count() + 1,title, genre, description, Integer.parseInt(release_year), thumbnail, video_url,fkPublisher);
        animeRepository.save(newAnime);

        return new ModelAndView("redirect:./ListAnime");
    }


    @GetMapping("/TambahAnimeEpisode")
    public ModelAndView FromaddAnimeEpisode(HttpSession session) {
        if (session == null || session.getAttribute("loggedInUser") == null) {
            return new ModelAndView("redirect:/login");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findByUsername(loggedInUser.getUsername());
        FK_Publisher fkPublisher = ((Publisher) user).getPublisherCHMOD();

        ModelAndView modelAndView = new ModelAndView("/animeManager/AnimeManager_AddAnimeEpisode");
        List<Anime> animePublisher = animeRepository.findByPublisher(fkPublisher);
        modelAndView.addObject("animeList", animePublisher);
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
        return new ModelAndView("redirect:http://localhost:8080/Home/nonton/"+anime.getAnimeId()+"/eps");
    }
    
}
