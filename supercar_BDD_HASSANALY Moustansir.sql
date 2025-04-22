-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 22 avr. 2025 à 07:16
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

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

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `inscription_client`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscription_client` (IN `p_utilisateur` VARCHAR(8), IN `p_nom` VARCHAR(25), IN `p_prenom` VARCHAR(25), IN `p_email` VARCHAR(50), IN `p_tel` INT, IN `p_mdp` VARCHAR(50), OUT `p_resultat` VARCHAR(200))   BEGIN
    DECLARE username_exists INT DEFAULT 0;
    DECLARE email_exists INT DEFAULT 0;
    
    -- Vérifier si le nom d'utilisateur existe déjà
    SELECT COUNT(*) INTO username_exists 
    FROM client_inscrit 
    WHERE Utilisateur = p_utilisateur;
    
    -- Vérifier si l'email existe déjà
    SELECT COUNT(*) INTO email_exists 
    FROM client_inscrit 
    WHERE Email = p_email;
    
    IF username_exists > 0 THEN
        SET p_resultat = 'ERREUR:Ce nom d\'utilisateur est déjà pris';
    ELSEIF email_exists > 0 THEN
        SET p_resultat = 'ERREUR:Cet email est déjà enregistré';
    ELSE
        -- Hachage du mot de passe et insertion
        INSERT INTO client_inscrit (
            Utilisateur, Nom, Prenom, Email, Tel, Mdp
        ) VALUES (
            p_utilisateur, p_nom, p_prenom, p_email, p_tel, SHA1(p_mdp)
        );
        
        SET p_resultat = CONCAT('SUCCES:Inscription réussie. ID:', LAST_INSERT_ID());
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `accueil`
--

DROP TABLE IF EXISTS `accueil`;
CREATE TABLE IF NOT EXISTS `accueil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `txt` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vid` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `align` enum('left','center','right') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'left',
  `color` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'white',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `accueil`
--

INSERT INTO `accueil` (`id`, `titre`, `txt`, `img`, `vid`, `align`, `color`) VALUES
(0, '', '', '', 'ar-vid-blur.mp4', '', ''),
(1, 'Bienvenue', 'Bienvenue chez SuperCar, votre partenaire de confiance pour des véhicules d\'exception. Nous sommes fiers de présenter une sélection impressionnante de voitures de qualité qui répondent aux normes les plus élevées de performance, de sécurité et de style.', 'gtr-inte.webp', '', 'left', 'blue'),
(2, 'Nous proposons 4 marques', 'Supercar propose 4 marques: NISSAN, FORD, BMD et PORSCHE.', 'm8.jpg', '', 'right', 'aqua'),
(3, 'Qui sommes-nous ?', 'Supercar est né de la passion pour les voitures de prestige. Nous avons pour mission de proposer des véhicules de qualité, avec des services personnalisés et une expertise unique. Notre équipe est composée de spécialistes de l’automobile qui vous accompagnent dans le choix de votre véhicule idéal.', 'techjuke.jpg', '', 'left', 'teal'),
(4, 'Explorez notre galerie', 'Parcourez notre galerie pour découvrir des images de nos véhicules et de nos événements passés. Laissez-vous inspirer par les lignes et les détails de chaque modèle. Chez Supercar, chaque voiture est une œuvre d\'art que nous sommes fiers de partager avec vous.', '911.jpg', '', 'right', 'black');

-- --------------------------------------------------------

--
-- Structure de la table `auth_log`
--

DROP TABLE IF EXISTS `auth_log`;
CREATE TABLE IF NOT EXISTS `auth_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `login_date` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_log`
--

INSERT INTO `auth_log` (`log_id`, `user_id`, `username`, `login_date`) VALUES
(1, 14, 'bot', '2025-04-15 12:20:36'),
(2, 14, 'bot', '2025-04-16 18:34:14'),
(3, 14, 'bot', '2025-04-17 22:43:23');

-- --------------------------------------------------------

--
-- Structure de la table `client_inscrit`
--

DROP TABLE IF EXISTS `client_inscrit`;
CREATE TABLE IF NOT EXISTS `client_inscrit` (
  `ID_client` int NOT NULL AUTO_INCREMENT,
  `Utilisateur` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nom` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Prenom` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Tel` int DEFAULT NULL,
  `Mdp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client_inscrit`
