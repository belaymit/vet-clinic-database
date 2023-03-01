/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Adding a new columnn species to type string to the animals
ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

-- Inside a transaction update the animals(species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;


-- Inside a transaction to update animals (species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 
COMMIT;
SELECT species from animals;

-- Inside a transaction delete all records in the animals;
BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;



BEGIN TRANSACTION;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE  date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT mySAVEPOINT;

--Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

--Rollback to the savepoint
ROLLBACK TO mySAVEPOINT;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 

--Commit transaction
COMMIT;

SELECT weight_kg FROM animals;


-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempt = 0;

-- What is the average weight of animals?
SELECT ROUND(AVG(weight_kg), 2) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT name, escape_attempt FROM animals WHERE escape_attempt = (SELECT MAX(escape_attempts) FROM animals);

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, ROUND(AVG(escape_attempt), 2) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:

    -- What animals belong to Melody Pond?
SELECT name FROM animals
    JOIN owners ON animals.owner_id = owners.id 
    WHERE full_name = 'Melody Pond';


    -- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.*, species.name AS pokemon_species FROM animals
    JOIN species ON animals.species_id = species.id
    WHERE species.name = 'Pokemon';


    -- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name AS animal_name, owners.fulL_name AS owner_name FROM owners
    LEFT JOIN animals ON owners.id = animals.owner_id;

    -- How many animals are there per species?
SELECT species.name AS species_name, COUNT(*) FROM animals
    JOIN species ON species.id = animals.species_id
    GROUP BY species.name;


    -- List all Digimon owned by Jennifer Orwell.
SELECT animals.name as animal_name, owners.full_name AS owner_name, species.name AS species_name 
from animals
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

    -- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempt = 0;


    -- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS num_animals
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY num_animals DESC;

-- Write queries to answer the following: 

    -- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name as Vet, visits.date_of_visit FROM vets
    JOIN visits ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'William Tatcher'
    ORDER BY visits.date_of_visit DESC
    LIMIT 1;

    -- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as num_animals_visited FROM vets
    JOIN visits ON vets.id = visits.vets_id
    WHERE vets.name = 'Stephanie Mendez';
    
    -- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS specialized_in FROM vets
    LEFT JOIN specializations ON specializations.vets_id = vets.id
    LEFT JOIN  species ON specializations.species_id = species.id;

    -- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal_name, visits.date_of_visit FROM animals
    JOIN visits ON visits.animals_id = animals.id
    JOIN vets ON vets.id = visits.vets_id
    WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

    -- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) AS count FROM animals
    JOIN visits ON visits.animals_id = animals.id
    GROUP BY animals.name
    ORDER BY count DESC
    LIMIT 1;

    -- Who was Maisy Smith's first visit?
SELECT vets.name as vet, visits.date_of_visit, animals.name as animal_name FROM visits 
    JOIN vets ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'Maisy Smith'
    ORDER BY visits.date_of_visit
    LIMIT 1;

    -- Details for most recent visit: animal information, vet information, and date of visit.
SELECT date_of_visit,
	animals.date_of_birth AS animal_date,
	animals.escape_attempt,
	animals.neutered,
	animals.weight_kg AS animal_weight,
	vets.name AS vet_name,
	vets.age AS vet_age,
	vets.date_of_graduation
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit
LIMIT 1;

    -- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(*)
    FROM visits 
    JOIN animals ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
    JOIN specializations ON specializations.vets_id = visits.vets_id
    WHERE animals.species_id != specializations.species_id;

    -- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name as species, COUNT(*) FROM visits
    JOIN vets ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
    JOIN species ON species.id = animals.species_id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name;


-- Advanced Databases

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';