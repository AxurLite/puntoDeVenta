package com.empresa.puntodeventa.model;
import lombok.*;
import jakarta.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity(name = "puesto")
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Puesto {
    @Id
    @Column(name = "idPuesto")
    private String idPuesto;

    @Column(name = "nombrePuesto")
    private String nombrePuesto;

    @Column(name = "descripcionPuesto")
    private String descripcionPuesto;

    @Column(name = "fechaCreacion")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;
}
