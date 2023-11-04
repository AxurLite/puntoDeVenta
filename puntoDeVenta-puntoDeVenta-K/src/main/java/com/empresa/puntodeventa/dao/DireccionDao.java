package com.empresa.puntodeventa.dao;

import com.empresa.puntodeventa.model.Direccion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DireccionDao extends JpaRepository<Direccion, Long> {
}