--

INSERT INTO `client_inscrit` (`ID_client`, `Utilisateur`, `Nom`, `Prenom`, `Email`, `Tel`, `Mdp`) VALUES
(1, 'Vandam', 'Jean', 'Claude', 'vandam@gmail.com', 230328, 'jean1234'),
(5, 'Chan', 'Jackie', 'Chan', 'jackiechan@gmail.com', 230328, '12345'),
(12, 'gase', 'Jackie', 'sung', 'hhj@gmail.com', 28374987, 'c5bf06435350f5a3cef8781a2110b01e0d24a469'),
(15, 'Bot', 'Test', 'User', 'bot@gmail.com', 0, '8cb2237d0679ca88db6464eac60da96345513964');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `ID_contact` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Prenom` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Tel` int NOT NULL,
  `Mail` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Message` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Modele` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Utilisateur` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date_demande` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `statut` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'En attente',
  `demandetemp` datetime NOT NULL,
  PRIMARY KEY (`ID_demande`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `essai`
--

INSERT INTO `essai` (`ID_demande`, `Modele`, `Utilisateur`, `Date_demande`, `Heure`, `statut`, `demandetemp`) VALUES
(14, 'M3', 'Bot', '2024-11-28', '15:36:00', 'Confirmé', '0000-00-00 00:00:00'),
(15, 'GT-R', 'Bot', '2024-11-29', '22:24:00', 'Terminé', '2024-11-27 21:24:47'),
(16, 'M8', 'Mtagna', '2024-12-19', '20:25:00', 'Annulé', '2024-12-04 15:25:40'),
(17, 'RAPTOR', 'Bot', '2025-03-13', '14:30:00', 'En attente', '2025-03-10 10:34:28'),
(23, 'RAPTOR', 'Bot', '2025-03-22', '09:12:00', 'En attente', '2025-03-19 14:57:18'),
(24, '911', 'Bot', '2025-03-30', '12:56:00', 'En attente', '2025-03-19 14:57:18'),
(25, 'Z', 'Bot', '2025-03-29', '15:56:00', 'En attente', '2025-03-19 14:57:18'),
(26, 'GT-R', 'Bot', '2025-03-22', '16:07:00', 'En attente', '2025-03-19 15:01:07'),
(27, 'M8', 'Bot', '2025-03-21', '11:00:00', 'En attente', '2025-03-19 15:01:07'),
(28, 'X6M', 'Bot', '2025-03-27', '18:06:00', 'En attente', '2025-03-19 15:03:20'),
(29, 'GT', 'Bot', '2025-03-27', '15:16:00', 'En attente', '2025-03-19 15:18:24'),
(30, 'M3', 'Bot', '2025-03-27', '17:16:00', 'En attente', '2025-03-19 15:18:24'),
(31, '911', 'Bot', '2025-03-23', '13:00:00', 'En attente', '2025-03-20 08:55:27');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `txt` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `titre`, `txt`, `img`, `debut`, `fin`) VALUES
(1, 'Porte ouverte pour les Fan de BMW', 'Supercar organise une journée porte ouverte pour tous ceux qui aiment la marque BMW.', 'event-1.jpg', '2024-04-20', '2024-05-12'),
(2, 'Journée 4x4', 'Vous aimez les gros bolide, venez dans notre journée 4x4 et découvrez nos meilleurs 4x4.', 'event-2.png', '2024-03-21', '2024-08-29'),
(3, 'Ford and GT', 'Supercar présente: La FORD GT.', 'event-3.jpg', '2024-08-05', '2024-12-26'),
(4, 'Showcase Supercar', 'Vous voulez voir des Super Cars, venez à notre Showcase Supercar.', 'event-4.jpg', '2024-05-01', '2024-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `dercon` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `register`
--

INSERT INTO `register` (`id`, `username`, `email`, `password`, `dercon`) VALUES
(14, 'bot', 'bot@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '2025-04-17');

--
-- Déclencheurs `register`
--
DROP TRIGGER IF EXISTS `log_connection`;
DELIMITER $$
CREATE TRIGGER `log_connection` AFTER UPDATE ON `register` FOR EACH ROW BEGIN
    -- Se déclenche seulement quand dercon est mis à jour
    IF NEW.dercon <> OLD.dercon THEN
        INSERT INTO `auth_log` (`user_id`, `username`, `login_date`)
        VALUES (NEW.id, NEW.username, NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `id_voiture` int NOT NULL AUTO_INCREMENT,
  `imo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Marque` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Modele` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `places` int NOT NULL,
  `poidvide` int NOT NULL,
  `longueur` int NOT NULL,
  `largeur` int NOT NULL,
  `hauteur` int NOT NULL,
  `vmax` int NOT NULL,
  `prix` float NOT NULL,
  `Carburant` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reservoir` int NOT NULL,
  `titre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_voiture`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id_voiture`, `imo`, `Marque`, `Modele`, `places`, `poidvide`, `longueur`, `largeur`, `hauteur`, `vmax`, `prix`, `Carburant`, `reservoir`, `titre`, `img`) VALUES
(1, '', 'BMW', 'M3', 4, 1800, 1400, 1200, 900, 100, 98000, 'essence', 87, 'BMW M3', 'm3.png'),
(2, '', 'BMW', 'M4', 4, 1800, 1400, 1200, 900, 100, 100000, 'essence', 87, 'BMW M4', 'm44.png'),
(3, '', 'BMW', 'M8', 5, 1800, 1400, 1200, 900, 100, 102000, 'essence', 87, 'BMW M8', 'm8bg.png'),
(4, '', 'BMW', 'X6M', 4, 1800, 1400, 1200, 900, 100, 101000, 'essence', 87, 'BMW X6M', 'BMW_X6M.webp'),
(5, '', 'FORD', 'FIESTA', 5, 1800, 1400, 1200, 900, 100, 45000, 'essence', 87, 'FORD FIESTA', 'fiesta-bn-2.png'),
(6, '', 'FORD', 'GT', 2, 1800, 1400, 1200, 900, 100, 120000, 'essence', 87, 'FORD GT', 'HOR_XB1_Ford_GT_17.webp'),
(7, '', 'FORD', 'MUSTANG', 4, 1800, 1400, 1200, 900, 100, 120000, 'essence', 87, 'FORD MUSTANG', 'ford-must-1.png'),
(8, '', 'FORD', 'RAPTOR', 5, 1800, 1400, 1200, 900, 100, 63000, 'diesel ', 87, 'FORD RAPTOR', 'raptor-bn.png'),
(9, '', 'NISSAN', 'GT-R', 3, 1800, 1400, 1200, 900, 100, 107000, 'essence', 87, 'NISSAN GT-R', 'nissan-tr.png'),
(10, '', 'NISSAN', 'JESKO', 5, 1800, 1400, 1200, 900, 100, 64000, 'essence', 87, 'NISSAN JESKO', 'juke-re.png'),
(11, '', 'NISSAN', 'NAVARA', 5, 1800, 1400, 1200, 900, 100, 75000, 'essence', 87, 'NISSAN NAVARA', 'navara-ar.png'),
(12, '', 'NISSAN', 'Z', 2, 1800, 1400, 1200, 900, 100, 110000, 'essence', 87, 'NISSAN Z', 'nissanz-ar.png'),
(13, '', 'PORSCHE', '718', 2, 1800, 1400, 1200, 900, 100, 130000, 'essence', 87, 'PORSCHE 718', '718 Spyder RS.jpg'),
(14, '', 'PORSCHE', '911', 2, 1800, 1400, 1200, 900, 100, 135000, 'essence', 87, 'PORSCHE 911', '911.jpg'),
(15, '', 'PORSCHE', 'CAYENNE', 4, 1800, 1400, 1200, 900, 100, 132000, 'essence', 87, 'PORSCHE CAYENNE', 'Cayenne S.jpg'),
(16, '', 'PORSCHE', 'TAYCAN', 5, 1800, 0, 1200, 900, 100, 120000, 'essence', 87, 'PORSCHE TAYCAN', 'porsche taycan.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
