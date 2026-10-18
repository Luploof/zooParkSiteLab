package com.example.zooPark.controller;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class HomeControllerTest {

    @InjectMocks
    private HomeController homeController;

    @Test
    void home_ShouldReturnIndexView() {
        Model model = new ExtendedModelMap();

        String viewName = homeController.home(model);

        assertEquals("index", viewName);
    }


    @Test
    void home_WithAnonymousUser_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContext securityContext = mock(SecurityContext.class);
        Authentication authentication = mock(Authentication.class);
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(authentication);
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn("anonymousUser");

        String viewName = homeController.home(model);

        assertEquals("index", viewName);
        assertEquals(null, model.getAttribute("userEmail"));
    }

    @Test
    void home_WithNullAuthentication_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContext securityContext = mock(SecurityContext.class);
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(null);

        String viewName = homeController.home(model);

        assertEquals("index", viewName);
        assertEquals(null, model.getAttribute("userEmail"));
    }


    @Test
    void addUserEmail_WithAnonymousUser_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContext securityContext = mock(SecurityContext.class);
        Authentication authentication = mock(Authentication.class);
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(authentication);
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn("anonymousUser");

        homeController.home(model);

        assertEquals(null, model.getAttribute("userEmail"));
    }

    @Test
    void addUserEmail_WithNullAuthentication_ShouldNotAddEmailToModel() {
        Model model = new ExtendedModelMap();
        SecurityContext securityContext = mock(SecurityContext.class);
        SecurityContextHolder.setContext(securityContext);

        when(securityContext.getAuthentication()).thenReturn(null);

        homeController.home(model);

        assertEquals(null, model.getAttribute("userEmail"));
    }
}