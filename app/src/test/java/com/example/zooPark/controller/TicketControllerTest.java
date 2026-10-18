package com.example.zooPark.controller;


import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;



import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class TicketControllerTest {

    @Mock
    private HttpServletResponse response;

    @Mock
    private SecurityContext securityContext;

    @Mock
    private Authentication authentication;

    @InjectMocks
    private TicketController ticketController;

    @Test
    void showTicketsPage_ShouldReturnTicketsView() {
        Model model = new ExtendedModelMap();

        String viewName = ticketController.showTicketsPage(model);

        assertEquals("tickets", viewName);
    }




    @Test
    void getCurrentUserEmail_WithAnonymousUser_ShouldReturnUnknown() {
        setupAnonymousUser();

        String email = ticketController.getCurrentUserEmail();

        assertEquals("неизвестно", email);
    }

    @Test
    void getCurrentUserEmail_WithNullAuthentication_ShouldReturnUnknown() {
        SecurityContextHolder.setContext(securityContext);
        when(securityContext.getAuthentication()).thenReturn(null);

        String email = ticketController.getCurrentUserEmail();

        assertEquals("неизвестно", email);
    }


    private void setupAuthenticatedUser(String email) {
        SecurityContextHolder.setContext(securityContext);
        when(securityContext.getAuthentication()).thenReturn(authentication);
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn(email);
    }

    private void setupAnonymousUser() {
        SecurityContextHolder.setContext(securityContext);
        when(securityContext.getAuthentication()).thenReturn(authentication);
        when(authentication.isAuthenticated()).thenReturn(true);
        when(authentication.getPrincipal()).thenReturn("anonymousUser");
    }
}