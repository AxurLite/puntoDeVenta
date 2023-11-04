package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "direccion")
public class Direccion implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idDireccion")
    private Long idDireccion;

    @OneToOne(mappedBy = "direccion", cascade = CascadeType.ALL)
    private Usuario usuario;

    @Size(min = 2, max = 150, message = "Ingresa tu dirección de residencia.")
    @Column(name = "calleNumero", length = 150)
    private String calleNumero;

    @Size(min = 2, max = 80, message = "Debes ingresar tu colonia de residencia.")
    @Column(name = "colonia", length = 80)
    private String colonia;

    @Size(min = 5, max = 10, message = "Ingresa tu codigo postal.")
    @Column(name = "codigoPostal", length = 10)
    private String codigoPostal;

    @Size(min = 2, max = 80, message = "Debes ingresar tu municipio.")
    @Column(name = "municipioAlcaldia", length = 80)
    private String municipioAlcaldia;

    @Size(min = 2, max = 80, message = "Debes ingresar tu estado de residencia.")
    @Column(name = "estado", length = 80)
    private String estado;

    @Size(min = 2, max = 50, message = "Debes ingresar tu pais de residencia.")
    @Column(name = "pais", length = 50)
    private String pais;

    @Temporal(TemporalType.DATE)
    @Column(name = "fechaCreacion")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fechaCreacion;

    @PrePersist
    public void prePersist() {
        fechaCreacion = new Date();
    }


}
