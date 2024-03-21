package com.codewitharjun.fullstackbackend.model;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.aspectj.lang.annotation.Before;

public class AnimeTest {

    private Anime anime;

    @Before
    public void setUp() {
        // Inisialisasi objek Anime sebelum setiap pengujian
        anime = new Anime();
        anime.setAnimeId(1L);
        anime.setTitle("Naruto");
        anime.setGenre("Action");
        anime.setDescription("A ninja adventure");
        anime.setReleaseYear(2002);
        anime.setThumbnail("naruto_thumbnail.jpg");
        anime.setVideoUrl("https://www.example.com/naruto");
        FK_Publisher publisher = new FK_Publisher();
        publisher.setPublisherId(1L);
        publisher.setName("Shueisha");
        anime.setPublisher(publisher);
        anime.setLikes(100);
    }

    @Test
    public void testAnimeCreation() {
        // Pengujian pembuatan objek Anime
        assertNotNull(anime);
    }

    @Test
    public void testGettersAndSetters() {
        // Pengujian getter dan setter
        assertEquals(Long.valueOf(1L), anime.getAnimeId());
        assertEquals("Naruto", anime.getTitle());
        assertEquals("Action", anime.getGenre());
        assertEquals("A ninja adventure", anime.getDescription());
        assertEquals(2002, anime.getReleaseYear());
        assertEquals("naruto_thumbnail.jpg", anime.getThumbnail());
        assertEquals("https://www.example.com/naruto", anime.getVideoUrl());
        assertEquals("Shueisha", anime.getPublisher().getName());
        assertEquals(100, anime.getLikes());
    }

    @Test
    public void testLikeIncrement() {
        // Pengujian peningkatan jumlah suka
        int initialLikes = anime.getLikes();
        anime.setLikes(initialLikes + 1);
        assertEquals(initialLikes + 1, anime.getLikes());
    }
}
