package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.model.CorreoElectronico;
import com.empresa.puntodeventa.model.Direccion;

public interface DireccionServicio {

    public Direccion findDirección(Long idUsuario);

    public void deleteDirección(Long idUsuario);
}
