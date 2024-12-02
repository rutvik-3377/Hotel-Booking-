-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2023 at 05:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'vivek@gmail.com', 'c37bf859faf392800d739a41fe5af151', '2023-08-24 12:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `adult` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `phone` varchar(255) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `adult`, `child`, `date`, `phone`, `hotel_id`, `user_id`, `created_at`) VALUES
(4, 'ramesh', 1, 3, '2023-08-25 00:00:00', '1234567890', 8, 2, '2023-08-24 21:01:55'),
(5, '', 0, 0, '0000-00-00 00:00:00', '', 9, 2, '2023-08-25 04:28:48'),
(6, 'vivek', 0, 0, '0000-00-00 00:00:00', '', 9, 2, '2023-08-25 05:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(11) NOT NULL,
  `code` varchar(11) NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `hotel_ac_noac` varchar(255) NOT NULL,
  `hotel_food` varchar(255) NOT NULL,
  `bed` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `file_upload` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `address` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `code`, `hotel_name`, `hotel_ac_noac`, `hotel_food`, `bed`, `price`, `phone_no`, `file_upload`, `detail`, `address`, `updated_at`, `created_at`) VALUES
(8, 'A1', 'Aram', 'AC', 'Free Breakfast', 1, 1000, '1234567890', 'f4.jpg', 'hotel in rajkot', 'rajkot jamnagar', '2023-08-24 17:00:24', '2023-08-24 17:00:24'),
(9, 'A2', 'imperial', 'AC', 'Free Breakfast & Dinner', 3, 123, '12312312311', 'carousel-2.jpg', 'hotel in rajkot', 'yagnik road', '2023-08-24 17:04:33', '2023-08-24 17:04:33'),
(11, 'A1', 'Aram 2', 'NON-AC', 'Free Breakfast', 2, 12312, '13122132131', 'four.jpg', 'dasd', 'sadsad', '2023-08-24 17:57:02', '2023-08-24 17:57:02'),
(13, 'A4', 'Interiar new', 'NON-AC', 'Free Breakfast', 2, 232, '1234567890', 'n1.jpg', 'gfsdf', 'fsdfds', '2023-08-24 21:53:34', '2023-08-24 21:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `updated_at`, `created_at`) VALUES
(2, 'vivek', '123@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-08-24 11:07:46', '2023-08-24 11:07:46'),
(3, 'test', 'test@test.test', 'e10adc3949ba59abbe56e057f20f883e', '2023-08-24 21:42:56', '2023-08-24 21:42:56'),
(4, 'testuser', 'testuser@test.test', 'e10adc3949ba59abbe56e057f20f883e', '2023-08-24 21:43:49', '2023-08-24 21:43:49'),
(5, 'smit', '123@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-08-25 04:34:31', '2023-08-25 04:34:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
