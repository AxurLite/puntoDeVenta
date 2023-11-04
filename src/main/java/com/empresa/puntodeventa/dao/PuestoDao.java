package com.empresa.puntodeventa.dao;

import com.empresa.puntodeventa.model.Puesto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PuestoDao extends JpaRepository<Puesto, String> {
}
