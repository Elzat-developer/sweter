package com.example.sweter;

import com.example.sweter.controller.MainController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;

import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;

@SpringBootTest
@AutoConfigureMockMvc
@WithUserDetails("admin")
@ActiveProfiles("test")
@TestPropertySource("/application-test.properties")
@Sql(value = {"/create-user-before.sql", "/messages-list-before.sql"},executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
@Sql(value = {"/messages-list-after.sql", "/create-user-after.sql"},executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
public class MainControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private MainController controller;
    @Test
    public void mainPageTest() throws Exception {
        this.mockMvc.perform(get("/main"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id='navbarSupportedContent']/ul/div/span").string("admin"));
    }
    @Test
    public void messageListTest() throws Exception{
        this.mockMvc.perform(get("/main"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id='message-list']/div").nodeCount(3));
    }
    @Test
    public void filterMessageTest() throws Exception {
        this.mockMvc.perform(get("/main").param("filter","my-tag"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id='message-list']/div").nodeCount(3))
                .andExpect(xpath("//div[@id='message-list']/div[1]").exists())
                 .andExpect(xpath("//div[@id='message-list']/div[2]").exists());

    }
    @Test
    public void addMessageToListTest() throws Exception{
        MockHttpServletRequestBuilder multipart = multipart("/main")
                .file("file","123".getBytes())
                .param("text","fifth")
                .param("tag","new one")
                .with(csrf());

        this.mockMvc.perform(multipart)
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id='message-list']/div").nodeCount(3))
                .andExpect(xpath("//div[@id='message-list']/div[1]").exists())
                .andExpect(xpath("//div[@id='message-list']/div[1]/div/div[1]/span").string("first"))
                .andExpect(xpath("//div[@id='message-list']/div[1]/div/div[1]/i").string("#my-tag"));
    }
}
