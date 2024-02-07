package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.IndiceCardiaco;
import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/pacientes")
public class IndiceCardiacoResource {

    @GET
    @Path("/{id}/cardiaco")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getIndicePulmonarByPatientId(
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

        if (indiceCardiaco == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        } else {
            return Response.ok(indiceCardiaco).build();
        }
    }

}
