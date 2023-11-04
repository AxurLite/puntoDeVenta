package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.model.Usuario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UsuarioServicio {
    public List<Usuario> findAll();

    public Page<Usuario> findAll(Pageable pageable);

    public void saveUser(Usuario usuario) ;

    public Usuario findUser(Long idUsuario);

    public void deleteUser(Long idUsuario);

    public boolean existsByNombreUsuario(String nombreUsuario);

}

