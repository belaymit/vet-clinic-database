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

-- Insert the following data for vets:

    -- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
    -- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
    -- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
    -- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, date '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, date '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, date '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, date '2008-06-08');

-- Insert the following data for specialties:

    -- Vet William Tatcher is specialized in Pokemon.
    -- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
    -- Vet Jack Harkness is specialized in Digimon.

INSERT INTO specializations (species_id, vets_id)
VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher')),
	   ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
       ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
	   ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));

    
    -- Insert the following data for visits: 

INSERT INTO visits (animals_id, vets_id, date_of_visit) 
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
	((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
	((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
	((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
	((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
	((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
	((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
	((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
	((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
	((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
	((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
	((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
	((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
	((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
	((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
	((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
	((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
	((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
	((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
	((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');

	-- Advanced-databases
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	SELECT * FROM (SELECT id FROM animals) animal_ids,
	(SELECT id FROM vets) vets_ids,
	generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
	
-- INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- Modification
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,5000000), 'owner_' || generate_series(1,5000000) || '@mail.com';
