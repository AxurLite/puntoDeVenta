package com.empresa.puntodeventa.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "puesto")
public class Puesto {
    @Id
    @Column(name = "idPuesto", length = 10)
    private String idPuesto;

    @OneToMany(mappedBy = "puesto")
    private List<Usuario> usuarios;

    @Size(max = 150)
    @Column(name = "nombrePuesto", length = 150)
    private String nombrePuesto;

    @Size(max = 250)
    @Column(name = "descripcionPuesto", length = 250)
    private String descripcionPuesto;

    @Temporal(TemporalType.DATE)
    @Column(name = "fechaCreacion")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fechaCreacion;

    @PrePersist
    public void prePersist() {
        fechaCreacion = new Date();
    }


}
