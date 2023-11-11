package com.grig.electronicstore.inventoryservice.entity;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = "products")
@EqualsAndHashCode(of = "name", callSuper = false)
@Entity
@Table(name = "discount")
public class Discount extends AuditableEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    private String description;

    private Integer discountPercent;

    private Boolean active;

    @OneToMany(mappedBy = "discount", fetch = FetchType.LAZY)
    List<Product> products = new ArrayList<>();

    public void addProduct(Product product) {
        products.add(product);
        product.setDiscount(this);
    }
}
