package ru.ithex.mdmmodel;

import javax.persistence.*;

@Entity
@Table(name = "product_specification")
public class ProductSpecification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_specification_id")
    private Integer id;

    @Column(name = "product_specification_name")
    private String name;

    @Column(name = "product_specification_code")
    private String code;

    @Column(name = "type_id")
    private Integer typeId;

    @Column(name = "g1_id")
    private Integer g1Id;

    @Column(name = "g2_id")
    private Integer g2Id;

    @Column(name = "g3_id")
    private Integer g3Id;

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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getG1Id() {
        return g1Id;
    }

    public void setG1Id(Integer g1Id) {
        this.g1Id = g1Id;
    }

    public Integer getG2Id() {
        return g2Id;
    }

    public void setG2Id(Integer g2Id) {
        this.g2Id = g2Id;
    }

    public Integer getG3Id() {
        return g3Id;
    }

    public void setG3Id(Integer g3Id) {
        this.g3Id = g3Id;
    }
}
