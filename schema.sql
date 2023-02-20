/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);

CREATE TABLE animals (
        id BIGSERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        date_of_birth DATE NOT NULL,
        escape_attempts INTEGER NOT NULL,
        neutered BOOL NOT NULL,
        weight_kg DECIMAL(4,2) NOT NULL
        );
