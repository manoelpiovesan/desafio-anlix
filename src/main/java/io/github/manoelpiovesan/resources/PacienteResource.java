package io.github.manoelpiovesan.resources;

import io.github.manoelpiovesan.entities.Paciente;
import io.quarkus.hibernate.orm.panache.PanacheQuery;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/pacientes")
public class PacienteResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response list(
            @QueryParam("page") @DefaultValue("0") int page,
            @QueryParam("size") @DefaultValue("10") int size,
            @QueryParam("term") String term
    ) {
        return Response.ok(
                               search(term.toLowerCase(), Sort.ascending("nome")).page(page, size).list())
                       .build();
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

    private PanacheQuery<Paciente> search(String term, Sort sort) {
        if (term == null) {
            return Paciente.findAll(sort);
        }

        return Paciente.find("LOWER(nome) LIKE concat('%', ?1, '%')",
                             Sort.by("nome"),
                             term);
    }

}
