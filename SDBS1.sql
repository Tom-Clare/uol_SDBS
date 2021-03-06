CREATE DATABASE `sdbs`;
USE `sdbs`;

CREATE TABLE `driver` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`firstname` VARCHAR(50) NOT NULL,
	`lastname` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `vehicle` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`make` VARCHAR(100) NOT NULL,
	`model` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `parcel` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`shift_id` INT NOT NULL,
	`address_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `shift` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`shift_type_id` INT NOT NULL,
	`driver_id` INT NOT NULL,
	`vehicle_id` INT NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `shift_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `location` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`shift_id` INT NOT NULL,
	`time` TIME NOT NULL,
	`latitude` DECIMAL(15,10) NOT NULL,
	`longitude` DECIMAL(15,10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `address` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`line_1` VARCHAR(100) NOT NULL,
	`line_2` VARCHAR(100),
	`county` VARCHAR(100) NOT NULL,
	`country` VARCHAR(100) NOT NULL,
	`postcode` VARCHAR(15) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `parcel` ADD CONSTRAINT `parcel_fk_shift` FOREIGN KEY (`shift_id`) REFERENCES `shift`(`id`);

ALTER TABLE `parcel` ADD CONSTRAINT `parcel_fk_address` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `shift` ADD CONSTRAINT `shift_fk_shift_type_id` FOREIGN KEY (`shift_type_id`) REFERENCES `shift_type`(`id`);

ALTER TABLE `shift` ADD CONSTRAINT `shift_fk_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `driver`(`id`);

ALTER TABLE `shift` ADD CONSTRAINT `shift_fk_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle`(`id`);

ALTER TABLE `location` ADD CONSTRAINT `location_fk_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `shift`(`id`);


INSERT INTO `shift_type` (`name`) VALUES ("morning");
INSERT INTO `shift_type` (`name`) VALUES ("afternoon");

INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Jim","Henshaw");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Toby","Best");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Ben","Jameson");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Madilyn","Perrot");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Toby","Clarke");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Mike","Hemsworth");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Penny","Simonsson");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Josephine","Desroches");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Eric","Revie");
INSERT INTO `driver` (`firstname`, `lastname`) VALUES ("Maude","van Buren");

INSERT INTO `vehicle` (`make`, `model`) VALUES ("LDV","MAXUS");
INSERT INTO `vehicle` (`make`, `model`) VALUES ("Ford","Transit");
INSERT INTO `vehicle` (`make`, `model`) VALUES ("Mercedes","Sprinter");
INSERT INTO `vehicle` (`make`, `model`) VALUES ("Ford","Transit");
INSERT INTO `vehicle` (`make`, `model`) VALUES ("LDV","MAXUS");

-- begin shifts
-- day 1
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 4, 1, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 2, 4, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 1, 5, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 8, 2, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 6, 3, '2021-01-25');

INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 9, 1, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 7, 4, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 5, 5, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 3, 3, '2021-01-25');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 10, 2, '2021-01-25');

-- day 2
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 6, 4, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 10, 3, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 3, 5, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 1, 1, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 2, 2, '2021-01-26');

INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 5, 1, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 9, 4, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 4, 2, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 8, 3, '2021-01-26');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 7, 5, '2021-01-26');

-- day 3
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 2, 5, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 6, 1, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 8, 3, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 3, 2, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 4, 4, '2021-01-27');

INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 1, 5, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 7, 2, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 5, 3, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 10, 1, '2021-01-27');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 9, 4, '2021-01-27');

-- day 4
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 10, 1, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 2, 5, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 6, 2, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 8, 3, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 9, 4, '2021-01-28');

INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 7, 5, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 5, 2, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 1, 4, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 3, 1, '2021-01-28');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 4, 3, '2021-01-28');

-- day 5
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 2, 1, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 7, 4, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 3, 2, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 6, 3, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (1, 10, 5, '2021-01-29');

INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 5, 5, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 4, 1, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 1, 3, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 9, 2, '2021-01-29');
INSERT INTO `shift` (`shift_type_id`, `driver_id`, `vehicle_id`, `date`) VALUES (2, 8, 4, '2021-01-29');

