package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.IndicePulmonar;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/pacientes")
public class IndicePulmonarResource {

    @GET
    @Path("/{id}/pulmonar")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getIndicePulmonarByPatientId(
            @PathParam("id")
            Long id) {
        Paciente paciente = Paciente.findById(id);

        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
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
