package io.github.manoelpiovesan.utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.github.manoelpiovesan.entities.IndicePulmonar;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.runtime.Startup;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@ApplicationScoped
public class DataInitializer {

    @Startup
    public void init() throws IOException {
        initPatientsData();
        initIndicePulmonarData();
    }

    @Transactional
    public void initPatientsData() throws IOException {
        if (Paciente.count() != 0) {
            System.out.println("Pacientes já inicializados");
            return;
        }

        ObjectMapper mapper = new ObjectMapper();
        List<Map<String, Object>> patientList = mapper.readValue(
                new File(getFilePath("dados/pacientes.json")),
                new TypeReference<List<Map<String, Object>>>() {
                });

        for (Map<String, Object> patient : patientList) {
            Paciente paciente = new Paciente();

            paciente.nome = (String) patient.get("nome");
            paciente.idade = (Integer) patient.get("idade");
            paciente.cpf = (String) patient.get("cpf");
            paciente.rg = (String) patient.get("rg");
            paciente.data_nasc = (String) patient.get("data_nasc");
            paciente.sexo = (String) patient.get("sexo");
            paciente.signo = (String) patient.get("signo");
            paciente.mae = (String) patient.get("mae");
            paciente.pai = (String) patient.get("pai");
            paciente.email = (String) patient.get("email");
            paciente.senha = (String) patient.get("senha");
            paciente.cep = (String) patient.get("cep");
            paciente.endereco = (String) patient.get("endereco");
            paciente.numero = (Integer) patient.get("numero");
            paciente.bairro = (String) patient.get("bairro");
            paciente.cidade = (String) patient.get("cidade");
            paciente.estado = (String) patient.get("estado");
            paciente.telefone_fixo = (String) patient.get("telefone_fixo");
            paciente.celular = (String) patient.get("celular");
            paciente.altura = (String) patient.get("altura");
            paciente.peso = (Integer) patient.get("peso");
            paciente.tipo_sanguineo = (String) patient.get("tipo_sanguineo");
            paciente.cor = (String) patient.get("cor");

            paciente.persist();
            System.out.println(
                    "Paciente " + paciente.nome + " persistido com sucesso!");
        }
    }

    @Transactional
    public void initIndicePulmonarData() throws IOException {
        if (IndicePulmonar.count() != 0) {
            System.out.println("Índices pulmonares já inicializados");
            return;
        }

        File indicesPulmonaresFolder =
                new File(getFilePath("dados/indice_pulmonar"));

        List<File> files = List.of(Objects.requireNonNull(
                indicesPulmonaresFolder.listFiles()));

        for (File file : files) {
            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                boolean firstLine = true;
                while ((line = br.readLine()) != null) {
                    if (firstLine) {
                        firstLine = false;
                        continue;
                    }

                    String[] data = line.split(" ");

                    Paciente paciente =
                            Paciente.find("cpf", data[0]).firstResult();

                    if (paciente != null) {
                        IndicePulmonar indicePulmonar = new IndicePulmonar();
                        indicePulmonar.paciente = paciente;
                        indicePulmonar.cpf = data[0];
                        indicePulmonar.data = data[1];
                        indicePulmonar.indice = Double.parseDouble(data[2]);

                        indicePulmonar.persist();
                        System.out.println(indicePulmonar);
                    }

                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String getFilePath(String fileName) {
        return Objects.requireNonNull(
                              getClass().getClassLoader().getResource(fileName))
                      .getFile();
    }

}
