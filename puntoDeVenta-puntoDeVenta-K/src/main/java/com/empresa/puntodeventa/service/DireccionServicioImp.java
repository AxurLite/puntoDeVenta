package com.empresa.puntodeventa.service;
import com.empresa.puntodeventa.dao.DireccionDao;
import com.empresa.puntodeventa.model.Direccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DireccionServicioImp implements DireccionServicio {

    @Autowired
    private DireccionDao direccionDao;

    @Override
    @Transactional(readOnly = true)
    public Direccion findDirección(Long idUsuario) {
        return direccionDao.findById(idUsuario).orElse(null);
    }

    @Override
    public void deleteDirección(Long idUsuario) {
        direccionDao.deleteById(idUsuario);
    }

}
