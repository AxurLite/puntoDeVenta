package com.empresa.puntodeventa.dao;
import com.empresa.puntodeventa.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioDao extends JpaRepository<Usuario, Long> {

}

