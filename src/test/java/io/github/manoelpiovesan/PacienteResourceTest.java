package io.github.manoelpiovesan;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class PacienteResourceTest {

    private static final Integer count = 60;
    // From json - Initial number of patients
    private static final Map<String, Object> patientMap = new HashMap<>();
    private static final Long patientId = 1L;

    @BeforeAll
    public static void setup() {
        // From json - First patient
        patientMap.put("nome", "Alexandre Caleb Costa");
        patientMap.put("idade", 55);
        patientMap.put("cpf", "974.642.524-20");
        patientMap.put("rg", "22.107.246-9");
        patientMap.put("data_nasc", "19/01/1967");
        patientMap.put("sexo", "Masculino");
        patientMap.put("signo", "Capricórnio");
        patientMap.put("mae", "Beatriz Alícia");
        patientMap.put("pai", "Nelson Heitor Costa");
        patientMap.put("email", "aalexandrecalebcosta@br.loreal.com");
        patientMap.put("senha", "6eXIFok6iQ");
        patientMap.put("cep", "69309-415");
        patientMap.put("endereco", "Rua das Palmas de Santa Rita");
        patientMap.put("numero", 765);
        patientMap.put("bairro", "Pricumã");
        patientMap.put("cidade", "Boa Vista");
        patientMap.put("estado", "RR");
        patientMap.put("telefone_fixo", "(95) 3783-9661");
        patientMap.put("celular", "(95) 99359-1588");
        patientMap.put("altura", "1,96");
        patientMap.put("peso", 63);
        patientMap.put("tipo_sanguineo", "A-");
        patientMap.put("cor", "laranja");
    }

    @Test
    @Order(1)
    public void firstCount() {
        given()
                .when().get("/pacientes/count")
                .then()
                .statusCode(200)
                .body(is(count.toString()));
    }

    @Test
    @Order(2)
    public void listAll() {
        given()
                .when()
                .queryParam("size", 100)
                .get("/pacientes")
                .then()
                .statusCode(200)
                .body("$.size()", is(count));
    }

    @Test
    @Order(3)
    public void testGetPatientById() {
        given()
                .when()
                .contentType("application/json")
                .pathParam("id", patientId)
                .get("/pacientes/{id}")
                .then()
                .statusCode(200)
                .body(
                        "nome", is(patientMap.get("nome")),
                        "idade", is(patientMap.get("idade")),
                        "cpf", is(patientMap.get("cpf")),
                        "rg", is(patientMap.get("rg")),
                        "data_nasc", is(patientMap.get("data_nasc")),
                        "sexo", is(patientMap.get("sexo")),
                        "signo", is(patientMap.get("signo")),
                        "mae", is(patientMap.get("mae")),
                        "pai", is(patientMap.get("pai")),
                        "email", is(patientMap.get("email")),
                        "senha", is(patientMap.get("senha")),
                        "cep", is(patientMap.get("cep")),
                        "endereco", is(patientMap.get("endereco")),
                        "numero", is(patientMap.get("numero")),
                        "bairro", is(patientMap.get("bairro")),
                        "cidade", is(patientMap.get("cidade")),
                        "estado", is(patientMap.get("estado")),
                        "telefone_fixo", is(patientMap.get("telefone_fixo")),
                        "celular", is(patientMap.get("celular")),
                        "altura", is(patientMap.get("altura")),
                        "peso", is(patientMap.get("peso")),
                        "tipo_sanguineo", is(patientMap.get("tipo_sanguineo")),
                        "cor", is(patientMap.get("cor"))
                );
    }

}
