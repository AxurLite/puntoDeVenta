package com.empresa.puntodeventa.services;

import com.empresa.puntodeventa.interfaces.RepositorioPuesto;
import com.empresa.puntodeventa.model.Puesto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioPuestoImp implements ServicioPuesto {

    @Autowired
    RepositorioPuesto repositorioPuesto;
    @Override
    public Iterable<Puesto> ObtenerPuestos() {
        return repositorioPuesto.findAll();
    }
}

