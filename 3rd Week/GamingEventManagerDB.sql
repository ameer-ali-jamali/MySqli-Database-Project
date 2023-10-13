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
-- Database: `3rd_week`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `message_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`message_id`, `session_id`, `sender_id`, `message_text`, `created_at`) VALUES
(1, 1, 1, 'Hello, everyone!', '2023-10-04 13:14:58'),
(2, 1, 2, 'Good to see you all here.', '2023-10-04 13:14:58'),
(3, 2, 3, 'Let\'s discuss the project updates.', '2023-10-04 13:14:58'),
(4, 2, 4, 'I have some new ideas to share.', '2023-10-04 13:14:58'),
(5, 3, 5, 'Who\'s up for a game night this weekend?', '2023-10-04 13:14:58'),
(6, 3, 6, 'Count me in!', '2023-10-04 13:14:58'),
(7, 4, 7, 'We need to prepare for the upcoming exams.', '2023-10-04 13:14:58'),
(8, 4, 8, 'I can help with study materials.', '2023-10-04 13:14:58'),
(9, 5, 9, 'Any recommendations for a good book?', '2023-10-04 13:14:58'),
(10, 5, 10, 'I\'m reading \"The Great Gatsby.\"', '2023-10-04 13:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `session_id` int(11) NOT NULL,
  `session_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_sessions`
--

INSERT INTO `chat_sessions` (`session_id`, `session_name`, `created_by`, `created_at`) VALUES
(1, 'Team A Meeting', 1, '2023-10-04 13:14:58'),
(2, 'Project Discussion', 2, '2023-10-04 13:14:58'),
(3, 'Game Planning', 3, '2023-10-04 13:14:58'),
(4, 'Study Group', 4, '2023-10-04 13:14:58'),
(5, 'General Chat', 5, '2023-10-04 13:14:58'),
(6, 'Gaming Night', 6, '2023-10-04 13:14:58'),
(7, 'Tech Talk', 7, '2023-10-04 13:14:58'),
(8, 'Artists Corner', 8, '2023-10-04 13:14:58'),
(9, 'Music Lovers', 9, '2023-10-04 13:14:58'),
(10, 'Book Club', 10, '2023-10-04 13:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `mentions`
--

CREATE TABLE `mentions` (
  `mention_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `mentioned_player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mentions`
--

INSERT INTO `mentions` (`mention_id`, `message_id`, `mentioned_player_id`) VALUES
(1, 1, 2),
(2, 3, 5),
(3, 4, 1),
(4, 7, 8),
(5, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatar_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `username`, `avatar_image`, `created_at`) VALUES
(1, 'john_doe', 'avatar1.jpg', '2023-10-04 13:14:58'),
(2, 'jane_smith', 'avatar2.jpg', '2023-10-04 13:14:58'),
(3, 'robert_jackson', 'avatar3.jpg', '2023-10-04 13:14:58'),
(4, 'emily_wilson', 'avatar4.jpg', '2023-10-04 13:14:58'),
(5, 'william_davis', 'avatar5.jpg', '2023-10-04 13:14:58'),
(6, 'olivia_anderson', 'avatar6.jpg', '2023-10-04 13:14:58'),
(7, 'michael_johnson', 'avatar7.jpg', '2023-10-04 13:14:58'),
(8, 'sophia_martinez', 'avatar8.jpg', '2023-10-04 13:14:58'),
(9, 'david_thompson', 'avatar9.jpg', '2023-10-04 13:14:58'),
(10, 'emma_hall', 'avatar10.jpg', '2023-10-04 13:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `players_in_sessions`
--

CREATE TABLE `players_in_sessions` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players_in_sessions`
--

INSERT INTO `players_in_sessions` (`id`, `player_id`, `session_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2),
(4, 3, 3),
(5, 4, 4),
(6, 5, 5),
(7, 6, 6),
(8, 7, 7),
(9, 8, 8),
(10, 9, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `mentions`
--
ALTER TABLE `mentions`
  ADD PRIMARY KEY (`mention_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `mentioned_player_id` (`mentioned_player_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indexes for table `players_in_sessions`
--
ALTER TABLE `players_in_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `session_id` (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mentions`
--
ALTER TABLE `mentions`
  MODIFY `mention_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `players_in_sessions`
--
ALTER TABLE `players_in_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `chat_sessions` (`session_id`),
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `players` (`player_id`);

--
-- Constraints for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD CONSTRAINT `chat_sessions_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `players` (`player_id`);

--
-- Constraints for table `mentions`
--
ALTER TABLE `mentions`
  ADD CONSTRAINT `mentions_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `chat_messages` (`message_id`),
  ADD CONSTRAINT `mentions_ibfk_2` FOREIGN KEY (`mentioned_player_id`) REFERENCES `players` (`player_id`);

--
-- Constraints for table `players_in_sessions`
--
ALTER TABLE `players_in_sessions`
  ADD CONSTRAINT `players_in_sessions_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `players_in_sessions_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `chat_sessions` (`session_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
