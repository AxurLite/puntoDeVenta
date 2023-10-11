package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "telefonocon")
public class TelefonoCon {

    @Id
    @Column(name = "idContacto")
    private String idContacto;

    @Column(name = "nombreContacto")
    private String nombreContacto;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "fechaCreacion")
    private Date fechaCreacion;

    @Column(name = "prioridad")
    private String prioridad;

//    @ManyToOne
//    @JoinColumn(name = "idUsuario", referencedColumnName = "idUsuario", insertable = false, updatable = false)
//    private Usuario usuario;

}
