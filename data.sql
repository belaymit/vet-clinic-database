/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Agumon', '2022-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Gabumon', '20218-11-15', 2, TRUE, 8.0);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.0);

-- Update the table with the following data
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Plantmon', '2022-11-15', 2, TRUE, -5);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Boarmon', '2005-07-07', 7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg) VALUES('Blossom', '1998-08-13', 3, TRUE, 17);

-- Insert data into owners table
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);


-- Insert the following data into the species table:
INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Digimon')
WHERE name like '%mon';

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

-- Modify inserted animals to include owner information (owner_id): 
-- Sam Smith owns Agumon.
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Bob owns Devimon and Plantmon.
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';