-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 27. 10:16
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazás`
--
CREATE DATABASE IF NOT EXISTS `utazás` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `utazás`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jármű`
--

DROP TABLE IF EXISTS `jármű`;
CREATE TABLE IF NOT EXISTS `jármű` (
  `járműAzon` int(11) NOT NULL AUTO_INCREMENT,
  `típus` varchar(20) NOT NULL,
  `városAzon` int(11) NOT NULL,
  PRIMARY KEY (`járműAzon`),
  UNIQUE KEY `városAzon` (`városAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jármű`
--

INSERT INTO `jármű` (`járműAzon`, `típus`, `városAzon`) VALUES
(1, 'busz', 1),
(2, 'busz', 2),
(3, 'kamion', 3),
(4, 'villamos', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofőr`
--

DROP TABLE IF EXISTS `sofőr`;
CREATE TABLE IF NOT EXISTS `sofőr` (
  `sofőrAzon` int(11) NOT NULL AUTO_INCREMENT,
  `vezetékNév` varchar(30) NOT NULL,
  `keresztNév` varchar(30) NOT NULL,
  `járműAzon` int(11) NOT NULL,
  PRIMARY KEY (`sofőrAzon`),
  UNIQUE KEY `járműAzon` (`járműAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `sofőr`
--

INSERT INTO `sofőr` (`sofőrAzon`, `vezetékNév`, `keresztNév`, `járműAzon`) VALUES
(1, 'Tibor', 'Gáspár', 1),
(2, 'Zatrár', 'Zoltán', 2),
(3, 'Kapolta', 'Ilona', 3),
(4, 'Tuba', 'Niki', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `város`
--

DROP TABLE IF EXISTS `város`;
CREATE TABLE IF NOT EXISTS `város` (
  `városAzon` int(11) NOT NULL AUTO_INCREMENT,
  `név` varchar(150) NOT NULL,
  PRIMARY KEY (`városAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `város`
--

INSERT INTO `város` (`városAzon`, `név`) VALUES
(1, 'Szeged'),
(2, 'Kaposvár'),
(3, 'Sümeg'),
(4, 'Temesvar');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jármű`
--
ALTER TABLE `jármű`
  ADD CONSTRAINT `jármű_ibfk_1` FOREIGN KEY (`városAzon`) REFERENCES `város` (`városAzon`);

--
-- Megkötések a táblához `sofőr`
--
ALTER TABLE `sofőr`
  ADD CONSTRAINT `sofőr_ibfk_1` FOREIGN KEY (`járműAzon`) REFERENCES `jármű` (`járműAzon`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
