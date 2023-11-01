package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.dao.PuestoDao;
import com.empresa.puntodeventa.model.Puesto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PuestoServicioImp implements PuestoServicio {

    @Autowired
    private PuestoDao puestoDao;
    @Transactional(readOnly = true)
    @Override
    public List<Puesto> findAll() {
        return puestoDao.findAll();
    }
}
