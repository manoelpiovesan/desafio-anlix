package io.github.manoelpiovesan.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class IndiceCardiaco extends AbstractEntity {

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
