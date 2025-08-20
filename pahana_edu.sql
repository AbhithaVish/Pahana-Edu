-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2025 at 04:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pahana_edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `nic`, `name`, `email`, `phone`, `registered_at`) VALUES
(1, '199745638624', 'Samantha Fernando', 'samanthafernando@gmail.com', '0710592699', '2025-08-04 17:08:58'),
(4, '2100262434562', 'Abhiut Fernando', 'abhithavishvaj33ith@gmail.com', '0710592699', '2025-08-04 22:18:57'),
(6, '2002527754222', 'Nilanthi Silvaz', 'nilanthi@gmail.com', '0710592699', '2025-08-04 22:57:36'),
(8, '6272963673525', 'test user', 'test@gmail.com', '1242354', '2025-08-04 23:50:50'),
(12, '200128433572', 'Deshan rajapaksha', 'deshanr@gmail.com', '7154626425', '2025-08-13 03:04:32'),
(14, '200242725522', 'ramitha heshan', 'heshanramitha2002@gmail.com', '087643156', '2025-08-17 07:05:44'),
(15, '23542456357', '3467845678', 'abhithavishv24567ajith@gmail.com', '0710592699', '2025-08-17 11:45:44'),
(16, '2345790044433', 'Samantha Fernando', 'samo@gmail.com', '0710592699', '2025-08-19 18:49:21'),
(17, '279900-00', 'Samantha Fernando', 'abhithavishvajith@gmail.com', '0710592699', '2025-08-19 18:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `price`) VALUES
(1, 'Book', 10),
(2, 'Pen', 2),
(3, 'Notebook', 5),
(4, 'scrap book', 350),
(5, 'scrap book', 350);

-- --------------------------------------------------------

--
-- Table structure for table `login_tbl`
--

CREATE TABLE `login_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_tbl`
--

INSERT INTO `login_tbl` (`id`, `name`, `username`, `email`, `password`, `profile`) VALUES
(34, 'admin', 'admin', 'admin@gmail.com', 'admin123', 'admin'),
(40, 'cashier', 'cashier', 'cashier@gmail.com', 'cashier123', 'cashier');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `quantity`) VALUES
(21, 'The Seven Moons of Maali Almeida', 'Winner of the 2022 Booker Prize, this darkly comic and fantastical novel follows war photographer Maali Almeida, who wakes up dead in what appears to be a celestial visa office. He has seven moons to contact the people he loves most and lead them to a hidden stash of photographs that will expose the brutality of Sri Lanka\'s civil war. It\'s a gripping, witty, and poignant exploration of life, death, and political upheaval.', 1100.00, 'null', 20),
(22, 'Funny Boy', 'Set in the 1980s in Sri Lanka, this coming-of-age novel explores the experiences of a young Tamil boy, Arjie Chelvaratnam, as he grapples with his burgeoning homosexuality amidst the backdrop of escalating ethnic tensions that lead to the devastating Black July riots. It\'s a beautifully written and sensitive portrayal of identity, family, and the loss of innocence.', 3000.00, 'null', 10),
(23, 'Anil\'s Ghost', 'A powerful and evocative novel that takes place in Sri Lanka during the civil war. Anil Tissera, a Sri Lankan-born forensic anthropologist, returns to her homeland to investigate a series of skeletons that could reveal unspeakable truths about the conflict. Ondaatje\'s lyrical prose weaves a tale of mystery, violence, and the search for identity in a country torn apart by war.', 3800.00, 'null', 12),
(24, ' Gamperaliya (The Village)', 'A classic Sinhala novel that offers a poignant social commentary on the changing rural society of Sri Lanka in the early 20th century. It traces the decline of a traditional aristocratic family and the rise of a new social order, exploring themes of love, marriage, and economic shifts. A foundational work in Sinhala literature.', 750.00, NULL, 7),
(25, 'Atomic Habits', ' A popular self-help book that provides a practical, actionable framework for improving every day. Clear argues that real change comes from the compound effect of hundreds of small decisions—or \"atomic habits.\" It offers strategies for building good habits, breaking bad ones, and mastering the tiny behaviors that lead to remarkable results. This book is widely popular globally and in Sri Lanka.', 3800.00, 'null', 7),
(26, 'The Psychology of Money', 'This insightful book by financial writer Morgan Housel explores the often irrational ways people think about money and offers timeless lessons on wealth, greed, and happiness. It\'s not about complex financial strategies, but rather the psychological biases that influence our financial decisions, making it relevant for anyone looking to understand money better. Also a global bestseller with a strong presence in Sri Lankan bookstores.', 4657.00, 'null', 14),
(27, 'Madol Doova (Mangrove Island)', 'A beloved Sinhala children\'s novel (though enjoyed by all ages) that tells the adventurous story of Upali and Jinna, two mischievous boys who run away from home and live on a deserted island. It\'s a tale of friendship, survival, and the spirit of adventure, set against the vibrant backdrop of rural Sri Lanka.', 600.00, 'null', 12),
(28, 'The Road from Elephant Pass', 'This gripping thriller, set during the Sri Lankan civil war, follows a Tamil Tiger cadre and a Sri Lankan army captain forced to travel together across the war-torn landscape. It\'s a tense and compelling story of survival, conflicting loyalties, and unexpected human connections amidst the brutality of war.', 12354.00, 'null', 0),
(29, 'Where the Crawdads Sing', 'A captivating novel that blends a coming-of-age story with a murder mystery. Kya Clark, known as the \"Marsh Girl,\" grows up isolated in the North Carolina marsh, learning about life from nature. When a popular local boy is found dead, she becomes the prime suspect. The book is lauded for its lyrical prose and rich descriptions of the natural world.', 3000.00, 'null', 11),
(30, 'Chinaman', 'Before his Booker Prize win, Karunatilaka made waves with this unique and critically acclaimed novel. It\'s a hilarious and poignant quest by a dying, alcoholic sports journalist to uncover the truth about Pradeep Mathew, a legendary but forgotten Sri Lankan cricketer. It\'s a celebration of cricket, a satire of Sri Lankan society, and a moving exploration of memory and legacy.', 1600.00, NULL, 10),
(101, '35647', '345679999', 35647.00, 'null', 38),
(109, 'test2', 'test', 1200.00, 'add-book', 20),
(111, 'test', 'test', 1.00, 'test', 30),
(112, 'JUnit Test Product', 'Description for test product', 9.99, 'Test Category', 53),
(113, 'JUnit Service Product', 'Description for service test', 19.99, 'Service Category', 10),
(115, 'Warnakulasuriya', 'test', 2.00, 'test', 222),
(118, 'test product', 'test', 1.00, 'Test Category', 100),
(121, 'aaerg', 'aerg', 2345.00, 'rgraeg', 12345),
(123, 'test', '23456', 2456.00, '2456', 2456),
(124, '4568', '35678', 567809.00, '46789', 46798),
(125, 'The Boy with One Name', 'Twelve-year-old Jones is an orphan, training as an apprentice hunter alongside his mentor, Maitland, tackling ogres, trolls and all manner of creatures that live in the Badlands – a hidden part of our own world, and which most people think exist only in fairytales and nightmares. But all Jones secretly wants to be is an ordinary boy and to leave the magical world forever...', 3450.00, 'novel', 100),
(126, 'Minimum value test', 'minimum value description', 1.00, 'Test Category', 1),
(127, 'harry potter', 'harry potter description', 1580.00, 'novel', 150);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_name`, `customer_phone`, `total_amount`, `discount`, `service_charge`, `created_at`) VALUES
(1, '', '', 12434.00, 20.00, 100.00, '2025-08-04 02:47:45'),
(2, '', '', 35647.00, 0.00, 0.00, '2025-08-04 15:00:47'),
(3, '', '', 35647.00, 0.00, 0.00, '2025-08-04 16:02:14'),
(4, '', '', 35647.00, 0.00, 0.00, '2025-08-04 16:03:41'),
(5, '', '', 3000.00, 0.00, 0.00, '2025-08-04 16:18:12'),
(6, 'fernando', '', 35647.00, 0.00, 0.00, '2025-08-04 16:21:33'),
(7, '', '', 94120.00, 0.00, 0.00, '2025-08-04 16:23:32'),
(8, 'ruwindi', '', 51801.00, 0.00, 0.00, '2025-08-04 23:24:04'),
(9, '', '', 35647.00, 0.00, 0.00, '2025-08-04 23:39:26'),
(10, '222', '2222', 3003.00, 0.00, 0.00, '2025-08-04 23:51:14'),
(11, '33', '33', 36397.00, 0.00, 0.00, '2025-08-05 03:25:13'),
(12, '', '', 35647.00, 0.00, 0.00, '2025-08-05 14:31:01'),
(13, '', '', 35647.00, 0.00, 0.00, '2025-08-05 14:32:51'),
(14, '', '', 35647.00, 0.00, 0.00, '2025-08-05 15:09:16'),
(15, '', '', 35647.00, 0.00, 0.00, '2025-08-05 17:20:35'),
(16, '', '', 1200.00, NULL, NULL, '2025-08-06 00:10:20'),
(17, 'abhitha', '0710592699', 40197.00, NULL, NULL, '2025-08-06 11:44:22'),
(18, '', '', 35647.00, NULL, NULL, '2025-08-06 15:28:06'),
(19, '', '', 178235.00, NULL, NULL, '2025-08-06 18:35:05'),
(20, '', '', 4657.00, NULL, NULL, '2025-08-07 16:19:54'),
(21, '', '', 1200.00, 0.00, NULL, '2025-08-07 16:58:41'),
(22, '', '', 1200.00, NULL, NULL, '2025-08-07 17:29:23'),
(23, '', '', 3800.00, NULL, NULL, '2025-08-09 14:43:21'),
(24, '', '', 3800.00, NULL, NULL, '2025-08-09 14:56:02'),
(25, '', '', 3000.00, NULL, NULL, '2025-08-09 15:10:08'),
(26, '', '', 600.00, NULL, NULL, '2025-08-09 15:26:04'),
(27, '', '', 600.00, NULL, NULL, '2025-08-09 15:58:40'),
(28, '', '', 3000.00, NULL, NULL, '2025-08-09 16:12:15'),
(29, 'abhitha', '', 1200.00, NULL, NULL, '2025-08-10 08:00:44'),
(30, '', '', 11.00, NULL, NULL, '2025-08-10 09:21:18'),
(31, '', '', 1200.00, NULL, NULL, '2025-08-10 16:39:52'),
(32, '', '', 1200.00, NULL, NULL, '2025-08-10 16:49:21'),
(33, '', '', 1200.00, NULL, NULL, '2025-08-11 01:29:07'),
(34, 'lakmini', '', 8457.00, NULL, NULL, '2025-08-11 05:47:29'),
(35, '', '', 1200.00, NULL, NULL, '2025-08-11 23:46:50'),
(36, 'test', '', 4657.00, NULL, NULL, '2025-08-11 23:59:14'),
(37, '', '', 1.00, NULL, NULL, '2025-08-12 05:28:31'),
(38, '', '', 3800.00, NULL, NULL, '2025-08-12 05:30:35'),
(39, '', '', 4657.00, NULL, NULL, '2025-08-12 05:41:16'),
(40, 'test user', '', 600.00, NULL, NULL, '2025-08-12 13:00:28'),
(41, 'Test', '', 8457.00, NULL, NULL, '2025-08-12 22:53:46'),
(42, 'Test', '', 3800.00, NULL, NULL, '2025-08-12 23:07:52'),
(43, '', '', 600.00, NULL, NULL, '2025-08-12 23:39:12'),
(44, '', '', 750.00, NULL, NULL, '2025-08-13 00:07:59'),
(45, 'add2', 'add2', 12354.00, NULL, NULL, '2025-08-13 01:28:56'),
(46, 'lakmini rajapaksha', '7154626425', 6800.00, NULL, NULL, '2025-08-13 03:05:10'),
(47, 'testsingle', '', 5407.00, NULL, NULL, '2025-08-15 14:53:49'),
(48, 'Samanth22a Fernando', '0710592699', 61770.00, NULL, NULL, '2025-08-15 15:06:53'),
(49, 'Samantha Fernando', '0710592699', 3000.00, NULL, NULL, '2025-08-15 15:10:36'),
(50, 'ramitha', '', 3800.00, NULL, NULL, '2025-08-17 06:26:24'),
(51, '', '', 3800.00, NULL, NULL, '2025-08-17 06:55:01'),
(52, '', '', 4657.00, NULL, NULL, '2025-08-17 07:06:56'),
(53, 'ramitha heshan', '087643156', 3800.00, NULL, NULL, '2025-08-17 07:12:38'),
(54, 'test user', '1242354', 12354.00, NULL, NULL, '2025-08-17 10:39:01'),
(55, 'test user', '1242354', 4657.00, NULL, NULL, '2025-08-17 11:10:15'),
(56, 'test user', '1242354', 3800.00, NULL, NULL, '2025-08-17 11:16:48'),
(57, 'test user', '1242354', 3800.00, NULL, NULL, '2025-08-17 11:46:07'),
(58, 'test user', '1242354', 3800.00, NULL, NULL, '2025-08-17 19:17:18'),
(59, 'test user', '1242354', 3800.00, NULL, NULL, '2025-08-17 19:19:21'),
(60, 'test user', '1242354', 3800.00, NULL, NULL, '2025-08-18 02:14:19'),
(61, 'test user', '1242354', 3800.00, NULL, NULL, '2025-08-19 11:16:17'),
(62, 'test user', '1242354', 23400.00, NULL, NULL, '2025-08-19 18:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `price`) VALUES
(24, 16, 109, 1, 1200.00),
(25, 17, 101, 1, 35647.00),
(26, 17, 24, 1, 750.00),
(27, 17, 25, 1, 3800.00),
(28, 18, 101, 1, 35647.00),
(29, 19, 101, 5, 35647.00),
(30, 20, 26, 1, 4657.00),
(31, 21, 109, 1, 1200.00),
(32, 22, 109, 1, 1200.00),
(33, 23, 25, 1, 3800.00),
(34, 24, 25, 1, 3800.00),
(35, 25, 22, 1, 3000.00),
(36, 26, 27, 1, 600.00),
(37, 27, 27, 1, 600.00),
(38, 28, 29, 1, 3000.00),
(39, 29, 109, 1, 1200.00),
(40, 30, 21, 1, 11.00),
(41, 31, 109, 1, 1200.00),
(42, 32, 109, 1, 1200.00),
(43, 33, 109, 1, 1200.00),
(44, 34, 25, 1, 3800.00),
(45, 34, 26, 1, 4657.00),
(46, 35, 109, 1, 1200.00),
(47, 36, 26, 1, 4657.00),
(48, 37, 111, 1, 1.00),
(49, 38, 25, 1, 3800.00),
(50, 39, 26, 1, 4657.00),
(51, 40, 27, 1, 600.00),
(52, 41, 25, 1, 3800.00),
(53, 41, 26, 1, 4657.00),
(54, 42, 23, 1, 3800.00),
(55, 43, 27, 1, 600.00),
(56, 44, 24, 1, 750.00),
(57, 45, 28, 1, 12354.00),
(58, 46, 23, 1, 3800.00),
(59, 46, 29, 1, 3000.00),
(60, 47, 26, 1, 4657.00),
(61, 47, 24, 1, 750.00),
(62, 48, 28, 5, 12354.00),
(63, 49, 29, 1, 3000.00),
(64, 50, 23, 1, 3800.00),
(65, 51, 23, 1, 3800.00),
(66, 52, 26, 1, 4657.00),
(67, 53, 23, 1, 3800.00),
(68, 54, 28, 1, 12354.00),
(69, 55, 26, 1, 4657.00),
(70, 56, 23, 1, 3800.00),
(71, 57, 23, 1, 3800.00),
(72, 58, 23, 1, 3800.00),
(73, 59, 23, 1, 3800.00),
(74, 60, 23, 1, 3800.00),
(75, 61, 23, 1, 3800.00),
(76, 62, 25, 6, 3800.00),
(77, 62, 27, 1, 600.00);

-- --------------------------------------------------------

--
-- Table structure for table `temp_cart`
--

CREATE TABLE `temp_cart` (
  `session_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_cart`
--

INSERT INTO `temp_cart` (`session_id`, `product_id`, `quantity`) VALUES
('52C3A0AA2E8B0CCA1DBC31A819BBE9F6', 109, 1),
('68EFF1E17792F47D6C6064075B343656', 28, 1),
('DC58F168284710090FA3E0B896AA0D11', 22, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_tbl`
--
ALTER TABLE `login_tbl`
  ADD PRIMARY KEY (`id`,`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `temp_cart`
--
ALTER TABLE `temp_cart`
  ADD PRIMARY KEY (`session_id`,`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_tbl`
--
ALTER TABLE `login_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
