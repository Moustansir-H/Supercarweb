-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 18 sep. 2024 à 10:32
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `supercar`
--

-- --------------------------------------------------------

--
-- Structure de la table `accueil`
--

DROP TABLE IF EXISTS `accueil`;
CREATE TABLE IF NOT EXISTS `accueil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `txt` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `vid` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `accueil`
--

INSERT INTO `accueil` (`id`, `txt`, `img`, `vid`) VALUES
(2, 'Explorez notre gamme impressionnante, comprenant des marques légendaires telles que BMW, FORD et bien d\'autres. Chaque véhicule est méticuleusement sélectionné pour son excellence, son innovation et son héritage inégalé.', 'https://seversbreeman.nl/app/uploads/2022/05/P90461762_highRes_the-new-bmw-m4-csl-n-scaled-e1653039140695.jpg', ''),
(3, 'Avantage de choisir Supercar', 'https://newsroom.porsche.com/.imaging/mte/porsche-templating-theme/image_1290x726/dam/US-local/Press-Releases/2022/October-2022/20221003-Q3-Sales/Gentian_Blue_GT3_Touring__013.jpg/jcr:content/Gentian_Blue_GT3_Touring__013.jpg', ''),
(4, 'Qualité Certifiée : Chaque véhicule a été minutieusement inspecté pour garantir une qualité optimale.\nOptions de Financement : Nos experts financiers sont là pour vous aider à trouver la meilleure solution de financement qui correspond à votre budget.\nService Après-Vente : Notre équipe dédiée est prête à vous accompagner avec un service après-vente de première classe.\nOffres Spéciales : Profitez de nos offres spéciales et promotions exclusives sur une sélection de véhicules.', NULL, NULL),
(5, 'BMW : L\'excellence allemande redéfinie', '/supercar/img/BMW/bmw-acceu.jpg', NULL),
(6, 'BMW, Bayerische Motoren Werke AG, incarne depuis longtemps l\'essence même de l\'ingénierie automobile allemande. Fondée en 1916, cette entreprise a su se tailler une place de choix dans l\'industrie automobile mondiale grâce à son engagement envers l\'innovation, la qualité et le design.', NULL, NULL),
(7, 'Ford : L\'héritage de l\'innovation et de la durabilité', '/supercar/img/ford/mustang-acceu.jpeg', NULL),
(8, 'Fondée en 1903 par Henry Ford, cette entreprise américaine a révolutionné la fabrication automobile avec l\"introduction de la ligne d\"assemblage mobile, rendant les voitures plus accessibles et transformant à jamais la façon dont les véhicules étaient produits. De la légendaire Ford Model T à l\"emblématique Ford Mustang, la marque a continué à incarner l\"esprit d\"innovation et d\"audace.', NULL, NULL),
(9, 'Porsche : L\'art de l\'ingénierie et de la passion automobile', '/supercar/img/Porsche/Porshe-acceu.jpg', NULL),
(10, 'Ce qui distingue Porsche, c\'est son engagement envers l\'innovation et la performance. Les technologies de pointe, telles que les moteurs à haute performance et les systèmes de transmission avancés, sont au cœur de chaque véhicule Porsche, offrant une conduite dynamique et une maniabilité exceptionnelle sur route et sur piste.', NULL, NULL),
(11, NULL, NULL, '../img/Nismo.mp4'),
(12, '', '', '../img/911.mp4'),
(13, NULL, '/supercar/img/planar.jpg', NULL),
(1, 'Bienvenue chez SuperCar, votre partenaire de confiance pour des véhicules d\'exception. Nous sommes fiers de présenter une sélection impressionnante de voitures de qualité qui répondent aux normes les plus élevées de performance, de sécurité et de style.', 'https://www.topgear.com/sites/default/files/cars-car/image/2018/03/mustang_lightning_blue_009.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `client_inscrit`
--

DROP TABLE IF EXISTS `client_inscrit`;
CREATE TABLE IF NOT EXISTS `client_inscrit` (
  `ID_client` int NOT NULL AUTO_INCREMENT,
  `Utilisateur` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Tel` int DEFAULT NULL,
  `Mdp` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `client_inscrit`
