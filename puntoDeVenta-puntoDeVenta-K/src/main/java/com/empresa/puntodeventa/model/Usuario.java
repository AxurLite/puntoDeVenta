package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "usuariotest")
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

    @Size(min = 8, max = 80, message = "Tu contraseña debe tener un mínimo de 8 caracteres.")
    @Column(name = "contrasena", length = 80)
    private String contrasena;

    @Transient
    @Size(min = 8, max = 80, message = "Tus contraseñas no coinciden.")
    private String confirmarContrasena;

    private String idDireccion;

    private String idCorreo;

    private String idPuesto;

    @Temporal(TemporalType.DATE)
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


//
//
//    @Transient
//    @Size(min = 2, max = 80, message = "Ingresa una colonia valida.")
//    private String colonia;
//    @Transient
//    @Size(min = 5, max = 5, message = "Ingresa un codigo postal valido.")
//    private String codigoPostal;
//
//    @Transient
//    @Size(min = 2, max = 150, message = "Ingresa una calle de referencia.")
//    private String calleNumero;
//
//    @Transient
//    @Size(min = 2, max = 80, message = "Ingresa una alcaldía valida.")
//    private String municipioAlcaldia;
//
//    @Transient
//    @Size(min = 2, max = 80, message = "Ingresa un estado valido.")
//    private String estado;
//
//    @Transient
//    @Size(min = 2, max = 50, message = "Ingresa tu pais de residencia.")
//    private String pais;
//
//    @Transient
//    @NotEmpty(message = "Ingresa tu correo electronico.")
//    private String correoElectronicoDao;
//
//    @Transient
//    @Size(min = 10, max = 10, message = "Ingresa tu número de teléfono a 10 digitos.")
//    private String telefonoEmergencia;
//
//    @Transient
//// TODO   @Size(min = 10, max = 10, message = "Ingresa tu número de teléfono a 10 digitos.")
//    private String nombreEmergencia;


}
