package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.IndiceCardiaco;
import io.github.manoelpiovesan.entities.IndicePulmonar;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.hibernate.orm.panache.PanacheQuery;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Path("/pacientes")
public class PacienteResource {

    @GET
    @Path("/indices")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getInfoByDate(
            @QueryParam("date") String dateString
    ) {
        LocalDate date = LocalDate.parse(dateString);

        Long startOfDay = date.atStartOfDay().toEpochSecond(ZoneOffset.UTC);
        Long endOfDay = date.atTime(23, 59, 59).toEpochSecond(ZoneOffset.UTC);

        List<IndicePulmonar> indicesPulmonares = IndicePulmonar.find("data >= ?1 and data <= ?2",
                Sort.ascending("data"),
                startOfDay,
                endOfDay).list();

        List<IndiceCardiaco> indicesCardiacos = IndiceCardiaco.find("data >= ?1 and data <= ?2",
                Sort.ascending("data"),
                startOfDay,
                endOfDay).list();

        Map<String, Object> map = new HashMap<>();
        map.put("indices_pulmonares", indicesPulmonares);
        map.put("indices_cardiacos", indicesCardiacos);

        return Response.ok(map).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response list(
            @QueryParam("page") @DefaultValue("0") int page,
            @QueryParam("size") @DefaultValue("10") int size,
            @QueryParam("t") String term
    ) {
        return Response.ok(search(term, Sort.ascending("nome")).page(page, size).list()).build();
    }

    @GET
    @Path("/count")
    @Produces(MediaType.TEXT_PLAIN)
    public Response count() {
        return Response.ok(Paciente.count()).build();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPatientById(
            @PathParam("id")
            Long id) {
        Paciente paciente = Paciente.findById(id);

        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        return Response.ok(paciente).build();
    }

    @GET
    @Path("/{id}/indices")
    public Response getIndicesByPatientId(
            @PathParam("id")
            Long id) {
        Paciente paciente = Paciente.findById(id);

        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        IndiceCardiaco indiceCardiaco = IndiceCardiaco.find("paciente",
                        Sort.descending(
                                "data"),
                        paciente)
                .firstResult();

        IndicePulmonar indicePulmonar = IndicePulmonar.find("paciente",
                        Sort.descending(
                                "data"),
                        paciente)
                .firstResult();
        Map<String, Object> map = new HashMap<>();
        map.put("indice_cardiaco", indiceCardiaco);
        map.put("indice_pulmonar", indicePulmonar);

        return Response.ok(map).build();
    }

    private PanacheQuery<Paciente> search(String term, Sort sort) {
        if (term == null) {
            return Paciente.findAll(sort);
        }

        return Paciente.find("LOWER(nome) LIKE concat('%', ?1, '%')",
                Sort.by("nome"),
                term);
    }

}
