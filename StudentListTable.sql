CREATE SCHEMA `dienynas` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `dienynas`.`pazymiai`;
DROP TABLE IF EXISTS `dienynas`.`studentai`;

CREATE TABLE `dienynas`.`studentai` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vardas` VARCHAR(255) NOT NULL,
  `pavarde` VARCHAR(255) NOT NULL,
  `el_pastas` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `dienynas`.`pazymiai` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `studentas_id` INT NOT NULL,
  `data` DATE NOT NULL,
  `pazymys` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `studentas_id_idx` (`studentas_id` ASC) VISIBLE,
  CONSTRAINT `studentas_id`
    FOREIGN KEY (`studentas_id`)
    REFERENCES `dienynas`.`studentai` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);

INSERT INTO `dienynas`.`studentai` (`vardas`, `pavarde`, `el_pastas`) VALUES ('Gediminas', 'Jonaitis', 'g.jonaitis@gmail.com');
INSERT INTO `dienynas`.`studentai` (`vardas`, `pavarde`, `el_pastas`) VALUES ('Jonas', 'Petraitis', 'j.petraitis@gmail.com');
INSERT INTO `dienynas`.`studentai` (`vardas`, `pavarde`, `el_pastas`) VALUES ('Kazimieras', 'Lukšys', 'k.luksys@gmail.com');
INSERT INTO `dienynas`.`studentai` (`vardas`, `pavarde`, `el_pastas`) VALUES ('Rimas', 'Motuza', 'r.motuza@gmail.com');

INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('1', '2018.08.12', '10');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('2', '2018.08.12', '8');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('3', '2018.08.12', '8');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('4', '2018.08.12', '9');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('1', '2018.08.16', '9');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('2', '2018.08.16', '8');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('3', '2018.08.16', '9');
INSERT INTO `dienynas`.`pazymiai` (`studentas_id`, `data`, `pazymys`) VALUES ('1', '2018.08.17', '10');

/* Pirma užduotis - Suskaičiuokite kiek iš viso lentelėje yra studentų (įrašų) */
SELECT COUNT(*) AS StudentuSkaicius FROM dienynas.studentai;

/* Antra užduotis - Išveskite visus pažymius gautus 2018.08.12 dieną (sąrašas turi būti toks: studento vardas, pavardė, gautas pažymys) */

SELECT vardas, pavarde, pazymys FROM dienynas.studentai, dienynas.pazymiai 
WHERE studentai.id=pazymiai.studentas_id 
AND pazymiai.data = '2018-08-12';

/* Trečia užduotis - Išveskite visų studentų vidurkius (sąrašas turi būti toks: studento vardas, pavardė, jo pažymių vidurkis). */

SELECT vardas, pavarde, AVG(pazymys) AS vidurkis FROM dienynas.studentai, dienynas.pazymiai 
WHERE studentai.id=pazymiai.studentas_id 
GROUP BY studentas_id;

/* Ketvirta užduotis - Išveskite visus studentus kurių vidurkis didesnis nei 9 */

SELECT vardas, pavarde, AVG(pazymys) AS vidurkis FROM dienynas.studentai, dienynas.pazymiai 
WHERE studentai.id=pazymiai.studentas_id 
AND (SELECT AVG(pazymys) FROM pazymiai WHERE studentai.id=pazymiai.studentas_id GROUP BY studentas_id) > 9
GROUP BY studentas_id;

/* Penkta užduotis - Išveskite tų studentų el. Pašo adresus kurie turi mažiau arba tik po vieną pažymį*/

SELECT el_pastas FROM dienynas.studentai, dienynas.pazymiai
WHERE studentai.id=pazymiai.studentas_id
AND (SELECT COUNT(pazymys) FROM pazymiai WHERE studentai.id=pazymiai.studentas_id GROUP BY studentas_id) <= 1
GROUP BY studentas_id;