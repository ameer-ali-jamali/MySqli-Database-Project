-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 04, 2023 at 02:02 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5th_week`
--

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `player_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatar_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`player_id`, `username`, `avatar_image`) VALUES
(1, 'john_doe', 'avatar_john.jpg'),
(2, 'alice_smith', 'avatar_alice.jpg'),
(3, 'bob_jones', 'avatar_bob.jpg'),
(4, 'emily_wilson', 'avatar_emily.jpg'),
(5, 'michael_davis', 'avatar_michael.jpg'),
(6, 'sarah_parker', 'avatar_sarah.jpg'),
(7, 'kevin_martin', 'avatar_kevin.jpg'),
(8, 'linda_adams', 'avatar_linda.jpg'),
(9, 'james_wilson', 'avatar_james.jpg'),
(10, 'amy_thompson', 'avatar_amy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `QuestParticipation`
--

CREATE TABLE `QuestParticipation` (
  `participation_id` int(11) NOT NULL,
  `quest_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `items_collected` text,
  `points_scored` int(11) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `QuestParticipation`
--

INSERT INTO `QuestParticipation` (`participation_id`, `quest_id`, `player_id`, `items_collected`, `points_scored`, `time_taken`) VALUES
(1, 1, 1, 'Sword, Shield', 120, '2 hours'),
(2, 2, 2, 'Health Potion, Bow', 95, '1.5 hours'),
(3, 1, 3, 'Magic Staff', 50, '45 minutes'),
(4, 3, 4, 'Gold Coins', 200, '3 hours'),
(5, 2, 5, 'Sword, Armor', 75, '1 hour'),
(6, 1, 6, 'Map, Compass', 80, '1.25 hours'),
(7, 3, 7, 'Scroll of Wisdom', 150, '2.25 hours'),
(8, 2, 8, 'Helmet', 60, '1.75 hours'),
(9, 3, 9, 'Treasure Chest', 300, '4 hours'),
(10, 1, 10, 'Diamond Ring', 120, '2.5 hours');

-- --------------------------------------------------------

--
-- Table structure for table `Quests`
--

CREATE TABLE `Quests` (
  `quest_id` int(11) NOT NULL,
  `quest_name` varchar(255) NOT NULL,
  `description` text,
  `min_player_level` int(11) DEFAULT NULL,
  `max_player_level` int(11) DEFAULT NULL,
  `quest_location_coordinates` varchar(255) DEFAULT NULL,
  `quest_location_zone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Quests`
--

INSERT INTO `Quests` (`quest_id`, `quest_name`, `description`, `min_player_level`, `max_player_level`, `quest_location_coordinates`, `quest_location_zone`) VALUES
(1, 'Explore the Forest', 'Search for hidden treasures in the enchanted forest', 1, 5, '45.123,-78.456', 'Forest'),
(2, 'Rescue the Princess', 'Embark on a quest to rescue the captured princess', 3, 7, '38.987,-82.345', 'Castle'),
(3, 'Defeat the Dragon', 'Slay the mighty dragon terrorizing the kingdom', 5, 10, '55.678,-72.789', 'Mountains'),
(4, 'Retrieve the Lost Relic', 'Recover a lost relic from the ancient temple ruins', 2, 8, '35.678,-82.789', 'Ruins'),
(5, 'Hunt for the Yeti', 'Track down the elusive Yeti in the snowy wilderness', 4, 9, '60.123,-90.456', 'Snowy Mountains'),
(6, 'Journey to the Underworld', 'Venture into the underworld to find a lost artifact', 6, 12, '22.345,-66.789', 'Underworld'),
(7, 'Search for Atlantis', 'Embark on an expedition to uncover the lost city of Atlantis', 8, 14, '12.987,-74.345', 'Ocean'),
(8, 'The Labyrinth Challenge', 'Navigate through a labyrinth filled with puzzles and traps', 3, 7, '40.678,-85.789', 'Labyrinth'),
(9, 'The Dark Forest', 'Survive the haunted forest filled with supernatural creatures', 7, 11, '49.123,-70.456', 'Dark Forest'),
(10, 'Pirates Treasure Hunt', 'Sail the high seas in search of buried pirate treasure', 4, 10, '58.345,-92.789', 'Pirate Island');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Players`
--
ALTER TABLE `Players`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `QuestParticipation`
--
ALTER TABLE `QuestParticipation`
  ADD PRIMARY KEY (`participation_id`),
  ADD KEY `quest_id` (`quest_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `Quests`
--
ALTER TABLE `Quests`
  ADD PRIMARY KEY (`quest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Players`
--
ALTER TABLE `Players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `QuestParticipation`
--
ALTER TABLE `QuestParticipation`
  MODIFY `participation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Quests`
--
ALTER TABLE `Quests`
  MODIFY `quest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `QuestParticipation`
--
ALTER TABLE `QuestParticipation`
  ADD CONSTRAINT `questparticipation_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`quest_id`),
  ADD CONSTRAINT `questparticipation_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
