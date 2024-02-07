package io.github.manoelpiovesan.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "paciente")
public class Paciente extends AbstractEntity {

    @Column(name = "nome")
    public String nome;

    @Column(name = "idade")
    public Integer idade;

    @Column(name = "cpf")
    public String cpf;

    @Column(name = "rg")
    public String rg;

    @Column(name = "data_nasc")
    public String data_nasc;

    @Column(name = "sexo")
    public String sexo;

    @Column(name = "signo")
    public String signo;

    @Column(name = "mae")
    public String mae;

    @Column(name = "pai")
    public String pai;

    @Column(name = "email")
    public String email;

    @Column(name = "senha")
    public String senha;

    @Column(name = "cep")
    public String cep;

    @Column(name = "endereco")
    public String endereco;

    @Column(name = "numero")
    public Integer numero;

    @Column(name = "bairro")
    public String bairro;

    @Column(name = "cidade")
    public String cidade;

    @Column(name = "estado", length = 2)
    public String estado;

    @Column(name = "telefone_fixo")
    public String telefone_fixo;

    @Column(name = "celular")
    public String celular;

    @Column(name = "altura")
    public String altura;

    @Column(name = "peso")
    public Integer peso;

    @Column(name = "tipo_sanguineo")
    public String tipo_sanguineo;

    @Column(name = "cor")
    public String cor;



}
