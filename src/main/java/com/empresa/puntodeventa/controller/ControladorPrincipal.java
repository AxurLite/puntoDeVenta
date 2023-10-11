package com.empresa.puntodeventa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorPrincipal {

    @GetMapping("/")
    public String principal() {
        return "sidePanel/principal";
    }

    @GetMapping("/inicio/avisos")
    public String avisos() {
        return "inicio/avisos";
    }

    @GetMapping("/avisos")
    public String avisosPOST() {
        return "avisos";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }




}
