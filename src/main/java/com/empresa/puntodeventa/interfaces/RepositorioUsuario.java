package com.empresa.puntodeventa.interfaces;

import com.empresa.puntodeventa.model.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario, Integer> {
    public Optional<Usuario> findByNombreUsuario(String nombreUsuario);
    @Query("SELECT u FROM usuario u JOIN u.correoElectronico c")
    Set<Usuario> findAllByIdWithCorreo();

}
