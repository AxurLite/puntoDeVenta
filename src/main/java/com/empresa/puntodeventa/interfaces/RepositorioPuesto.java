package com.empresa.puntodeventa.interfaces;

import com.empresa.puntodeventa.model.Puesto;
import com.empresa.puntodeventa.model.Usuario;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioPuesto extends CrudRepository<Puesto, String> {

}