--

INSERT INTO `client_inscrit` (`ID_client`, `Utilisateur`, `Nom`, `Prenom`, `Email`, `Tel`, `Mdp`) VALUES
(1, 'Vandam', 'Jean', 'Claude', 'vandam@gmail.com', 230328, 'jean1234');

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
CREATE TABLE IF NOT EXISTS `connexion` (
  `ID_connexion` int NOT NULL AUTO_INCREMENT,
  `Utilisateur` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Mdp` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_connexion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `ID_contact` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Prenom` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Tel` int NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Message` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`ID_contact`, `Nom`, `Prenom`, `Tel`, `Mail`, `Message`) VALUES
(1, 'Jackie', 'Chan', 230328, 'Jackiechan@gmail.com', 'OKOKO'),
(3, 'Jean', 'Claude', 230328, 'Vandam@gmail.com', 'je suis vandam.'),
(5, 'Mark', 'Zukerberg', 230328, 'markz@gmail.com', 'I want to buy a car.'),
(6, 'Mark', 'Zukerberg', 230328, 'markz@gmail.com', 'I want to buy a car.'),
(7, 'geogre', 'Claude', 28374987, 'claude@gmail.com', 'Je suis claude.');

-- --------------------------------------------------------

--
-- Structure de la table `essai`
--

