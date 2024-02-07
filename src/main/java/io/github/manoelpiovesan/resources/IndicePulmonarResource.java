package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.IndiceCardiaco;
import io.github.manoelpiovesan.entities.IndicePulmonar;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.time.LocalDate;
import java.time.ZoneOffset;

@Path("/pacientes")
public class IndicePulmonarResource {

    @GET
    @Path("/{id}/pulmonar")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getIndicePulmonarByPatientId(
            @PathParam("id")
            Long id,
            @QueryParam("start") String startDateString,
            @QueryParam("end") String endDateString) {

        Paciente paciente = Paciente.findById(id);

        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        if (startDateString != null && endDateString != null) {
            Long startTime = LocalDate.parse(startDateString).atStartOfDay().toEpochSecond(ZoneOffset.UTC);
            Long endTime = LocalDate.parse(endDateString).atTime(23, 59, 59).toEpochSecond(ZoneOffset.UTC);

            return Response.ok(IndicePulmonar.find("paciente = ?1 and data >= ?2 and data <= ?3",
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

}
