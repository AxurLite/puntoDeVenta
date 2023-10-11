package com.empresa.puntodeventa.services;

import com.empresa.puntodeventa.model.Usuario;

public interface ServicioUsuario {

    public Iterable<Usuario> ObtenerUsuarios();

    public Usuario crearUsuario(Usuario usuario) throws Exception;
}
