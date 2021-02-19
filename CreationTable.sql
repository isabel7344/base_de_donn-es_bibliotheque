--   Script MySQL. mis sur phpMyAdmin dans l'onglet des requètes sql
#------------------------------------------------------------


#------------------------------------------------------------
# Table: CUSTOMERS
#------------------------------------------------------------

CREATE TABLE CUSTOMERS(
        ID         Int  Auto_increment  NOT NULL ,
        LASTNAME   Varchar (50) NOT NULL ,
        FIRSTANAME Varchar (50) NOT NULL ,
        BIRTHDAY   Int NOT NULL
	,CONSTRAINT CUSTOMERS_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GENDERS_BOOK
#------------------------------------------------------------

CREATE TABLE GENDERS_BOOK(
        ID          Int  Auto_increment  NOT NULL ,
        GENDER_NAME Varchar (100) NOT NULL
	,CONSTRAINT GENDERS_BOOK_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AUTHOR
#------------------------------------------------------------

CREATE TABLE AUTHOR(
        ID               Int  Auto_increment  NOT NULL ,
        LASTNAME_AUTHOR  Varchar (100) NOT NULL ,
        FIRSTNAME_AUTHOR Varchar (100) NOT NULL
	,CONSTRAINT AUTHOR_PK PRIMARY KEY (ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: BOOKS
#------------------------------------------------------------

CREATE TABLE BOOKS(
        ID        Int  Auto_increment  NOT NULL ,
        TITLE     Varchar (100) NOT NULL ,
        ID_AUTHOR Int NOT NULL
	,CONSTRAINT BOOKS_PK PRIMARY KEY (ID)

	,CONSTRAINT BOOKS_AUTHOR_FK FOREIGN KEY (ID_AUTHOR) REFERENCES AUTHOR(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REGISTER
#------------------------------------------------------------

CREATE TABLE REGISTER(
        ID             Int  Auto_increment  NOT NULL ,
        BORROWING_DATE Date NOT NULL ,
        RETURN_DATE    Date NOT NULL ,
        ID_CUSTOMERS   Int NOT NULL ,
        ID_BOOKS       Int NOT NULL
	,CONSTRAINT REGISTER_PK PRIMARY KEY (ID)

	,CONSTRAINT REGISTER_CUSTOMERS_FK FOREIGN KEY (ID_CUSTOMERS) REFERENCES CUSTOMERS(ID)
	,CONSTRAINT REGISTER_BOOKS0_FK FOREIGN KEY (ID_BOOKS) REFERENCES BOOKS(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: HAVE
#------------------------------------------------------------

CREATE TABLE HAVE(
        ID       Int NOT NULL ,
        ID_BOOKS Int NOT NULL
	,CONSTRAINT HAVE_PK PRIMARY KEY (ID,ID_BOOKS)

	,CONSTRAINT HAVE_GENDERS_BOOK_FK FOREIGN KEY (ID) REFERENCES GENDERS_BOOK(ID)
	,CONSTRAINT HAVE_BOOKS0_FK FOREIGN KEY (ID_BOOKS) REFERENCES BOOKS(ID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: LIBRAIRY_GENDERS_CUSTOMER
#------------------------------------------------------------

CREATE TABLE LIBRAIRY_GENDERS_CUSTOMER(
        ID              Int NOT NULL ,
        ID_GENDERS_BOOK Int NOT NULL
	,CONSTRAINT LIBRAIRY_GENDERS_CUSTOMER_PK PRIMARY KEY (ID,ID_GENDERS_BOOK)

	,CONSTRAINT LIBRAIRY_GENDERS_CUSTOMER_CUSTOMERS_FK FOREIGN KEY (ID) REFERENCES CUSTOMERS(ID)
	,CONSTRAINT LIBRAIRY_GENDERS_CUSTOMER_GENDERS_BOOK0_FK FOREIGN KEY (ID_GENDERS_BOOK) REFERENCES GENDERS_BOOK(ID)
)ENGINE=InnoDB;





-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 19 fév. 2021 à 14:09
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LASTNAME_AUTHOR` varchar(100) NOT NULL,
  `FIRSTNAME_AUTHOR` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`ID`, `LASTNAME_AUTHOR`, `FIRSTNAME_AUTHOR`) VALUES
(1, 'Marx', 'jean'),
(2, 'Maupassant', 'Guy'),
(3, 'Haddaway', 'Malcom'),
(4, 'NONO', 'GEORGE');

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) NOT NULL,
  `ID_GENDERS_BOOK` int(11) NOT NULL,
  `ID_AUTHOR` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BOOKS_GENDERS_BOOK_FK` (`ID_GENDERS_BOOK`),
  KEY `BOOKS_AUTHOR0_FK` (`ID_AUTHOR`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`ID`, `TITLE`, `ID_GENDERS_BOOK`, `ID_AUTHOR`) VALUES
(1, 'LA MAISON HANTEE', 1, 3),
(3, 'LES FLEURS DU MAL ', 3, 2),
(4, 'LE PETIT LAPIN ROUGE', 4, 4),
(6, 'L\'ATTAQUE DES ZOMBIES', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `BIRTHDAY` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`ID`, `LASTNAME`, `FIRSTNAME`, `BIRTHDAY`) VALUES
(1, 'BOBO', 'JACQUES', '1930-10-05'),
(2, 'PERRY', 'KATIE', '2016-02-03'),
(3, 'MAGIC', 'JEAN', '1990-02-09'),
(4, 'VICKING', 'MIKE', '1997-09-15');

-- --------------------------------------------------------

--
-- Structure de la table `genders_book`
--

DROP TABLE IF EXISTS `genders_book`;
CREATE TABLE IF NOT EXISTS `genders_book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GENDER_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `genders_book`
--

INSERT INTO `genders_book` (`ID`, `GENDER_NAME`) VALUES
(1, 'HORREUR'),
(2, 'SCIENCE FICTION'),
(3, 'ROMAN'),
(4, 'JEUNESSE');

-- --------------------------------------------------------

--
-- Structure de la table `librairy_genders_customer`
--

DROP TABLE IF EXISTS `librairy_genders_customer`;
CREATE TABLE IF NOT EXISTS `librairy_genders_customer` (
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BORROWING_DATE` date NOT NULL,
  `RETURN_DATE` date DEFAULT NULL,
  `ID_CUSTOMERS` int(11) NOT NULL,
  `ID_BOOKS` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REGISTER_CUSTOMERS_FK` (`ID_CUSTOMERS`),
  KEY `REGISTER_BOOKS0_FK` (`ID_BOOKS`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `register`
--

INSERT INTO `register` (`ID`, `BORROWING_DATE`, `RETURN_DATE`, `ID_CUSTOMERS`, `ID_BOOKS`) VALUES
(5, '2020-11-02', '2021-01-05', 1, 4),
(6, '2021-02-01', NULL, 3, 1),
(7, '2020-11-02', '2021-02-01', 2, 3),
(8, '2021-01-03', NULL, 4, 6),
(9, '2021-01-25', '2021-02-03', 2, 6),
(10, '2020-12-08', '2020-12-15', 1, 6);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `BOOKS_AUTHOR0_FK` FOREIGN KEY (`ID_AUTHOR`) REFERENCES `author` (`ID`),
  ADD CONSTRAINT `BOOKS_GENDERS_BOOK_FK` FOREIGN KEY (`ID_GENDERS_BOOK`) REFERENCES `genders_book` (`ID`);

--
-- Contraintes pour la table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `REGISTER_BOOKS0_FK` FOREIGN KEY (`ID_BOOKS`) REFERENCES `books` (`ID`),
  ADD CONSTRAINT `REGISTER_CUSTOMERS_FK` FOREIGN KEY (`ID_CUSTOMERS`) REFERENCES `customers` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
