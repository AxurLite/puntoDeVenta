package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.model.CorreoElectronico;

public interface CorreoServico {
    public CorreoElectronico findCorreo(Long idCorreo);

    public void deleteCorreo(Long idCorreo);
}
