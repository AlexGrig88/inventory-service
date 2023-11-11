package com.grig.electronicstore.inventoryservice.entity;


import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@MappedSuperclass
public abstract class AuditableEntity {

    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
//    private UserEntity created_by;
//    private UserEntity created_by;
}
