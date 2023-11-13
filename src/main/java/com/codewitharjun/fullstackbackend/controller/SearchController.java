package com.codewitharjun.fullstackbackend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codewitharjun.fullstackbackend.model.Anime;
import com.codewitharjun.fullstackbackend.repository.AnimeRepository;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private AnimeRepository animeRepository;

    @GetMapping("/genre")
    public String showGenreSearchPage() {
        return "searchGenre";
    }

    @GetMapping("/genre/result")
    public String searchByGenre(@RequestParam String nama_genre, Model model) {
        List<Anime> animeList = animeRepository.findByGenre(nama_genre);
        model.addAttribute("animeList", animeList);
        return "genreSearchResult";
    }
}

