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

-- Create a table named vets: 

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE
);

-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.

CREATE TABLE specializations (
	species_id BIGINT REFERENCES species (id),
	vets_id BIGINT REFERENCES vets (id)
);

-- There is a many-to-many relationship between the tables animals and vets: 
-- an animal can visit multiple vets and one vet can be visited by multiple animals.
--  Create a "join table" called visits to handle this relationship, 
-- it should also keep track of the date of the visit.

CREATE TABLE visits (
	animals_id BIGINT REFERENCES animals (id),
	vets_id BIGINT REFERENCES vets (id),
	date_of_visit DATE
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id_asc on visits (animals_id ASC);
CREATE INDEX vets_id_asc on visits (vets_id);
CREATE INDEX email_id on owners(email ASC); 