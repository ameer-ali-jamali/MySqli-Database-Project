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
-- Database: `1st_week`
--

-- --------------------------------------------------------

--
-- Table structure for table `CombatLogs`
--

CREATE TABLE `CombatLogs` (
  `combat_log_id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `enemy_id` int(11) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `outcome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CombatLogs`
--

INSERT INTO `CombatLogs` (`combat_log_id`, `player_id`, `enemy_id`, `action_type`, `outcome`) VALUES
(1, 1, 3, 'Attack', 'Victory'),
(2, 2, 3, 'Spellcast', 'Victory'),
(3, 3, 3, 'Heal', 'Defeat'),
(4, 4, 3, 'Attack', 'Victory'),
(5, 5, 3, 'Spellcast', 'Victory');

-- --------------------------------------------------------

--
-- Table structure for table `Currency`
--

CREATE TABLE `Currency` (
  `player_id` int(11) NOT NULL,
  `gold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Currency`
--

INSERT INTO `Currency` (`player_id`, `gold`) VALUES
(1, 500),
(2, 750),
(3, 1000),
(4, 300),
(5, 450);

-- --------------------------------------------------------

--
-- Table structure for table `GuildMembers`
--

CREATE TABLE `GuildMembers` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GuildMembers`
--

INSERT INTO `GuildMembers` (`player_id`, `guild_id`) VALUES
(1, 1),
(4, 1),
(2, 2),
(3, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Guilds`
--

CREATE TABLE `Guilds` (
  `guild_id` int(11) NOT NULL,
  `guild_name` varchar(255) NOT NULL,
  `guild_leader_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Guilds`
--

INSERT INTO `Guilds` (`guild_id`, `guild_name`, `guild_leader_id`) VALUES
(1, 'Warriors of Valor', 1),
(2, 'Mages Guild', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Inventory`
--

INSERT INTO `Inventory` (`player_id`, `item_id`, `quantity`) VALUES
(1, 1, 1),
(2, 2, 5),
(3, 3, 1),
(4, 1, 2),
(5, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  `item_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`item_id`, `item_name`, `item_type`, `item_value`) VALUES
(1, 'Sword', 'Weapon', 50),
(2, 'Healing Potion', 'Consumable', 20),
(3, 'Dragon Scale Armor', 'Armor', 200);

-- --------------------------------------------------------

--
-- Table structure for table `NPCs`
--

CREATE TABLE `NPCs` (
  `npc_id` int(11) NOT NULL,
  `npc_name` varchar(255) NOT NULL,
  `npc_role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `NPCs`
--

INSERT INTO `NPCs` (`npc_id`, `npc_name`, `npc_role`) VALUES
(1, 'Blacksmith', 'Shopkeeper'),
(2, 'Guild Master', 'Quest Giver'),
(3, 'Dragon', 'Boss Enemy');

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `player_class` varchar(50) DEFAULT NULL,
  `starting_region_id` int(11) DEFAULT NULL,
  `experience_points` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`player_id`, `player_name`, `player_class`, `starting_region_id`, `experience_points`) VALUES
(1, 'Adventurer1', 'Warrior', 1, 1000),
(2, 'Adventurer2', 'Mage', 2, 750),
(3, 'Adventurer3', 'Healer', 3, 850),
(4, 'Adventurer4', 'Warrior', 1, 1200),
(5, 'Adventurer5', 'Mage', 2, 600);

-- --------------------------------------------------------

--
-- Table structure for table `Quests`
--

CREATE TABLE `Quests` (
  `quest_id` int(11) NOT NULL,
  `quest_name` varchar(255) NOT NULL,
  `quest_description` text,
  `quest_difficulty` int(11) DEFAULT NULL,
  `quest_reward` varchar(100) DEFAULT NULL,
  `quest_giver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Quests`
--

INSERT INTO `Quests` (`quest_id`, `quest_name`, `quest_description`, `quest_difficulty`, `quest_reward`, `quest_giver_id`) VALUES
(1, 'Collect Herbs', 'Gather herbs for healing potions.', 1, 'Healing Potion x5', 2),
(2, 'Defeat the Dragon', 'Conquer the fiery beast!', 5, 'Dragon Scale Armor', 3),
(3, 'Explore the Mystic Isles', 'Discover the secrets of the archipelago.', 3, 'Mystic Wand', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Regions`
--

CREATE TABLE `Regions` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) NOT NULL,
  `region_description` text,
  `ruler_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Regions`
--

INSERT INTO `Regions` (`region_id`, `region_name`, `region_description`, `ruler_name`) VALUES
(1, 'Forest of Elders', 'A dense forest with ancient trees.', 'King Elendil'),
(2, 'Volcanic Mountains', 'A treacherous, fiery landscape.', 'Queen Alysia'),
(3, 'Mystic Isles', 'An archipelago of magical wonders.', 'High Mage Seraphina');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CombatLogs`
--
ALTER TABLE `CombatLogs`
  ADD PRIMARY KEY (`combat_log_id`);

--
-- Indexes for table `Currency`
--
ALTER TABLE `Currency`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `GuildMembers`
--
ALTER TABLE `GuildMembers`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `Guilds`
--
ALTER TABLE `Guilds`
  ADD PRIMARY KEY (`guild_id`),
  ADD KEY `guild_leader_id` (`guild_leader_id`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`player_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `NPCs`
--
ALTER TABLE `NPCs`
  ADD PRIMARY KEY (`npc_id`);

--
-- Indexes for table `Players`
--
ALTER TABLE `Players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `starting_region_id` (`starting_region_id`);

--
-- Indexes for table `Quests`
--
ALTER TABLE `Quests`
  ADD PRIMARY KEY (`quest_id`),
  ADD KEY `quest_giver_id` (`quest_giver_id`);

--
-- Indexes for table `Regions`
--
ALTER TABLE `Regions`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `region_name` (`region_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CombatLogs`
--
ALTER TABLE `CombatLogs`
  MODIFY `combat_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Guilds`
--
ALTER TABLE `Guilds`
  MODIFY `guild_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `NPCs`
--
ALTER TABLE `NPCs`
  MODIFY `npc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Players`
--
ALTER TABLE `Players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Quests`
--
ALTER TABLE `Quests`
  MODIFY `quest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Regions`
--
ALTER TABLE `Regions`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Currency`
--
ALTER TABLE `Currency`
  ADD CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`);

--
-- Constraints for table `GuildMembers`
--
ALTER TABLE `GuildMembers`
  ADD CONSTRAINT `guildmembers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`),
  ADD CONSTRAINT `guildmembers_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `Guilds` (`guild_id`);

--
-- Constraints for table `Guilds`
--
ALTER TABLE `Guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`guild_leader_id`) REFERENCES `Players` (`player_id`);

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Items` (`item_id`);

--
-- Constraints for table `Players`
--
ALTER TABLE `Players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`starting_region_id`) REFERENCES `Regions` (`region_id`);

--
-- Constraints for table `Quests`
--
ALTER TABLE `Quests`
  ADD CONSTRAINT `quests_ibfk_1` FOREIGN KEY (`quest_giver_id`) REFERENCES `NPCs` (`npc_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
