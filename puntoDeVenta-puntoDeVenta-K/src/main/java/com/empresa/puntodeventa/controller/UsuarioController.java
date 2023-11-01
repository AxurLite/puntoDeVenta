package com.empresa.puntodeventa.controller;

import com.empresa.puntodeventa.model.CorreoElectronico;
import com.empresa.puntodeventa.model.Direccion;
import com.empresa.puntodeventa.model.Puesto;
import com.empresa.puntodeventa.model.Usuario;
import com.empresa.puntodeventa.service.*;
import com.empresa.puntodeventa.util.paginator.PageRender;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;


@Controller
@SessionAttributes("usuario")
public class UsuarioController {


    @Autowired
    private UsuarioServicio usuarioServicio;
    @Autowired
    private PuestoServicio puestoServicio;
    @Autowired
    private CorreoServico correoServico;
    @Autowired
    private DireccionServicio direccionServicio;
    @Autowired
    private UploadFileService uploadFileService;

    @GetMapping("admin/listar")
    public String listarUsuarios(@RequestParam(name = "page", defaultValue = "0") int page, Model model) {
        Pageable pageRequest = PageRequest.of(page, 13);
        Page<Usuario> usuarios = usuarioServicio.findAll(pageRequest);
        PageRender<Usuario> pageRender = new PageRender<>("/admin/listar", usuarios);
        model.addAttribute("listaUsuarios", usuarios);
        model.addAttribute("page", pageRender);
        return "admin/listar";
    }

    @GetMapping("admin/crear")
    public String crearUsuario(Model model) {
        Usuario usuario = new Usuario();
        CorreoElectronico correoElectronico = new CorreoElectronico();
        Direccion direccion = new Direccion();
        List<Puesto> puesto = puestoServicio.findAll();
        model.addAttribute("direccion", direccion);
        model.addAttribute("usuario", usuario);
        model.addAttribute("correoElectronico", correoElectronico);
        model.addAttribute("listaPuestos", puesto);
        return "admin/crear";
    }


    @PostMapping("admin/crear")
    public String guardarUsuario(@Valid Usuario usuario, BindingResult result, @RequestParam(value = "file") MultipartFile foto, Model model, RedirectAttributes flash, SessionStatus sessionStatus) {

        List<Puesto> puesto = puestoServicio.findAll();
        if (result.hasErrors()) {
            model.addAttribute("usuario", usuario);
            model.addAttribute("listaPuestos", puesto);
            return "admin/crear";
        }

        if (!foto.isEmpty()) {

            if (usuario.getIdUsuario() != null && usuario.getIdUsuario() > 0 && usuario.getFoto() != null && usuario.getFoto().length() > 0) {
                uploadFileService.delete(usuario.getFoto());
            }

            String uniqueFilename = null;
            try {
                uniqueFilename = uploadFileService.copy(foto);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            flash.addFlashAttribute("info", "Se ha cargado de manera correcta el archivo : " + uniqueFilename);
            usuario.setFoto(uniqueFilename);
        }
//TODO VALIDAR PASSWORD Y USER
        String flashMessage = (usuario.getIdUsuario() != null) ? "Usuario modificado con éxito" : "Usuario creado con éxito";
        usuarioServicio.saveUser(usuario);
        flash.addFlashAttribute("success", flashMessage);
        sessionStatus.setComplete();
        return "redirect:listar";
    }

    @GetMapping("/eliminar/{idUsuario}")
    public String eliminar(@PathVariable(value = "idUsuario") Long idUsuario, RedirectAttributes flash) {
        if (idUsuario > 0) {
            Usuario usuario = usuarioServicio.findUser(idUsuario);
            usuarioServicio.deleteUser(idUsuario);
            correoServico.deleteCorreo(idUsuario);
            direccionServicio.deleteDirección(idUsuario);
            flash.addFlashAttribute("success", "Usuario eliminado con éxito");

            if (uploadFileService.delete(usuario.getFoto())) {
                flash.addFlashAttribute("info", "Foto" + usuario.getFoto() + "eliminada con exito");
            }
        }
        return "redirect:/admin/listar";
    }


    @GetMapping("/admin/crear/{idUsuario}")
    public String actualizar(@PathVariable(value = "idUsuario") Long idUsuario, Model model, RedirectAttributes flash) {
        Usuario usuario = new Usuario();
        List<Puesto> puesto = puestoServicio.findAll();
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
        model.addAttribute("listaPuestos", puesto);
        model.addAttribute("usuario", usuario);
        return "admin/crear";
    }

    @GetMapping(value = "ver/{idUsuario}")
    public String ver(@PathVariable(value = "idUsuario") Long idUsuario, Model model, RedirectAttributes flash) {
        Usuario usuario = usuarioServicio.findUser(idUsuario);
        if (usuario == null) {
            flash.addFlashAttribute("error", "Cliente invalido");
            return "redirect:/admin/listar";
        }
        model.addAttribute("usuario", usuario);
        return "ver";
    }

    @GetMapping(value = "/imagenes/{filename:.+}")
    public ResponseEntity<Resource> verFoto(@PathVariable String filename) {

        Resource resource = null;
        try {
            resource = uploadFileService.load(filename);
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"").body(resource);
    }


}
