package com.empresa.puntodeventa.util.formater;

import com.empresa.puntodeventa.model.Usuario;

import java.util.Locale;

public class TextFormater {

    public static void transformarCamposTexto(Usuario usuario) {
        if (usuario != null) {
            usuario.setNombreCompleto(transformarCampo(usuario.getNombreCompleto()));
            usuario.setApellidoMaterno(transformarCampo(usuario.getApellidoMaterno()));
            usuario.setApellidoPaterno(transformarCampo(usuario.getApellidoPaterno()));
            usuario.setNombreEmergencia(transformarCampo(usuario.getNombreEmergencia()));
            usuario.getDireccion().setCalleNumero(transformarCampo(usuario.getDireccion().getCalleNumero()));
            usuario.getDireccion().setColonia(transformarCampo(usuario.getDireccion().getColonia()));
            usuario.getDireccion().setEstado(transformarCampo(usuario.getDireccion().getEstado()));
            usuario.getDireccion().setPais(transformarCampo(usuario.getDireccion().getPais()));
            usuario.getDireccion().setMunicipioAlcaldia(transformarCampo(usuario.getDireccion().getMunicipioAlcaldia()));
        }
    }

    private static String transformarCampo(String campo) {
        if (campo != null) {
            campo = campo.trim();
            String[] palabras = campo.split(" ");
            StringBuilder resultado = new StringBuilder();
            for (String palabra : palabras) {
                if (resultado.length() > 0) {
                    resultado.append(" ");
                }
                resultado.append(palabra.substring(0, 1).toUpperCase(Locale.getDefault()));
                resultado.append(palabra.substring(1).toLowerCase(Locale.getDefault()));
            }
            return resultado.toString();
        }
        return campo;
    }

}
