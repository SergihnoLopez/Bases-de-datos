CREATE TABLE author (
  id INT NOT NULL,
  name VARCHAR(45) NULL,
  birthdate DATE NULL,
  gender CHAR NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table publisher
-- -----------------------------------------------------
CREATE TABLE publisher (
  id INT NOT NULL,
  name VARCHAR(45) NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table book
-- -----------------------------------------------------
CREATE TABLE book (
  id INT NOT NULL,
  title VARCHAR(45) NULL,
  year INT NULL,
  author_id INT NULL,
  publisher_id INT NOT NULL,
  description VARCHAR(45) NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
CREATE TABLE user (
  id INT NOT NULL,
  gender CHAR NULL,
  name VARCHAR(45) NULL,
  birthdate DATE NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table loan
-- -----------------------------------------------------
CREATE TABLE loan (
  id INT NOT NULL,
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  borrow_date DATE NULL,
  return_date DATE NULL,
  PRIMARY KEY (id));


INSERT INTO author (id, name, birthdate, gender) VALUES (77, 'Gabriel Garcia Marquez', '1927/03/06', 'M');
INSERT INTO author (id, name, birthdate, gender) VALUES (85, 'José Saramago', '1922/11/16', 'M');
INSERT INTO author (id, name, birthdate, gender) VALUES (99, 'Joanne Rowling', '1965/07/31', 'F');

INSERT INTO publisher (id, name) VALUES (35, 'Harper and Row');
INSERT INTO publisher (id, name) VALUES (12, 'Santillana');
INSERT INTO publisher (id, name) VALUES (45, 'Oveja Negra');
INSERT INTO publisher (id, name) VALUES (17, 'Alfaguara');

INSERT INTO book (id, title, year, author_id, publisher_id, description) VALUES (1, 'cien años de soledad', 1970, 77, 35, 'premio nobel');
INSERT INTO book (id, title, year, author_id, publisher_id, description) VALUES (2, 'Ensayo sobre la ceguera', 1995, 85, 12, 'Original portugues');
INSERT INTO book (id, title, year, author_id, publisher_id, description) VALUES (3, 'El amor en los tiempos del cólera', 1985, 77, 45, 'Book Prize for Fiction');
INSERT INTO book (id, title, year, author_id, publisher_id, description) VALUES (4, 'Lazarillo de tormes', 1554, NULL, 12, 'la vida de un niño, Lázaro de Tormes');

INSERT INTO user (id, gender, name, birthdate) VALUES (250, 'F', 'Amparo Grisales', '1956/09/19');
INSERT INTO user (id, gender, name, birthdate) VALUES (560, 'M', 'Raúl Castro', '1931/06/03');

INSERT INTO loan (id, user_id, book_id, borrow_date, return_date) VALUES (5992, 250, 1, '2016/02/15', '2016/02/26');
