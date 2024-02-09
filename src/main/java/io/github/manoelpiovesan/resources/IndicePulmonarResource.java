package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.IndicePulmonar;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;

@Path("/pacientes")
public class IndicePulmonarResource {

    @GET
    @Path("/{id}/pulmonar")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getIndicePulmonarByPatientId(
            @PathParam("id")
            Long id,
            @QueryParam("start") String startDateString,
            @QueryParam("end") String endDateString,
            @QueryParam("min") String min,
            @QueryParam("max")
            String max) {

        Paciente paciente = Paciente.findById(id);

        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Search by min and max
        if (min != null && max != null) {
            IndicePulmonar indice = IndicePulmonar.find(
                    "paciente = ?1 and indice >= ?2 and indice <= ?3",
                    Sort.descending("data"),
                    paciente,
                    Double.parseDouble(min),
                    Double.parseDouble(max)).firstResult();

            if (indice == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else {
                return Response.ok(indice).build();
            }
        }

        if (startDateString != null && endDateString != null) {
            Long startTime = LocalDate.parse(startDateString)
                                      .atStartOfDay()
                                      .toEpochSecond(ZoneOffset.UTC);
            Long endTime = LocalDate.parse(endDateString)
                                    .atTime(23, 59, 59)
                                    .toEpochSecond(ZoneOffset.UTC);

            return Response.ok(IndicePulmonar.find(
                    "paciente = ?1 and data >= ?2 and data <= ?3",
                    Sort.ascending("data"),
                    paciente,
                    startTime,
                    endTime).list()).build();
        }

        IndicePulmonar indicePulmonar = IndicePulmonar.find("paciente",
                                                            Sort.descending(
                                                                    "data"),
                                                            paciente)
                                                      .firstResult();

        if (indicePulmonar == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        } else {
            return Response.ok(indicePulmonar).build();
        }
    }

    @GET
    @Path("/csv/pulmonar/{id}")
    @Produces(MediaType.TEXT_PLAIN)
    public Response getCSVById(
            @PathParam("id")
            Long id
    ) {

        Paciente paciente = Paciente.findById(id);
        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        StringBuilder csv;

        List<IndicePulmonar> indicesPulmonares = new ArrayList<>();

        indicesPulmonares =
                IndicePulmonar.find("paciente", paciente).list();

        csv = new StringBuilder("cpf;data;indice_pulmonar\n");
        for (IndicePulmonar i : indicesPulmonares) {
            csv.append(i.cpf).append(";")
               .append(i.data).append(";")
               .append(i.indice).append("\n");
        }

        return Response.ok(csv.toString()).build();
    }

    @GET
    @Path("/csv/pulmonar")
    @Produces(MediaType.TEXT_PLAIN)
    public Response getCSV() {

        StringBuilder csv;

        List<IndicePulmonar> indicesPulmonares = new ArrayList<>();

        indicesPulmonares =
                IndicePulmonar.findAll().list();

        csv = new StringBuilder("cpf;data;indice_pulmonar\n");
        for (IndicePulmonar i : indicesPulmonares) {
            csv.append(i.cpf).append(";")
               .append(i.data).append(";")
               .append(i.indice).append("\n");
        }

        return Response.ok(csv.toString()).build();
    }

}
