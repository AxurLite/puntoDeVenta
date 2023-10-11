package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Entity(name = "usuario")
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private int idUsuario;


    @Column(name = "nombreUsuario")
    @NotBlank(message = "Por favor escribe tu nombre de usuario.")
    @Size(min = 5, max = 150, message = "Escribe un nombre de usuario valido.")
    private String nombreUsuario;

    @NotBlank(message = "Ingresa tu nombre(s).")
    @Size(min = 2, max = 80, message = "Ingresa un nombre valido")
    @Column(name = "nombreCompleto")
    private String nombreCompleto;

    @NotBlank(message = "Ingresa tu apellido materno.")
    @Size(min = 5, max = 80, message = "Ingresa un apellido valido")
    @Column(name = "apellidoMaterno")
    private String apellidoMaterno;

    @NotBlank(message = "Ingresa tu apellido paterno.")
    @Size(min = 5, max = 80, message = "Ingresa un apellido valido")
    @Column(name = "apellidoPaterno")
    private String apellidoPaterno;

    @NotBlank(message = "Ingresa tu contraseña.")
    @Size(min = 8, max = 80, message = "Tu contraseña debe de tener un minimo de 8 caracteres.")
    @Column(name = "contrasena")
    private String contrasena;

    @Transient
    @NotBlank(message = "Ingresa la confirmación contraseña.")
    @Size(min = 8, max = 80, message = "Tu contraseña debe de tener un minimo de 8 caracteres.")
    @Column(name = "contrasena")
    private String confirmarContrasena;

    @Column(name = "idDireccion")
    private String idDireccion;

    @Column(name = "idPuesto")
    private String idPuesto;

    @Column(name = "fechaCreacion")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;

    @NotEmpty(message = "Ingresa tu fecha de nacimiento.")
    @Temporal(TemporalType.DATE)
    private String fechaNacimiento;

    @NotBlank(message = "Ingresa tu numero telefonico a 10 digitos.")
    @Size(min = 10, max = 10, message = "Tu numero de telefono debe ser de exactamente 10 digitos.")
    @Column(name = "telefono")
    private String telefono;

    @OneToOne
    @JoinColumn(name = "idCorreo")
    private CorreoElectronico correoElectronico;
}
