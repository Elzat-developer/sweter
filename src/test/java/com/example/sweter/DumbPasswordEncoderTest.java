package com.example.sweter;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;


class DumbPasswordEncoderTest {

    @Test
    void encode() {
        DumbPasswordEncoder dumbPasswordEncoder = new DumbPasswordEncoder();
        Assertions.assertEquals("secret: 'mypwd'",dumbPasswordEncoder.encode("mypwd"));
    }
}