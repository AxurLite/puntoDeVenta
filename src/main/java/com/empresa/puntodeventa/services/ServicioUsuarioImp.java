package com.empresa.puntodeventa.services;

import com.empresa.puntodeventa.controller.ControladorUsuario;
import com.empresa.puntodeventa.interfaces.RepositorioUsuario;
import com.empresa.puntodeventa.model.Usuario;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ServicioUsuarioImp implements ServicioUsuario {
    private static final Logger logger = LoggerFactory.getLogger(ControladorUsuario.class);
    @Autowired
    RepositorioUsuario repositorioUsuario;

    @Override
    public Iterable<Usuario> ObtenerUsuarios() {
        return repositorioUsuario.findAllByIdWithCorreo();
    }

    @Override
    public Usuario crearUsuario(Usuario usuario) throws Exception {
        if (usuarioValido(usuario) && contrasenasValidas(usuario)) {
            usuario = repositorioUsuario.save(usuario);
        }
        return usuario;
    }

    private boolean usuarioValido(Usuario usuario) throws Exception {
        Optional<Usuario> usuarioEncontrado = repositorioUsuario.findByNombreUsuario(usuario.getNombreUsuario());
        if (usuarioEncontrado.isPresent()) {
            throw new Exception("Usuario no disponible");
        }
        return true;
    }

    private boolean contrasenasValidas(Usuario usuario) throws Exception {
        if (!usuario.getContrasena().equals(usuario.getConfirmarContrasena())) {
            throw new Exception("Las contraseñas no coinciden.");
        }
        return true;
    }
}


