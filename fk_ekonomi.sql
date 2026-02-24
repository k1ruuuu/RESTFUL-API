-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2026 at 04:08 AM
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
-- Database: `denah`
--

-- --------------------------------------------------------

--
-- Table structure for table `fk_ekonomi`
--

CREATE TABLE `fk_ekonomi` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(255) DEFAULT NULL,
  `subUnit` varchar(255) DEFAULT NULL,
  `ruangan` varchar(255) DEFAULT NULL,
  `lantai` varchar(50) DEFAULT NULL,
  `gedung` varchar(255) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fk_ekonomi`
--

INSERT INTO `fk_ekonomi` (`id`, `no`, `fk`, `subUnit`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10090001, 'Fakultas Ekonomi', '', 'R. Dekan', '3', 'Gedung Dekanat ', NULL, ''),
(2, 10090002, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Wakil Dekan I', '3', 'Gedung Dekanat ', NULL, NULL),
(3, 10090003, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Wakil Dekan II', '3', 'Gedung Dekanat ', NULL, NULL),
(4, 10090004, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Wakil Dekan III', '3', 'Gedung Dekanat ', NULL, NULL),
(5, 10090005, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Administrasi / Pelayanan', '3', 'Gedung Dekanat ', NULL, NULL),
(6, 10090006, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Kasie I', '3', 'Gedung Dekanat ', NULL, NULL),
(7, 10090007, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Kasie II', '3', 'Gedung Dekanat ', NULL, NULL),
(8, 10090008, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Kasie III', '3', 'Gedung Dekanat ', NULL, NULL),
(9, 10090009, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. BPM', '3', 'Gedung Dekanat ', NULL, NULL),
(10, 10090010, 'Fakultas Ekonomi', 'Prodi Manajemen', 'R. Ketua Prodi I / Akuntansi', '3', 'Gedung Dekanat ', NULL, NULL),
(11, 10090011, 'Fakultas Ekonomi', 'Prodi Ilmu Ekonomi', 'R. Ketua Prodi II / Manajemen', '3', 'Gedung Dekanat ', NULL, NULL),
(12, 10090012, 'Fakultas Ekonomi', 'Prodi Ilmu Ekonomi', 'R. Ketua Prodi III / Ilmu Ekonomi', '3', 'Gedung Dekanat ', NULL, NULL),
(13, 10090013, 'Fakultas Ekonomi', 'Prodi Akuntansi', 'R. Sekretaris Prodi I / Akuntansi', '3', 'Gedung Dekanat ', NULL, NULL),
(14, 10090014, 'Fakultas Ekonomi', 'Prodi Manajemen', 'R. Sekretaris Prodi II / Manajemen', '3', 'Gedung Dekanat ', NULL, NULL),
(15, 10090015, 'Fakultas Ekonomi', 'Prodi Ilmu Ekonomi', 'R. Sekretaris Prodi III / Ilmu Ekonomi', '3', 'Gedung Dekanat ', NULL, NULL),
(16, 10090016, 'Fakultas Ekonomi', 'Prodi Magister Manajemen', 'R. Ketua Prodi Magister Manajemen', '3', 'Gedung Dekanat ', NULL, NULL),
(17, 10090017, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Gudang', '3', 'Gedung Dekanat ', NULL, NULL),
(19, 10090019, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 01', '3', 'Gedung Dekanat ', NULL, NULL),
(20, 10090020, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 02', '3', 'Gedung Dekanat ', NULL, NULL),
(21, 10090021, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 03', '3', 'Gedung Dekanat ', NULL, NULL),
(22, 10090022, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 04', '3', 'Gedung Dekanat ', NULL, NULL),
(23, 10090023, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 05', '3', 'Gedung Dekanat ', NULL, NULL),
(24, 10090024, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 06', '3', 'Gedung Dekanat ', NULL, NULL),
(25, 10090025, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 07', '3', 'Gedung Dekanat ', NULL, NULL),
(26, 10090026, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 08', '3', 'Gedung Dekanat ', NULL, NULL),
(27, 10090027, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 09', '3', 'Gedung Dekanat ', NULL, NULL),
(28, 10090028, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 10', '3', 'Gedung Dekanat ', NULL, NULL),
(29, 10090029, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 11', '3', 'Gedung Dekanat ', NULL, NULL),
(30, 10090030, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 12', '3', 'Gedung Dekanat ', NULL, NULL),
(31, 10090031, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 13', '3', 'Gedung Dekanat ', NULL, NULL),
(32, 10090032, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 14', '3', 'Gedung Dekanat ', NULL, NULL),
(33, 10090033, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 15', '3', 'Gedung Dekanat ', NULL, NULL),
(34, 10090034, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 16', '3', 'Gedung Dekanat ', NULL, NULL),
(35, 10090035, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 17', '3', 'Gedung Dekanat ', NULL, NULL),
(36, 10090036, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 18', '3', 'Gedung Dekanat ', NULL, NULL),
(37, 10090037, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 19', '3', 'Gedung Dekanat ', NULL, NULL),
(38, 10090038, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 20', '3', 'Gedung Dekanat ', NULL, NULL),
(39, 10090039, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 21', '3', 'Gedung Dekanat ', NULL, NULL),
(40, 10090040, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 22', '3', 'Gedung Dekanat ', NULL, NULL),
(41, 10090041, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 23', '3', 'Gedung Dekanat ', NULL, NULL),
(42, 10090042, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 24', '3', 'Gedung Dekanat ', NULL, NULL),
(43, 10090043, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 25', '3', 'Gedung Dekanat ', NULL, NULL),
(44, 10090044, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 26', '3', 'Gedung Dekanat ', NULL, NULL),
(45, 10090045, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 27', '4', 'Gedung Dekanat ', NULL, NULL),
(46, 10090046, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 28', '4', 'Gedung Dekanat ', NULL, NULL),
(47, 10090047, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 29', '4', 'Gedung Dekanat ', NULL, NULL),
(48, 10090048, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 30', '4', 'Gedung Dekanat ', NULL, NULL),
(49, 10090049, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 31', '4', 'Gedung Dekanat ', NULL, NULL),
(50, 10090050, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 32', '4', 'Gedung Dekanat ', NULL, NULL),
(51, 10090051, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 33', '4', 'Gedung Dekanat ', NULL, NULL),
(52, 10090052, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 34', '4', 'Gedung Dekanat ', NULL, NULL),
(53, 10090053, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 35', '4', 'Gedung Dekanat ', NULL, NULL),
(54, 10090054, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 36', '4', 'Gedung Dekanat ', NULL, NULL),
(55, 10090055, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 37', '4', 'Gedung Dekanat ', NULL, NULL),
(56, 10090056, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 38', '4', 'Gedung Dekanat ', NULL, NULL),
(57, 10090057, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 39', '4', 'Gedung Dekanat ', NULL, NULL),
(58, 10090058, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 40', '4', 'Gedung Dekanat ', NULL, NULL),
(59, 10090059, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 41', '4', 'Gedung Dekanat ', NULL, NULL),
(60, 10090060, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 42', '4', 'Gedung Dekanat ', NULL, NULL),
(61, 10090061, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen 43', '4', 'Gedung Dekanat ', NULL, NULL),
(62, 10090062, 'Fakultas Ekonomi', 'Magister Akuntansi ', 'R. Ketua Prodi Magister Akuntansi/ppa', '3', 'Gedung Dekanat ', NULL, NULL),
(63, 10090063, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dapur ', '3', 'Gedung Dekanat ', NULL, NULL),
(64, 10090064, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Panel', '3', 'Gedung Dekanat ', NULL, NULL),
(65, 10090065, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Toilet Pria', '3', 'Gedung Dekanat ', NULL, NULL),
(66, 10090066, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Toilet Wanita', '3', 'Gedung Dekanat ', NULL, NULL),
(67, 10090067, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dapur ', '4', 'Gedung Dekanat ', NULL, NULL),
(68, 10090068, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Panel', '4', 'Gedung Dekanat ', NULL, NULL),
(69, 10090069, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Toilet Pria', '4', 'Gedung Dekanat ', NULL, NULL),
(70, 10090070, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Toilet Perempuan', '4', 'Gedung Dekanat ', NULL, NULL),
(71, 10090071, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Janitor', '4', 'Gedung Dekanat ', NULL, NULL),
(72, 10090072, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Janitor', '3', 'Gedung Dekanat ', NULL, NULL),
(73, 10090073, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dapur ', '4', 'Gedung Dekanat ', NULL, NULL),
(74, 10090074, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Rapat', '4', 'Gedung Dekanat ', NULL, NULL),
(75, 10090075, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'R. Dosen Ekonomi 44', '4', 'Gedung Dekanat ', NULL, NULL),
(76, 10090076, 'Fakultas Ekonomi', 'Sekretariat Fakultas', 'Toilet Disabilitas', '4', 'Gedung Dekanat ', NULL, NULL),
(78, 10090018, 'Fakultas Ekonomi dan Bisnis', 'Sekertariat Fakultas', 'R. Arsip', '3', 'Gedung Dekanat', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fk_ekonomi`
--
ALTER TABLE `fk_ekonomi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fk_ekonomi`
--
ALTER TABLE `fk_ekonomi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
