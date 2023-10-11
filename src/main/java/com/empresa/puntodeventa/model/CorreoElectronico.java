package com.empresa.puntodeventa.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

@Getter
@Setter
@Entity(name = "correoelEctronico")
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class CorreoElectronico {
    @Id
    @Column(name = "idCorreo")
    private String idCorreo;

    @Column(name = "correoElectronico")
    private String correoElectronico;
}
