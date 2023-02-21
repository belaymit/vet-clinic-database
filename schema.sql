/* Database schema to keep the structure of entire database. */
DROP TABLE animals;

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempt INT,
	neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL(10, 2) NOT NULL,
	species VARCHAR(100)
);

-- Added Owners table 

CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
        full_name VARCHAR(100) NOT NULL,
        age INT NOT NULL
);

-- Added Species table

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Alterd animals table and added foreign key

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id BIGINT REFERENCES species (id);
ALTER TABLE animals ADD owner_id BIGINT REFERENCES owners (id);
