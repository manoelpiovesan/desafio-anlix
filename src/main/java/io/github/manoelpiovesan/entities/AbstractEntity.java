package io.github.manoelpiovesan.entities;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@MappedSuperclass
public class AbstractEntity extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(title = "The unique identifier of the entity.")
    public Long id;

}
