package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "correoelectronico")
public class Correoelectronico {

    @Id

    @Column(name = "idCorreo", nullable = false, length = 500)
    private String idCorreo;

    @Column(name = "correoElectronico", nullable = false, length = 150)
    private String correoElectronico;


}

