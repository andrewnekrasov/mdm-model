package ru.ithex.mdmmodel;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "okved")
public class Okved {
    @Id
    @Column(name = "okved_id")
    private UUID id;

    @Column(name = "okved_code")
    private String code;

    @Column(name = "okved_description")
    private String description;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
