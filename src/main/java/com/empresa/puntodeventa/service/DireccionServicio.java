package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.model.CorreoElectronico;
import com.empresa.puntodeventa.model.Direccion;

public interface DireccionServicio {

    public Direccion findDirección(Long idDireccion);

    public void deleteDirección(Long idDireccion);
}
