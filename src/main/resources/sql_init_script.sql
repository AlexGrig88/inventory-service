CREATE DATABASE electronicstore_inventorydb;

DROP SCHEMA if exists inventory_schema;

CREATE SCHEMA inventory_schema;

SET
search_path TO inventory_schema, public;

DROP TABLE if exists user_address;
DROP TABLE if exists user_payment;
DROP TABLE if exists user_data;

CREATE TABLE product
(
    id          BIGSERIAL PRIMARY KEY,
    name        VARCHAR(128)       NOT NULL,
    description TEXT,
    sku         VARCHAR(64) UNIQUE NOT NULL,
    price       DECIMAL(12, 2),
    amount      INT,

    created_at  TIMESTAMP,
    modified_at TIMESTAMP,

    category_id INT NOT NULL,
    discount_id INT,
    FOREIGN KEY (discount_id) REFERENCES discount (id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES product_category (id) ON DELETE RESTRICT
);

-- One to Many
CREATE TABLE product_category
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(64) UNIQUE NOT NULL,
    description TEXT
);

-- One to one
CREATE TABLE product_inventory
(
    id                 SERIAL PRIMARY KEY,
    quantity           INT,
    storage_location   VARCHAR(64),
    placement          VARCHAR(64),
    modified_at        TIMESTAMP,
    product_id         BIGINT UNIQUE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
);

-- One to Many
CREATE TABLE discount
(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(64) UNIQUE NOT NULL,
    description      TEXT,
    discount_percent INT,
    active           BOOLEAN,
    created_at       TIMESTAMP,
    modified_at      TIMESTAMP
);

