package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.dao.CorreoElectronicoDao;
import com.empresa.puntodeventa.model.CorreoElectronico;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CorrreoServicoImp implements CorreoServico {

    @Autowired
    private CorreoElectronicoDao correoElectronicoDao;

    @Override
    @Transactional(readOnly = true)
    public CorreoElectronico findCorreo(Long idCorreo) {
        return correoElectronicoDao.findById(idCorreo).orElse(null);
    }

    @Override
    public void deleteCorreo(Long idCorreo) {
        correoElectronicoDao.deleteById(idCorreo);
    }

}


