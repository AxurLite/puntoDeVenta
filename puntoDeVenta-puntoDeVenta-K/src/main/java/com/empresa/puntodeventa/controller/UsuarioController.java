package com.empresa.puntodeventa.controller;

import com.empresa.puntodeventa.model.Usuario;
import com.empresa.puntodeventa.service.UsuarioServicio;
import com.empresa.puntodeventa.util.paginator.PageRender;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@SessionAttributes("usuario")
public class UsuarioController {
    private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);

    @Autowired
    private UsuarioServicio usuarioServicio;

    @GetMapping("admin/listar")
    public String listarUsuarios(@RequestParam(name = "page", defaultValue = "0") int page, Model model) {
        Pageable pageRequest = PageRequest.of(page, 10);
        Page<Usuario> usuarios = usuarioServicio.findAll(pageRequest);

        PageRender<Usuario> pageRender = new PageRender<>("/admin/listar", usuarios);
        model.addAttribute("listaUsuarios", usuarios);
        model.addAttribute("page", pageRender);
        return "admin/listar";
    }

    @GetMapping("admin/crear")
    public String crearUsuario(Model model) {
        Usuario usuario = new Usuario();
        model.addAttribute("usuario", usuario);
        return "admin/crear";
    }

    @PostMapping("admin/crear")
    public String guardarUsuario(@Valid Usuario usuario, BindingResult result, Model model, RedirectAttributes flash, SessionStatus sessionStatus) {
        if (result.hasErrors()) {
            model.addAttribute("usuario", usuario);
            return "admin/crear";
        }
        String flashMessage = (usuario.getIdUsuario() != null) ? "Usuario modificado con éxito" : "Usuario creado con éxito";
        usuarioServicio.saveUser(usuario);
        flash.addFlashAttribute("success", flashMessage);
        sessionStatus.setComplete();
        return "redirect:listar";
    }

    @GetMapping("/eliminar/{idUsuario}")
    public String eliminar(@PathVariable(value = "idUsuario") Long idUsuario, RedirectAttributes flash) {
        if (idUsuario > 0) {
            usuarioServicio.deleteUser(idUsuario);
            flash.addFlashAttribute("success", "Usuario eliminado con éxito");
        }
        return "redirect:/admin/listar";

    }


    @GetMapping("/admin/actualizar/{idUsuario}")
    public String actualizar(@PathVariable(value = "idUsuario") Long idUsuario, Model model, RedirectAttributes flash) {
        Usuario usuario = new Usuario();
        if (idUsuario > 0) {
            usuario = usuarioServicio.findUser(idUsuario);
            if (usuario == null) {
                flash.addFlashAttribute("error", "Cliente invalido");
                return "redirect:/admin/listar";
            }
        } else {
            flash.addFlashAttribute("error", "Cliente invalido");
            return "redirect:/admin/listar";
        }
        model.addAttribute("usuario", usuario);
        return "admin/actualizar";
    }


}
