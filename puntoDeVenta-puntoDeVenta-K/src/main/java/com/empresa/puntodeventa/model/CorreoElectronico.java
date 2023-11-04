package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@Entity
@Table(name = "correoelectronico")
@ToString
public class CorreoElectronico implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCorreo", nullable = false, length = 500)
    private Long idCorreo;

    @Column(name = "correoElectronico", nullable = false, length = 150)
    @Size(min = 5, max = 150, message = "Ingresa tu correo electronico.")
    private String correoElectronico;

    @OneToOne(mappedBy = "correoElectronico", cascade = CascadeType.ALL)
    private Usuario usuario;




}

