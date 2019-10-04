package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "action_result")
public class ActionResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "action_result_id")
    private Integer id;

    @Column(name = "action_result_name")
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
