package com.empresa.puntodeventa.dao;
import com.empresa.puntodeventa.model.CorreoElectronico;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CorreoElectronicoDao extends JpaRepository<CorreoElectronico, Long> {
}