DROP TABLE IF EXISTS `essai`;
CREATE TABLE IF NOT EXISTS `essai` (
  `ID_demande` int NOT NULL AUTO_INCREMENT,
  `Modele` varchar(50) NOT NULL,
  `Utilisateur` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Date_demande` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `statut` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'En attente',
  PRIMARY KEY (`ID_demande`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `essai`
--

INSERT INTO `essai` (`ID_demande`, `Modele`, `Utilisateur`, `Date_demande`, `Heure`, `statut`) VALUES
(1, 'GTR', 'Vandam', '2024-12-12', '12:12:00', 'Terminé'),
(4, 'M8', 'Jackie', '2024-04-26', '17:30:00', 'Confirmé'),
(5, 'MUSTANG', 'Jackie', '2024-04-27', '20:30:00', 'Confirmé'),
(8, 'MUSTANG', 'Vandam', '2024-05-12', '10:33:00', 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `txt` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `titre`, `txt`, `img`, `debut`, `fin`) VALUES
(1, 'Porte ouverte pour les Fan de BMW', 'Supercar organise une journée porte ouverte pour tous ceux qui aiment la marque BMW.', 'event-1.jpg', '2024-04-20', '2024-05-12'),
(2, 'titre 2', 'description 2', 'event-2.png', '2024-03-21', '2024-08-29'),
(3, 'titre 3', 'description 3', 'event-3.jpg', '2024-08-05', '2024-12-26'),
(4, 'titre 4', 'description 4', 'event-4.jpg', '2024-05-01', '2024-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `register`
--

INSERT INTO `register` (`id`, `username`, `email`, `password`) VALUES
(1, 'Jackiechan1', 'chan@gmail.com', 'chan12345'),
(11, 'Mustang', 'moust@gmail.com', 'ilovecars');

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `Immatriculation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Marque` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Modele` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `places` int NOT NULL,
  `poidvide` int NOT NULL,
  `longueur` int NOT NULL,
  `largeur` int NOT NULL,
  `hauteur` int NOT NULL,
  `vmax` int NOT NULL,
  `prix` float NOT NULL,
  `Carburant` varchar(50) DEFAULT NULL,
  `reservoir` int NOT NULL,
  `titre` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`Immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`Immatriculation`, `Marque`, `Modele`, `places`, `poidvide`, `longueur`, `largeur`, `hauteur`, `vmax`, `prix`, `Carburant`, `reservoir`, `titre`, `img`) VALUES
('BMW-M3', 'BMW', 'M3', 4, 1800, 1400, 1200, 900, 100, 98000, 'essence', 87, 'BMW M3', '/supercar/img/BMW/m3.png'),
('BMW-M4', 'BMW', 'M4', 4, 1800, 1400, 1200, 900, 100, 100000, 'essence', 87, 'BMW M4', '/supercar/img/BMW/m44.png'),
('BMW-M8', 'BMW', 'M8', 5, 1800, 1400, 1200, 900, 100, 102000, 'essence', 87, 'BMW M8', '/supercar/img/BMW/m8bg.png'),
('BMW-X6M', 'BMW', 'X6M', 4, 1800, 1400, 1200, 900, 100, 101000, 'essence', 87, 'BMW X6M', '/supercar/img/BMW/m44.png'),
('FORD-FIESTA', 'FORD', 'FIESTA', 5, 1800, 1400, 1200, 900, 100, 45000, 'essence', 87, 'FORD FIESTA', '/supercar/img/ford/fiesta-bn-2.png'),
('FORD-GT', 'FORD', 'GT', 2, 1800, 1400, 1200, 900, 100, 120000, 'essence', 87, 'FORD GT', '/supercar/img/ford/HOR_XB1_Ford_GT_17.webp'),
('FORD-MUSTANG', 'FORD', 'MUSTANG', 4, 1800, 1400, 1200, 900, 100, 120000, 'essence', 87, 'FORD MUSTANG', '/supercar/img/ford/MOT_XB1_Ford_Mustang_15.webp'),
('FORD-RAPTOR', 'FORD', 'RAPTOR', 5, 1800, 1400, 1200, 900, 100, 63000, 'diesel ', 87, 'FORD RAPTOR', '/supercar/img/ford/raptor-bn.png'),
('NISSAN-GTR', 'NISSAN', 'GT-R', 3, 1800, 1400, 1200, 900, 100, 107000, 'essence', 87, 'NISSAN GT-R', '/supercar/img/nissan/nissan-tr.png'),
('NISSAN-JESKO', 'NISSAN', 'JESKO', 5, 1800, 1400, 1200, 900, 100, 64000, 'essence', 87, 'NISSAN JESKO', '/supercar/img/nissan/juke-re.png'),
('NISSAN-NAVARA', 'NISSAN', 'NAVARA', 5, 1800, 1400, 1200, 900, 100, 75000, 'essence', 87, 'NISSAN NAVARA', '/supercar/img/nissan/navara-ar'),
('NISSAN-Z', 'NISSAN', 'Z', 2, 1800, 1400, 1200, 900, 100, 110000, 'essence', 87, 'NISSAN Z', '/supercar/img/nissan/nissanz-ar.png'),
('PORSCHE-718', 'PORSCHE', '718', 2, 1800, 1400, 1200, 900, 100, 130000, 'essence', 87, 'PORSCHE 718', '\\supercar\\img\\Porsche\\718 Spyder RS.jpg'),
('PORSCHE-911', 'PORSCHE', '911', 2, 1800, 1400, 1200, 900, 100, 135000, 'essence', 87, 'PORSCHE 911', '\\supercar\\img\\Porsche\\Porsche 911.jpg'),
('PORSCHE-CAYENNE', 'PORSCHE', 'CAYENNE', 4, 1800, 1400, 1200, 900, 100, 132000, 'essence', 87, 'PORSCHE CAYENNE', '\\supercar\\img\\Porsche\\Cayenne S.jpg'),
('PORSCHE-TAYCAN', 'PORSCHE', 'TAYCAN', 5, 1800, 0, 1200, 900, 100, 120000, 'essence', 87, 'PORSCHE TAYCAN', '/supercar/img/Porsche/Taycan Turbo S');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
