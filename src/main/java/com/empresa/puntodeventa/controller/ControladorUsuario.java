package com.empresa.puntodeventa.controller;

import com.empresa.puntodeventa.model.Usuario;
import com.empresa.puntodeventa.services.ServicioPuesto;
import jakarta.validation.Valid;
import com.empresa.puntodeventa.services.ServicioUsuario;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


@Controller
public class ControladorUsuario {
    private static final Logger logger = LoggerFactory.getLogger(ControladorUsuario.class);
    @Autowired
    ServicioUsuario servicioUsuario;

    @Autowired
    ServicioPuesto servicioPuesto;

    @GetMapping("/admin/crear")
    public String formularioCrearUsuario(Model model) {
        model.addAttribute("formularioUsuario", new Usuario());
        model.addAttribute("listaPuesto", servicioPuesto.ObtenerPuestos());
        return "admin/crear";
    }

    @GetMapping("/admin/index")
    public String index() {
        return "admin/index";
    }

    @GetMapping("/admin/actualizar")
    public String actualizar() {
        return "admin/actualizar";
    }

    @GetMapping("/admin/modificar")
    public String modificar(Model model) {
        model.addAttribute("listaUsuarios", servicioUsuario.ObtenerUsuarios());
        return "admin/modificar";
    }

    @PostMapping("/admin/crear")
    public String crearUsuario(@Valid @ModelAttribute("formularioUsuario") Usuario usuario, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            model.addAttribute("formularioUsuario", usuario);//En vez de crear un nuevo usuario se regresa el que ya se creo.
        } else {
            try {
                servicioUsuario.crearUsuario(usuario);
            } catch (Exception e) {

                model.addAttribute("formularioUsuario", usuario);
                logger.error("Mensaje de error del formulario: {}", e.getMessage());
                model.addAttribute("mensajeErrorFormulario", e.getMessage());
                model.addAttribute("listaUsuarios", servicioUsuario.ObtenerUsuarios());
                model.addAttribute("listaPuesto", servicioPuesto.ObtenerPuestos());
            }

        }

        model.addAttribute("listaUsuarios", servicioUsuario.ObtenerUsuarios());
        model.addAttribute("listaPuesto", servicioPuesto.ObtenerPuestos());
        return "admin/crear";
    }
}
