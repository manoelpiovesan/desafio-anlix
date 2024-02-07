package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.Paciente;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/pacientes")
public class PacienteResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response list() {
        return Response.ok(Paciente.listAll()).build();
    }

    @GET
    @Path("/count")
    @Produces(MediaType.TEXT_PLAIN)
    public Response count() {
        return Response.ok(Paciente.count()).build();
    }
}
