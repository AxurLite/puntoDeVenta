package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "puesto")
public class Puesto {
    @Id
    @Column(name = "idPuesto", length = 10)
    private String idPuesto;

//    @OneToMany(mappedBy = "puesto")
//    private Set<Usuario> usuarios;

    @Size(max = 150)
    @NotNull
    @Column(name = "nombrePuesto", nullable = false, length = 150)
    private String nombrePuesto;

    @Size(max = 250)
    @Column(name = "descripcionPuesto", length = 250)
    private String descripcionPuesto;

    @NotNull
    @Column(name = "fechaCreacion", nullable = false)
    private LocalDate fechaCreacion;
}
