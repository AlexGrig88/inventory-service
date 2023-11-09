CREATE DATABASE electronicstore_inventory_db;

DROP SCHEMA if exists inventory_schema;

CREATE SCHEMA inventory_schema;

SET search_path TO inventory_schema, public;

DROP TABLE if exists user_address;
DROP TABLE if exists user_payment;
DROP TABLE if exists user_data;

CREATE TABLE product
(
    id           BIGSERIAL PRIMARY KEY,
    name         VARCHAR(128) NOT NULL,
    description  TEXT,
    sku          VARCHAR(64)  NOT NULL,
    price        DECIMAL(12, 2),

    created_at   TIMESTAMP,
    modified_at  TIMESTAMP,

    category_id  INT          NOT NULL,
    inventory_id INT,
    discount_id  INT,
    FOREIGN KEY (inventory_id) REFERENCES product_inventory (id) ON DELETE SET NULL,
    FOREIGN KEY (discount_id) REFERENCES discount (id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES product_category (id) ON DELETE CASCADE
);

-- One to Many
CREATE TABLE product_category
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description TEXT
);

-- One to one
CREATE TABLE product_inventory
(
    id            BIGSERIAL PRIMARY KEY,
    quantity      INT,
    place_storage VARCHAR(64),
    modified_at    TIMESTAMP
);

-- One to Many
CREATE TABLE discount
(
    id               BIGSERIAL PRIMARY KEY,
    name             VARCHAR(64),
    description             TEXT,
    discount_percent INT,
    active           BOOLEAN,
    created_at       TIMESTAMP,
    modified_at      TIMESTAMP
);

