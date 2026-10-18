package com.example.zooPark.controller;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DecimalFormat;

@Controller
@RequestMapping("/tickets")
public class TicketController {

    @GetMapping
    public String showTicketsPage(Model model) {
        addUserEmail(model);
        return "tickets";
    }

    @PostMapping
    public void buyTicket(
            @RequestParam("ticketType") String ticketType,
            @RequestParam(value = "quantity", defaultValue = "1") int quantity,
            HttpServletResponse response) throws IOException {
        String userEmail = getCurrentUserEmail();

        String ticketName;
        double price;
        switch (ticketType.toLowerCase()) {
            case "adult":
                ticketName = "Взрослый";
                price = 20.0;
                break;
            case "child":
                ticketName = "Детский";
                price = 10.0;
                break;
            case "benefit":
                ticketName = "Льготный";
                price = 15.0;
                break;
            default:
                ticketName = "Неизвестный";
                price = 0;
        }

        double total = price * quantity;
        DecimalFormat df = new DecimalFormat("#0.00");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"ticket.pdf\"");


        PdfWriter writer = new PdfWriter(response.getOutputStream());
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf, PageSize.A6.rotate());

        String fontResource = "src/main/resources/arialmt.ttf";
        PdfFont font = PdfFontFactory.createFont(fontResource, PdfEncodings.IDENTITY_H);


        Paragraph title = new Paragraph("Зоопарк \"Зелёный Мир\"")
                .setFont(font)
                .setFontSize(20)
                .setBold()
                .setFontColor(ColorConstants.GREEN)
                .setMarginBottom(20);
        document.add(title);

        Paragraph info = new Paragraph()
                .setFont(font)
                .setFontSize(14)
                .setPadding(10)
                .add("Тип билета: " + ticketName + "\n")
                .add("Количество: " + quantity + "\n")
                .add("Стоимость: " + df.format(total) + " BYN\n")
                .add("Email покупателя: " + userEmail + "\n");
        document.add(info);

        document.close();
    }

    public String getCurrentUserEmail() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            return auth.getName();
        }
        return "неизвестно";
    }

    private void addUserEmail(Model model) {
        model.addAttribute("userEmail", getCurrentUserEmail());
    }
}
