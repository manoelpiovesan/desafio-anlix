package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.IndiceCardiaco;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.List;

@Path("/pacientes")
public class IndiceCardiacoResource {

    @GET
    @Path("/{id}/cardiaco")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getIndicePulmonarByPatientId(
            @PathParam("id")
            Long id,
            @QueryParam("start") String startDateString,
            @QueryParam("end") String endDateString,
            @QueryParam("min") String min,
            @QueryParam("max") String max
    ) {

        Paciente paciente = Paciente.findById(id);

        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Search by min and max
        if (min != null && max != null) {
            IndiceCardiaco indice = IndiceCardiaco.find(
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

        // Search by date range
        if (startDateString != null && endDateString != null) {
            Long startTime = LocalDate.parse(startDateString)
                                      .atStartOfDay()
                                      .toEpochSecond(ZoneOffset.UTC);
            Long endTime = LocalDate.parse(endDateString)
                                    .atTime(23, 59, 59)
                                    .toEpochSecond(ZoneOffset.UTC);

            List<IndiceCardiaco> mapList = IndiceCardiaco.find(
                    "paciente = ?1 and data >= ?2 and data <= ?3",
                    Sort.ascending("data"),
                    paciente,
                    startTime,
                    endTime).list();
            if (mapList.isEmpty()) {
                return Response.status(Response.Status.NOT_FOUND).build();
            } else {
                return Response.ok(mapList).build();
            }
        }

        IndiceCardiaco indiceCardiaco = IndiceCardiaco.find("paciente",
                                                            Sort.descending(
                                                                    "data"),
                                                            paciente)
                                                      .firstResult();

        if (indiceCardiaco == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        } else {
            return Response.ok(indiceCardiaco).build();
        }
    }

}
