package com.codewitharjun.fullstackbackend.model;

import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class UserTest {

    private User user;

    @Before
    public void setUp() {
        // Inisialisasi objek User sebelum setiap pengujian
        user = new User();
        user.setId(1L);
        user.setUsername("john_doe");
        user.setEmail("john@example.com");
        user.setPassword("securePassword");

        // Inisialisasi objek UserHistory
        UserHistory userHistory = new UserHistory();
        userHistory.setId(1L);
        userHistory.setAction("Login");
        userHistory.setUser(user);

        // Menetapkan daftar UserHistory ke User
        List<UserHistory> userHistories = new ArrayList<>();
        userHistories.add(userHistory);
        user.setUserHistories(userHistories);
    }

    @Test
    public void testUserCreation() {
        // Pengujian pembuatan objek User
        assertNotNull(user);
    }

    @Test
    public void testGettersAndSetters() {
        // Pengujian getter dan setter
        assertEquals(Long.valueOf(1L), user.getId());
        assertEquals("john_doe", user.getUsername());
        assertEquals("john@example.com", user.getEmail());
        assertEquals("securePassword", user.getPassword());

        // Pengujian getter dan setter untuk UserHistory
        assertNotNull(user.getUserHistories());
        assertEquals(1, user.getUserHistories().size());
        assertEquals("Login", user.getUserHistories().get(0).getAction());
    }
}
