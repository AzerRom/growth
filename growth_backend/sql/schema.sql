ECHO ist eingeschaltet (ON).
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 24. Jan 2025 um 03:27
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `growth`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL,
  `PROJECT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `COMMENT_TEXT` text NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projects`
--

CREATE TABLE `projects` (
  `PROJECT_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PROJECT_NAME` varchar(100) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `ADDED` datetime DEFAULT current_timestamp(),
  `DEADLINE` datetime DEFAULT NULL,
  `IS_PRIVATE` tinyint(1) DEFAULT NULL,
  `PRIORITY` enum('HIGH','MEDIUM','LOW') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `project_members`
--

CREATE TABLE `project_members` (
  `ID` int(11) NOT NULL,
  `PROJECT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ADDED_AT` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `AGE` int(11) DEFAULT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `ROLE` enum('ADMIN','USER') DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_COMMENTS_PROJECT_ID` (`PROJECT_ID`),
  ADD KEY `FK_COMMENTS_USER_ID` (`USER_ID`);

--
-- Indizes für die Tabelle `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`PROJECT_ID`),
  ADD KEY `FK_AUTHOR_ID` (`AUTHOR_ID`);

--
-- Indizes für die Tabelle `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PROJECT_ID` (`PROJECT_ID`),
  ADD KEY `FK_USER_ID` (`USER_ID`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `projects`
--
ALTER TABLE `projects`
  MODIFY `PROJECT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `project_members`
--
ALTER TABLE `project_members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_COMMENTS_PROJECT_ID` FOREIGN KEY (`PROJECT_ID`) REFERENCES `projects` (`PROJECT_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_COMMENTS_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `FK_AUTHOR_ID` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `FK_PROJECT_ID` FOREIGN KEY (`PROJECT_ID`) REFERENCES `projects` (`PROJECT_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
