package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "network_type")
public class NetworkType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "network_type_id")
    private Integer id;

    @Column(name = "network_type_name")
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
