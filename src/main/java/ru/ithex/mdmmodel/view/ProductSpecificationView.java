package ru.ithex.mdmmodel.view;

import javax.persistence.*;

@Entity
@Table(name = "product_specification_view")
public class ProductSpecificationView {
    @Id
    @Column(name = "product_specification_id")
    private Integer id;

    @Column(name = "type")
    private String type;

    @Column(name = "type_code")
    private String typeCode;

    @Column(name = "g1")
    private String g1;

    @Column(name = "g1_code")
    private String g1Code;

    @Column(name = "g2")
    private String g2;

    @Column(name = "g2_code")
    private String g2Code;

    @Column(name = "g3")
    private String g3;

    @Column(name = "g3_code")
    private String g3Code;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getG1() {
        return g1;
    }

    public void setG1(String g1) {
        this.g1 = g1;
    }

    public String getG1Code() {
        return g1Code;
    }

    public void setG1Code(String g1Code) {
        this.g1Code = g1Code;
    }

    public String getG2() {
        return g2;
    }

    public void setG2(String g2) {
        this.g2 = g2;
    }

    public String getG2Code() {
        return g2Code;
    }

    public void setG2Code(String g2Code) {
        this.g2Code = g2Code;
    }

    public String getG3() {
        return g3;
    }

    public void setG3(String g3) {
        this.g3 = g3;
    }

    public String getG3Code() {
        return g3Code;
    }

    public void setG3Code(String g3Code) {
        this.g3Code = g3Code;
    }
}
