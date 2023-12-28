package com.codewitharjun.fullstackbackend.model;

import org.junit.Before;
import org.junit.Test;

import java.util.Date;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class PaymentTest {

    private Payment payment;
    private User user;

    @Before
    public void setUp() {
        // Inisialisasi objek User dan Payment sebelum setiap pengujian
        user = new User();
        user.setId(1L);
        user.setUsername("john_doe");
        user.setEmail("john@example.com");
        user.setPassword("securePassword");

        payment = new Payment(user, "Credit Card", true, new Date());
        payment.setPaymentId(1L);
    }

    @Test
    public void testPaymentCreation() {
        // Pengujian pembuatan objek Payment
        assertNotNull(payment);
    }

    @Test
    public void testGettersAndSetters() {
        // Pengujian getter dan setter
        assertEquals(Long.valueOf(1L), payment.getPaymentId());
        assertEquals(user, payment.getUser());
        assertEquals("Credit Card", payment.getPaymentMethod());
        assertEquals(true, payment.getPaymentStatus());
        assertNotNull(payment.getPaymentDate());
    }
}
