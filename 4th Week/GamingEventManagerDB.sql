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
-- Database: `4th_week`
--

-- --------------------------------------------------------

--
-- Table structure for table `ChatGroupMembers`
--

CREATE TABLE `ChatGroupMembers` (
  `membership_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `chat_group_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ChatGroupMembers`
--

INSERT INTO `ChatGroupMembers` (`membership_id`, `player_id`, `chat_group_id`, `joined_at`) VALUES
(1, 1, 1, '2023-10-04 13:18:41'),
(2, 2, 1, '2023-10-04 13:18:41'),
(3, 2, 2, '2023-10-04 13:18:41'),
(4, 3, 3, '2023-10-04 13:18:41'),
(5, 4, 4, '2023-10-04 13:18:41'),
(6, 5, 5, '2023-10-04 13:18:41'),
(7, 6, 6, '2023-10-04 13:18:41'),
(8, 7, 7, '2023-10-04 13:18:41'),
(9, 8, 8, '2023-10-04 13:18:41'),
(10, 9, 9, '2023-10-04 13:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `ChatGroups`
--

CREATE TABLE `ChatGroups` (
  `chat_group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ChatGroups`
--

INSERT INTO `ChatGroups` (`chat_group_id`, `group_name`, `created_by`, `created_at`) VALUES
(1, 'Team A Chat', 1, '2023-10-04 13:18:41'),
(2, 'Project Discussion', 2, '2023-10-04 13:18:41'),
(3, 'Game Enthusiasts', 3, '2023-10-04 13:18:41'),
(4, 'Study Buddies', 4, '2023-10-04 13:18:41'),
(5, 'General Chat', 5, '2023-10-04 13:18:41'),
(6, 'Gaming Clan', 6, '2023-10-04 13:18:41'),
(7, 'Tech Geeks', 7, '2023-10-04 13:18:41'),
(8, 'Artists Hangout', 8, '2023-10-04 13:18:41'),
(9, 'Music Lovers', 9, '2023-10-04 13:18:41'),
(10, 'Book Club', 10, '2023-10-04 13:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `MentionedUsers`
--

CREATE TABLE `MentionedUsers` (
  `mention_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `mentioned_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MentionedUsers`
--

INSERT INTO `MentionedUsers` (`mention_id`, `message_id`, `mentioned_user_id`) VALUES
(1, 1, 2),
(2, 3, 5),
(3, 4, 1),
(4, 7, 8),
(5, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE `Messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `chat_group_id` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Messages`
--

INSERT INTO `Messages` (`message_id`, `sender_id`, `chat_group_id`, `message_text`, `created_at`) VALUES
(1, 1, 1, 'Hello, everyone!', '2023-10-04 13:18:41'),
(2, 2, 1, 'Good to be here.', '2023-10-04 13:18:41'),
(3, 3, 2, 'Let\'s discuss our project progress.', '2023-10-04 13:18:41'),
(4, 4, 2, 'I have some new ideas to share.', '2023-10-04 13:18:41'),
(5, 5, 3, 'Who wants to play a game tonight?', '2023-10-04 13:18:41'),
(6, 6, 3, 'I\'m in!', '2023-10-04 13:18:41'),
(7, 7, 4, 'Let\'s prepare for the upcoming exams together.', '2023-10-04 13:18:41'),
(8, 8, 4, 'I have some study materials to share.', '2023-10-04 13:18:41'),
(9, 9, 5, 'Any book recommendations?', '2023-10-04 13:18:41'),
(10, 10, 5, 'I\'m reading \"The Great Gatsby.\"', '2023-10-04 13:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `player_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`player_id`, `username`) VALUES
(9, 'david_thompson'),
(4, 'emily_wilson'),
(10, 'emma_hall'),
(2, 'jane_smith'),
(1, 'john_doe'),
(7, 'michael_johnson'),
(6, 'olivia_anderson'),
(3, 'robert_jackson'),
(8, 'sophia_martinez'),
(5, 'william_davis');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ChatGroupMembers`
--
ALTER TABLE `ChatGroupMembers`
  ADD PRIMARY KEY (`membership_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `chat_group_id` (`chat_group_id`);

--
-- Indexes for table `ChatGroups`
--
ALTER TABLE `ChatGroups`
  ADD PRIMARY KEY (`chat_group_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `MentionedUsers`
--
ALTER TABLE `MentionedUsers`
  ADD PRIMARY KEY (`mention_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `mentioned_user_id` (`mentioned_user_id`);

--
-- Indexes for table `Messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `chat_group_id` (`chat_group_id`);

--
-- Indexes for table `Players`
--
ALTER TABLE `Players`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ChatGroupMembers`
--
ALTER TABLE `ChatGroupMembers`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ChatGroups`
--
ALTER TABLE `ChatGroups`
  MODIFY `chat_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `MentionedUsers`
--
ALTER TABLE `MentionedUsers`
  MODIFY `mention_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Messages`
--
ALTER TABLE `Messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Players`
--
ALTER TABLE `Players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ChatGroupMembers`
--
ALTER TABLE `ChatGroupMembers`
  ADD CONSTRAINT `chatgroupmembers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`),
  ADD CONSTRAINT `chatgroupmembers_ibfk_2` FOREIGN KEY (`chat_group_id`) REFERENCES `ChatGroups` (`chat_group_id`);

--
-- Constraints for table `ChatGroups`
--
ALTER TABLE `ChatGroups`
  ADD CONSTRAINT `chatgroups_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `Players` (`player_id`);

--
-- Constraints for table `MentionedUsers`
--
ALTER TABLE `MentionedUsers`
  ADD CONSTRAINT `mentionedusers_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `Messages` (`message_id`),
  ADD CONSTRAINT `mentionedusers_ibfk_2` FOREIGN KEY (`mentioned_user_id`) REFERENCES `Players` (`player_id`);

--
-- Constraints for table `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `Players` (`player_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`chat_group_id`) REFERENCES `ChatGroups` (`chat_group_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
