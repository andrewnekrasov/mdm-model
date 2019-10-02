package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "reason_code_type")
public class ReasonCodeType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reason_code_type_id")
    private Integer id;

    @Column(name = "reason_code_value")
    private String value;

    @Column(name = "reason_code_decision")
    private Integer decision;

    @Column(name = "reason_code_description")
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Integer getDecision() {
        return decision;
    }

    public void setDecision(Integer decision) {
        this.decision = decision;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
