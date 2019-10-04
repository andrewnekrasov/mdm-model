package ru.ithex.mdmmodel;

import ru.ithex.mdmmodel.view.ProductSpecificationView;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer id;

    @Column(name = "product_name")
    private String name;

    @Column(name = "product_cost")
    private BigDecimal cost;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "product_specification_id", insertable = false, updatable = false)
    private ProductSpecificationView productSpecification;

    @Column(name = "product_brand")
    private String brand;

    @Column(name = "product_count")
    private Integer count;

    @Column(name = "product_weight")
    private BigDecimal weight;

    @Column(name = "product_length")
    private BigDecimal length;

    @Column(name = "product_volume")
    private BigDecimal volume;

    @Column(name = "organization_id")
    private Integer organizationId;

    @Column(name = "organization_id")
    private Integer productSpecificationId;

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

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public ProductSpecificationView getProductSpecification() {
        return productSpecification;
    }

    public void setProductSpecification(ProductSpecificationView productSpecification) {
        this.productSpecification = productSpecification;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public BigDecimal getLength() {
        return length;
    }

    public void setLength(BigDecimal length) {
        this.length = length;
    }

    public BigDecimal getVolume() {
        return volume;
    }

    public void setVolume(BigDecimal volume) {
        this.volume = volume;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    public Integer getProductSpecificationId() {
        return productSpecificationId;
    }

    public void setProductSpecificationId(Integer productSpecificationId) {
        this.productSpecificationId = productSpecificationId;
    }
}
