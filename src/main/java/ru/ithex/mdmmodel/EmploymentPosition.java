package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "employment_position")
public class EmploymentPosition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employment_position_id")
    private Integer id;

    @Column(name = "employment_position_name")
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
