CREATE TABLE `owners`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `owners` ADD PRIMARY KEY `owners_id_primary`(`id`);
CREATE TABLE `visits`(
    `animals_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `vets_id` BIGINT NOT NULL,
    `vets_id` DATE NOT NULL,
    `date_of_visit` DATE NOT NULL
);
ALTER TABLE
    `visits` ADD PRIMARY KEY `visits_animals_id_primary`(`animals_id`);
CREATE TABLE `specializations`(
    `species_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `vets_id` BIGINT NOT NULL
);
ALTER TABLE
    `specializations` ADD PRIMARY KEY `specializations_species_id_primary`(`species_id`);
CREATE TABLE `animals`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `escape_attempt` INT NOT NULL,
    `neutered` TINYINT(1) NOT NULL,
    `weight_kg` DECIMAL(8, 2) NOT NULL,
    `species_id` BIGINT NOT NULL,
    `owner_id` BIGINT NOT NULL
);
ALTER TABLE
    `animals` ADD PRIMARY KEY `animals_id_primary`(`id`);
CREATE TABLE `vets`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL,
    `date_of_graduation` DATE NOT NULL
);
ALTER TABLE
    `vets` ADD PRIMARY KEY `vets_id_primary`(`id`);
CREATE TABLE `species`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `species` ADD PRIMARY KEY `species_id_primary`(`id`);
ALTER TABLE
    `animals` ADD CONSTRAINT `animals_species_id_foreign` FOREIGN KEY(`species_id`) REFERENCES `species`(`id`);
ALTER TABLE
    `animals` ADD CONSTRAINT `animals_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `owners`(`id`);
ALTER TABLE
    `visits` ADD CONSTRAINT `visits_vets_id_foreign` FOREIGN KEY(`vets_id`) REFERENCES `animals`(`id`);
ALTER TABLE
    `visits` ADD CONSTRAINT `visits_vets_id_foreign` FOREIGN KEY(`vets_id`) REFERENCES `vets`(`id`);
ALTER TABLE
    `specializations` ADD CONSTRAINT `specializations_vets_id_foreign` FOREIGN KEY(`vets_id`) REFERENCES `vets`(`id`);
ALTER TABLE
    `specializations` ADD CONSTRAINT `specializations_species_id_foreign` FOREIGN KEY(`species_id`) REFERENCES `species`(`id`);