-- Location data
-- morning 1
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (1, '08:30:00', 51.43, -4.57);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (2, '08:30:00', 51.2, -4.74);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (3, '08:30:00', 51.99, -4.7);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (4, '08:30:00', 52.31, -4.7);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (5, '08:30:00', 52.89, -3.24);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (1, '09:30:00', 51.43, 0.48);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (2, '09:30:00', 50.33, -4.02);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (3, '09:30:00', 52.31, 0.13);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (4, '09:30:00', 51.48, -1.92);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (5, '09:30:00', 50.15, -0.96);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (1, '10:30:00', 51.73, -3.29);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (2, '10:30:00', 52.53, -4.04);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (3, '10:30:00', 50.84, -2.78);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (4, '10:30:00', 52.25, -2.52);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (5, '10:30:00', 52.22, -0.36);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (1, '11:30:00', 50.55, -0.98);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (2, '11:30:00', 51.43, -3.39);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (3, '11:30:00', 52.37, -4.39);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (4, '11:30:00', 52.05, -5.43);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (5, '11:30:00', 51.64, -4.86);

-- afternoon 1
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (6, '12:30:00', 51.7, -4.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (7, '12:30:00', 51.72, -0.05);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (8, '12:30:00', 51.48, -5.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (9, '12:30:00', 50.28, 0.03);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (10, '12:30:00', 51.04, -0.05);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (6, '13:30:00', 52.05, -1.46);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (7, '13:30:00', 51.83, -1.06);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (8, '13:30:00', 50.62, -5.43);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (9, '13:30:00', 50.79, -3.96);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (10, '13:30:00', 50.55, -5.36);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (6, '14:30:00', 51.48, 0.03);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (7, '14:30:00', 51.11, -2.77);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (8, '14:30:00', 52.67, -3.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (9, '14:30:00', 50.65, -5.2);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (10, '14:30:00', 52.1, -3.69);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (6, '15:30:00', 50.15, -0.9);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (7, '15:30:00', 51.72, -1.73);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (8, '15:30:00', 50.77, -3.46);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (9, '15:30:00', 52.69, -2);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (10, '15:30:00', 51.04, -0.03);

-- morning 2
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (11, '08:30:00', 51.63, -3.26);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (12, '08:30:00', 52.03, -5.2);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (13, '08:30:00', 51.11, -0.06);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (14, '08:30:00', 51.23, -3.71);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (15, '08:30:00', 51.16, -2.83);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (11, '09:30:00', 51.01, -0.96);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (12, '09:30:00', 50.61, -4.79);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (13, '09:30:00', 52.1, -4.02);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (14, '09:30:00', 51.79, -0.05);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (15, '09:30:00', 52.06, -0.34);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (11, '10:30:00', 51.72, -3.39);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (12, '10:30:00', 52.69, -1.73);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (13, '10:30:00', 52.69, -4.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (14, '10:30:00', 52.1, -2.58);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (15, '10:30:00', 50.77, -0.98);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (11, '11:30:00', 50.32, -2);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (12, '11:30:00', 50.17, -0.06);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (13, '11:30:00', 50.58, -2.78);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (14, '11:30:00', 52.49, -4.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (15, '11:30:00', 50.3, -2.78);

-- afternoon 2
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (16, '12:30:00', 51.11, -3.47);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (17, '12:30:00', 52.8, -1.73);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (18, '12:30:00', 51.72, -0.93);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (19, '12:30:00', 52.31, -4.02);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (20, '12:30:00', 50.62, -0.81);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (16, '13:30:00', 50.78, -1.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (17, '13:30:00', 52.03, -5.36);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (18, '13:30:00', 50.55, -0.63);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (19, '13:30:00', 52.69, 0.69);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (20, '13:30:00', 52, -4.86);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (16, '14:30:00', 51.03, -4.79);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (17, '14:30:00', 52.06, -4.02);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (18, '14:30:00', 52.69, -5.43);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (19, '14:30:00', 51.76, -4.39);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (20, '14:30:00', 52.31, -2.78);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (16, '15:30:00', 51.64, -5.36);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (17, '15:30:00', 50.61, -0.03);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (18, '15:30:00', 51.63, -0.76);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (19, '15:30:00', 50.62, 0.66);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (20, '15:30:00', 51.87, -1.28);

-- morning 3
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (21, '08:30:00', 52.69, -0.32);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (22, '08:30:00', 52.32, -3.47);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (23, '08:30:00', 52.05, -3.66);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (24, '08:30:00', 50.29, -1.52);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (25, '08:30:00', 50.3, -3.71);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (21, '09:30:00', 51.07, -4.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (22, '09:30:00', 51.72, -1.92);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (23, '09:30:00', 50.78, -3.46);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (24, '09:30:00', 51.7, -0.34);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (25, '09:30:00', 52.1, -0.03);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (21, '10:30:00', 51.64, -3.09);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (22, '10:30:00', 50.83, -4.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (23, '10:30:00', 52.56, -3.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (24, '10:30:00', 51.22, -5.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (25, '10:30:00', 52.09, -4.79);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (21, '11:30:00', 52.67, -5.33);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (22, '11:30:00', 50.96, 0.04);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (23, '11:30:00', 52.45, -4.86);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (24, '11:30:00', 51.34, -1.73);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (25, '11:30:00', 52.06, -4.86);

-- afternoon 3
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (26, '12:30:00', 51.43, -5.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (27, '12:30:00', 51.22, -2.83);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (28, '12:30:00', 51.43, -0.81);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (29, '12:30:00', 51.08, -1.86);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (30, '12:30:00', 51.97, -0.63);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (26, '13:30:00', 52.25, -1.86);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (27, '13:30:00', 51.97, -0.9);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (28, '13:30:00', 52.03, -0.97);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (29, '13:30:00', 51.23, -0.63);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (30, '13:30:00', 52.87, -1.48);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (26, '14:30:00', 52.5, -2.83);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (27, '14:30:00', 50.8, -2.32);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (28, '14:30:00', 51.53, -0.76);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (29, '14:30:00', 52.56, -2.83);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (30, '14:30:00', 51.46, -4.7);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (26, '15:30:00', 51.72, -2.77);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (27, '15:30:00', 51.16, -0.81);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (28, '15:30:00', 51.93, -2.58);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (29, '15:30:00', 51.07, -2.96);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (30, '15:30:00', 50.55, -0.05);

-- morning 4
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (31, '08:30:00', 52.56, -0.9);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (32, '08:30:00', 51.53, -4.7);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (33, '08:30:00', 51.7, 0.04);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (34, '08:30:00', 51.08, -5.43);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (35, '08:30:00', 50.8, -3.96);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (31, '09:30:00', 52.8, -0.36);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (32, '09:30:00', 51.13, -2.96);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (33, '09:30:00', 52.22, -4.82);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (34, '09:30:00', 52.02, 0.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (35, '09:30:00', 50.39, -1.98);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (31, '10:30:00', 50.17, -4.38);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (32, '10:30:00', 51.72, -4.79);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (33, '10:30:00', 50.83, -0.71);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (34, '10:30:00', 51.6, -2.52);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (35, '10:30:00', 50.39, 0.66);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (31, '11:30:00', 51.11, 0.59);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (32, '11:30:00', 51.22, -1.84);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (33, '11:30:00', 50.79, 0.48);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (34, '11:30:00', 51.04, -0.64);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (35, '11:30:00', 52.32, -5.38);

-- afternoon 4
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (36, '12:30:00', 51.64, -2.32);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (37, '12:30:00', 51.79, -2.78);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (38, '12:30:00', 51.46, 0.04);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (39, '12:30:00', 51.2, -3.66);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (40, '12:30:00', 51.04, -4.06);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (36, '13:30:00', 51.97, -3.09);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (37, '13:30:00', 50.3, -4.79);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (38, '13:30:00', 51.8, -1.27);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (39, '13:30:00', 52.5, -5.33);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (40, '13:30:00', 52.67, 0.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (36, '14:30:00', 50.17, -0.06);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (37, '14:30:00', 52.37, -5.25);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (38, '14:30:00', 51.03, -0.63);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (39, '14:30:00', 52.22, -2.85);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (40, '14:30:00', 51.97, -2.78);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (36, '15:30:00', 50.32, -1.98);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (37, '15:30:00', 51.22, -4.57);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (38, '15:30:00', 51.72, 0.13);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (39, '15:30:00', 51.7, -0.71);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (40, '15:30:00', 50.39, -4.57);

-- morning 5
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (41, '08:30:00', 52.8, -4.7);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (42, '08:30:00', 50.15, -2.77);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (43, '08:30:00', 52.89, -1.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (44, '08:30:00', 52.53, 0.62);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (45, '08:30:00', 51.64, -0.81);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (41, '09:30:00', 50.65, -3.71);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (42, '09:30:00', 50.88, 0.59);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (43, '09:30:00', 50.98, -2.83);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (44, '09:30:00', 51.15, 0.59);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (45, '09:30:00', 52.05, -4.74);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (41, '10:30:00', 52.67, -0.93);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (42, '10:30:00', 51.95, -1.86);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (43, '10:30:00', 52.56, -2.32);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (44, '10:30:00', 50.17, 0.59);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (45, '10:30:00', 52.09, -2.83);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (41, '11:30:00', 52.03, -1.27);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (42, '11:30:00', 51.04, -4.04);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (43, '11:30:00', 52.5, -2.11);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (44, '11:30:00', 50.33, -4.79);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (45, '11:30:00', 52.31, -4.06);

-- afternoon 5
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (46, '12:30:00', 50.13, 0.59);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (47, '12:30:00', 52.49, -4.57);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (48, '12:30:00', 52.56, -2.85);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (49, '12:30:00', 50.84, -2.74);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (50, '12:30:00', 51.01, 0.13);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (46, '13:30:00', 51.8, -1.46);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (47, '13:30:00', 51.2, -2.83);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (48, '13:30:00', 52, -2.83);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (49, '13:30:00', 51.11, -0.96);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (50, '13:30:00', 52.16, -1.84);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (46, '14:30:00', 52.53, -4.82);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (47, '14:30:00', 51.76, -5.25);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (48, '14:30:00', 50.83, -1.73);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (49, '14:30:00', 51.73, -0.64);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (50, '14:30:00', 50.58, -3.09);

INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (46, '15:30:00', 52.06, -2.78);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (47, '15:30:00', 50.96, -3.39);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (48, '15:30:00', 51.22, -3.46);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (49, '15:30:00', 51.07, -0.98);
INSERT INTO `location` (`shift_id`, `time`, `latitude`, `longitude`) VALUES (50, '15:30:00', 52.69, -1.27);

-- Addresses
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("90 Scarcroft Road","","Somerset","England","BA20 1RE");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("61 Hendford Hill","","Herefordshire","England","HR9 2OD");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("101 Victoria Road","","Cheshire","England","SK9 2EK");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("9 Glandovey Terrace","","Herefordshire","England","HR6 5TF");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("2 Cefn Road","","Derbyshire","England","DE3 1EA");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("3 Gaben Street","","Dorset","England","DT7 4QZ");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("79 Terrick Rd","","Somerset","England","BA16 5RT");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("209 Pall Terrace","","Essex","England","EN9 3HX");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("7 Preston Rd","","Derbyshire","England","DE5 2FL");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("69 Ockham Road","","Devon","England","EX34 2WD");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("74 Wenlock Terrace","","Cheshire","England","SK8 3RM");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("45 Withers Close","","Dorset","England","DT9 2EJ");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("75 Hendford Hill","","Staffordshire","England","DE13 4RB");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("12 Roman Rd","","Somerset","England","BA16 7FD");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("69 Terrick Rd","","Cheshire","England","SK9 1DL");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("17 Poplar Avenue","","Ilfracombe","England","EX34 1WD");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("14 Pendwyallt Road","","Herefordshire","England","HR6 2ED");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("64 Wenlock Terrace","","Essex","England","EN9 1FA");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("38 Roman Rd","","Staffordshire","England","DE14 3PS");
INSERT INTO `address` (`line_1`, `line_2`, `county`, `country`, `postcode`) VALUES ("51 Wenlock Terrace","","Herefordshire","England","HR5 1WP");

-- Parcels
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (1,9);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (3,17);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (2,10);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (1,9);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (5,12);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (4,11);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (5,8);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (2,3);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (3,15);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (4,7);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (5,20);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (10,5);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (9,1);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (8,6);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (9,13);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (6,2);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (7,16);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (10,4);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (7,5);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (6,19);
INSERT INTO `parcel` (`shift_id`, `address_id`) VALUES (7,14);

-- Procedures

DELIMITER //

CREATE PROCEDURE GetAllDrivers()
BEGIN
	SELECT id, firstname, lastname
	FROM `driver`;
END //

CREATE PROCEDURE GetLatLongFromLocationId(
	IN location_id INT,
	OUT out_latitude DECIMAL(15,10),
	OUT out_longitude DECIMAL(15,10) 
)
BEGIN
	SELECT `latitude`, `longitude` INTO out_latitude, out_longitude
	FROM `location`
	WHERE `id` = location_id;
END //

CREATE PROCEDURE GetLocationOfDriver(
	IN in_driver_id INT,
	IN in_time TIME,
	IN in_date DATE,
	OUT out_latitude DECIMAL(15,10),
	OUT out_longitude DECIMAL(15,10)
)
BEGIN
	SET @location_id := (
		SELECT l.`id`
		FROM `location` l
		JOIN `shift` s ON s.`driver_id` = l.`shift_id`
		WHERE s.`driver_id` = in_driver_id
		AND s.`date` = in_date
		AND l.`time` = in_time
	);
	CALL GetLatLongFromLocationId(@location_id, @latitude, @longitude);

	SELECT @latitude, @longitude INTO out_latitude, out_longitude;
END //

DELIMITER ;