package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "marital_status")
public class MaritalStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "marital_status_id")
    private Integer id;

    @Column(name = "marital_status_name")
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
