package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "organization_status")
public class OrganizationStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "organization_status_id")
    private Integer id;

    @Column(name = "organization_status_name")
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
