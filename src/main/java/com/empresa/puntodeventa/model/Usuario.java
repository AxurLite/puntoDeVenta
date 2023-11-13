package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.validation.executable.ValidateOnExecution;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.validation.annotation.Validated;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private Long idUsuario;

    @Size(min = 5, max = 150, message = "Escribe un nombre de usuario valido.")
    @Column(name = "nombreUsuario", nullable = false, length = 150)
    private String nombreUsuario;

    @Size(min = 2, max = 80, message = "Ingresa un nombre valido")
    @Column(name = "nombreCompleto", nullable = false, length = 80)
    private String nombreCompleto;

    @Size(min = 2, max = 80, message = "Ingresa un apellido valido")
    @Column(name = "apellidoMaterno", length = 80)
    private String apellidoMaterno;

    @Size(min = 2, max = 80, message = "Ingresa un apellido valido")
    @Column(name = "apellidoPaterno", length = 80)
    private String apellidoPaterno;

    @Size(min = 8, max = 80, message = "Tu contraseña no es valida ,debe tener un mínimo de 8 caracteres.")
    @Column(name = "contrasena", length = 80)
    private String contrasena;

    @Transient
    @Size(min = 8, max = 80, message = "Confirma tu contraseña.")
    private String confirmarContrasena;

    @Valid
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "idDireccion")
    private Direccion direccion;

    @Valid
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "idCorreo")
    private CorreoElectronico correoElectronico;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idPuesto")
    private Puesto puesto;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fechaCreacion;

    @PrePersist
    public void prePersist() {
        fechaCreacion = new Date();
    }

    @NotNull(message = "Ingresa tu fecha de nacimiento.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "fechaNacimiento")
    private Date fechaNacimiento;

    @Size(min = 10, max = 10, message = "Ingresa tu numero de teléfono a 10 digitos.")
    private String telefono;

    private String foto;

    @Size(min = 10, max = 10, message = "Ingresa el numero de teléfono a 10 digitos.")
    private String telefonoEmergencia;

    @Size(min = 2, max = 80, message = "Ingresa el nombre de tu contacto ante emergencias.")
    private String nombreEmergencia;


}
