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