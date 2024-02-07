package io.github.manoelpiovesan.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "indice_pulmonar")
public class IndicePulmonar extends AbstractEntity {

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "paciente_id")
    public Paciente paciente;

    @Column(name = "cpf")
    public String cpf;

    @Column(name = "data")
    public String data;

    @Column(name = "indice")
    public Double indice;

}
