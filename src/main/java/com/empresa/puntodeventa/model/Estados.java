package com.empresa.puntodeventa.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Arrays;
import java.util.List;

@Getter
@Setter
@ToString
public class Estados {
    private List<String> nombreEstado;

    public Estados() {
        this.nombreEstado = Arrays.asList(
                "Aguascalientes", "Baja California", "Baja California Sur", "Campeche",
                "Coahuila de Zaragoza", "Colima", "Chiapas", "Chihuahua",
                "Distrito Federal", "Durango", "Guanajuato", "Guerrero",
                "Hidalgo", "Jalisco", "México", "Michoacán de Ocampo",
                "Morelos", "Nayarit", "Nuevo León", "Oaxaca de Juárez",
                "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí",
                "Sinaloa", "Sonora", "Tabasco", "Tamaulipas",
                "Tlaxcala", "Veracruz de Ignacio de la Llave", "Yucatán", "Zacatecas"
        );
    }
}
