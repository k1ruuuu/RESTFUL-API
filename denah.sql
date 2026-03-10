-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2026 at 11:48 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_history_pengecekan` (IN `p_no` VARCHAR(20), IN `p_tanggal_pengecekan` DATE, IN `p_tekanan` VARCHAR(50), IN `p_kondisi` ENUM('Baik','Perlu Perbaikan','Rusak'), IN `p_pemeriksa` VARCHAR(100), IN `p_keterangan` VARCHAR(500))   BEGIN
    DECLARE v_proteksi VARCHAR(100);
    
    -- Ambil jenis proteksi dari tabel utama
    SELECT Proteksi INTO v_proteksi 
    FROM hydrant_apar 
    WHERE `no` = p_no;
    
    -- Insert ke tabel history
    INSERT INTO history_hydrantApar (
        `no`, 
        Proteksi, 
        Tanggal_Pengecekan, 
        Tekanan, 
        Kondisi, 
        Pemeriksa, 
        Keterangan
    ) VALUES (
        p_no,
        v_proteksi,
        p_tanggal_pengecekan,
        p_tekanan,
        p_kondisi,
        p_pemeriksa,
        p_keterangan
    );
    
    SELECT 'History pengecekan berhasil ditambahkan' as Pesan;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_user`
--

CREATE TABLE `activity_user` (
  `id` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `aktivitas` int(11) NOT NULL,
  `waktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_user`
--

INSERT INTO `activity_user` (`id`, `username`, `aktivitas`, `waktu`) VALUES
(1, 0, 0, 2026),
(2, 0, 0, 2026),
(3, 0, 0, 2026),
(4, 0, 0, 2026),
(5, 0, 0, 2026),
(6, 0, 0, 2026),
(7, 0, 0, 2026),
(8, 0, 0, 2026),
(9, 0, 0, 2026),
(10, 0, 0, 2026),
(11, 0, 0, 2026),
(12, 0, 0, 2026),
(13, 0, 0, 2026),
(14, 0, 0, 2026),
(15, 0, 0, 2026),
(16, 0, 0, 2026),
(17, 0, 0, 2026),
(18, 0, 0, 2026),
(19, 0, 0, 2026),
(20, 0, 0, 2026),
(21, 0, 0, 2026),
(22, 0, 0, 2026),
(23, 0, 0, 2026),
(24, 0, 0, 2026),
(25, 0, 0, 2026);

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `client_ip` varchar(45) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `action_type` enum('CREATE','UPDATE','DELETE','OTHER') NOT NULL,
  `resource` varchar(100) DEFAULT NULL,
  `resource_id` varchar(100) DEFAULT NULL,
  `before_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`before_state`)),
  `after_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`after_state`)),
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_message`
--

CREATE TABLE `custom_message` (
  `id` int(11) NOT NULL,
  `from_name` varchar(100) NOT NULL COMMENT 'Nama/username pengirim (developer)',
  `target_role` enum('all','admin','viewer') DEFAULT NULL COMMENT 'Target berdasarkan role. NULL jika target username tertentu',
  `target_username` varchar(100) DEFAULT NULL COMMENT 'Target username spesifik. NULL jika target semua/role',
  `message` text NOT NULL COMMENT 'Isi pesan',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = belum dibaca, 1 = sudah dibaca',
  `read_at` datetime DEFAULT NULL COMMENT 'Waktu pesan dibaca',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pesan kustom dari developer ke role atau username tertentu';

-- --------------------------------------------------------

--
-- Table structure for table `fk_ekonomi`
--

CREATE TABLE `fk_ekonomi` (
  `id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `fk` varchar(100) NOT NULL,
  `subUnit` varchar(100) NOT NULL,
  `Bagian` varchar(100) DEFAULT NULL,
  `ruangan` varchar(100) NOT NULL,
  `lantai` int(11) NOT NULL,
  `gedung` varchar(100) NOT NULL,
  `ukuranR` int(50) DEFAULT NULL,
  `ket` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fk_ekonomi`
--

INSERT INTO `fk_ekonomi` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10090001, 'Fakultas Ekonomi dan Bisnis', 'Sekertariat Fakultas', '', 'R. Dekan', 3, 'Gedung Dekanat', 0, ''),
(2, 10090002, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Wakil Dekan 1', 3, 'Gedung Dekanat', 0, ''),
(3, 10090003, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Wakil Dekan 2', 3, 'Gedung Dekanat', 0, ''),
(4, 10090004, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Wakil Dekan 3', 3, 'Gedung Dekanat', 0, ''),
(5, 10090005, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Administrasi / Pelayanan', 3, 'Gedung Dekanat', 0, ''),
(6, 10090006, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Kasie 1', 3, 'Gedung Dekanat', 0, ''),
(7, 10090007, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Kasie 2', 3, 'Gedung Dekanat', 0, ''),
(8, 10090008, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Kasie 3', 3, 'Gedung Dekanat', 0, ''),
(9, 10090009, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. BPMF Ekonomi', 3, 'Gedung Dekanat', 0, ''),
(10, 10090010, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Ketua Program Studi Akuntansi', 3, 'Gedung Dekanat', 0, ''),
(11, 10090011, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Ketua Program Studi Manajemen', 3, 'Gedung Dekanat', 0, ''),
(12, 10090012, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Ketua Program Studi Ekonomi Pembangunan', 3, 'Gedung Dekanat', 0, ''),
(13, 10090013, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Sekretaris Program Studi Akuntansi', 3, 'Gedung Dekanat', 0, ''),
(14, 10090014, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Sekretaris Program Studi Manajemen', 3, 'Gedung Dekanat', 0, ''),
(15, 10090015, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Sekretaris Program Studi Ekonomi Pembangunan', 3, 'Gedung Dekanat', 0, ''),
(16, 10090016, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Ketua Program Studi Magister Manajemen', 3, 'Gedung Dekanat', 0, ''),
(17, 10090017, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Gudang', 3, 'Gedung Dekanat', 0, ''),
(18, 10090018, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Arsip', 3, 'Gedung Dekanat', 0, ''),
(19, 10090019, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 01', 3, 'Gedung Dekanat', 0, ''),
(20, 10090020, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 02', 3, 'Gedung Dekanat', 0, ''),
(21, 10090021, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 03', 3, 'Gedung Dekanat', 0, ''),
(22, 10090022, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 04', 3, 'Gedung Dekanat', 0, ''),
(23, 10090023, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 05', 3, 'Gedung Dekanat', 0, ''),
(24, 10090024, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 06', 3, 'Gedung Dekanat', 0, ''),
(25, 10090025, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 07', 3, 'Gedung Dekanat', 0, ''),
(26, 10090026, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 08', 3, 'Gedung Dekanat', 0, ''),
(27, 10090027, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 09', 3, 'Gedung Dekanat', 0, ''),
(28, 10090028, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 10', 3, 'Gedung Dekanat', 0, ''),
(29, 10090029, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 11', 3, 'Gedung Dekanat', 0, ''),
(30, 10090030, 'Fakultas Ekonomi dan Bisnis', 'Prodi Ekonomi Pembangunan', '', 'R. Dosen Ekonomi & Bisnis 12', 3, 'Gedung Dekanat', 0, 'test'),
(31, 10090031, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 13', 3, 'Gedung Dekanat', 0, ''),
(32, 10090032, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 14', 3, 'Gedung Dekanat', 0, ''),
(33, 10090033, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 15', 3, 'Gedung Dekanat', 0, ''),
(34, 10090034, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 16', 3, 'Gedung Dekanat', 0, ''),
(35, 10090035, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 17', 3, 'Gedung Dekanat', 0, ''),
(36, 10090036, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 18', 3, 'Gedung Dekanat', 0, ''),
(37, 10090037, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 19', 3, 'Gedung Dekanat', 0, ''),
(38, 10090038, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 20', 3, 'Gedung Dekanat', 0, ''),
(39, 10090039, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 21', 3, 'Gedung Dekanat', 0, ''),
(40, 10090040, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 22', 3, 'Gedung Dekanat', 0, ''),
(41, 10090041, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 23', 3, 'Gedung Dekanat', 0, ''),
(42, 10090042, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 24', 3, 'Gedung Dekanat', 0, ''),
(43, 10090043, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 25', 3, 'Gedung Dekanat', 0, ''),
(44, 10090044, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 26', 3, 'Gedung Dekanat', 0, ''),
(45, 10090045, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Ketua Program Studi Magister Akuntansi', 3, 'Gedung Dekanat', 0, ''),
(46, 10090046, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dapur', 3, 'Gedung Dekanat', 0, ''),
(47, 10090047, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Panel', 3, 'Gedung Dekanat', 0, ''),
(48, 10090048, 'Fakultas Ekonomi dan Bisnis', '', '', 'Toilet Pria', 3, 'Gedung Dekanat', 0, ''),
(49, 10090049, 'Fakultas Ekonomi dan Bisnis', '', '', 'Toilet Wanita', 3, 'Gedung Dekanat', 0, ''),
(50, 10090050, 'Fakultas Ekonomi dan Bisnis', '', '', 'Janitor', 3, 'Gedung Dekanat', 0, ''),
(51, 10090051, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 27', 4, 'Gedung Dekanat', 0, ''),
(52, 10090052, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 28', 4, 'Gedung Dekanat', 0, ''),
(53, 10090053, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 29', 4, 'Gedung Dekanat', 0, ''),
(54, 10090054, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 30', 4, 'Gedung Dekanat', 0, ''),
(55, 10090055, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 31', 4, 'Gedung Dekanat', 0, ''),
(56, 10090056, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 32', 4, 'Gedung Dekanat', 0, ''),
(57, 10090057, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 33', 4, 'Gedung Dekanat', 0, ''),
(58, 10090058, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 34', 4, 'Gedung Dekanat', 0, ''),
(59, 10090059, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 35', 4, 'Gedung Dekanat', 0, ''),
(60, 10090060, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 36', 4, 'Gedung Dekanat', 0, ''),
(61, 10090061, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 37', 4, 'Gedung Dekanat', 0, ''),
(62, 10090062, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 38', 4, 'Gedung Dekanat', 0, ''),
(63, 10090063, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 39', 4, 'Gedung Dekanat', 0, ''),
(64, 10090064, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 40', 4, 'Gedung Dekanat', 0, ''),
(65, 10090065, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 41', 4, 'Gedung Dekanat', 0, ''),
(66, 10090066, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 42', 4, 'Gedung Dekanat', 0, ''),
(67, 10090067, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 43', 4, 'Gedung Dekanat', 0, ''),
(68, 10090068, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dosen Ekonomi & Bisnis 44', 4, 'Gedung Dekanat', 0, ''),
(69, 10090069, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Dapur', 4, 'Gedung Dekanat', 0, ''),
(70, 10090070, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Panel', 4, 'Gedung Dekanat', 0, ''),
(71, 10090071, 'Fakultas Ekonomi dan Bisnis', '', '', 'Toilet Pria', 4, 'Gedung Dekanat', 0, ''),
(72, 10090072, 'Fakultas Ekonomi dan Bisnis', '', '', 'Toilet Wanita', 4, 'Gedung Dekanat', 0, ''),
(73, 10090073, 'Fakultas Ekonomi dan Bisnis', '', '', 'Janitor', 4, 'Gedung Dekanat', 0, ''),
(74, 10090074, 'Fakultas Ekonomi dan Bisnis', '', '', 'Toilet Disabillitas', 4, 'Gedung Dekanat', 0, ''),
(75, 10090075, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Akuntansi', 'R. Asisten Lab Akuntansi 1', 4, 'Gedung Tamansari 1', 0, ''),
(76, 10090076, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Akuntansi', 'Lab Komputer Akuntansi 1', 4, 'Gedung Tamansari 1', 0, ''),
(77, 10090077, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Akuntansi', 'Lab Komputer Akuntansi 2', 4, 'Gedung Tamansari 1', 0, ''),
(78, 10090078, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Ekonomi Pembangunan', 'Lab Komputer Ekonomi Pembangunan', 4, 'Gedung Tamansari 1', 0, ''),
(79, 10090079, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Ekonomi Pembangunan', 'R. Podcast', 4, 'Gedung Tamansari 1', 0, ''),
(80, 10090080, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Akuntansi', 'Lab Manual Akuntansi 1', 4, 'Gedung Tamansari 1', 0, ''),
(81, 10090081, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Akuntansi', 'Lab Manual Akuntansi 2', 4, 'Gedung Tamansari 1', 0, ''),
(82, 10090082, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Manajemen', 'Lab Manajemen', 2, 'Gedung Tamansari 1', 0, ''),
(83, 10090083, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Manajemen', 'Lab Manajemen Manual', 4, 'Gedung Tamansari 1', 0, ''),
(84, 10090084, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Manajemen', 'Lab Komputer Manajemen', 4, 'Gedung Tamansari 1', 0, ''),
(85, 10090085, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Manajemen', 'R. Galeri Investasi', 1, 'Gedung Tamansari 1', 0, ''),
(86, 10090086, 'Fakultas Ekonomi dan Bisnis', '', 'Laboratorium Akuntansi', 'R. Tax Centre', 4, 'Gedung Tamansari 1', 0, ''),
(87, 10090087, 'Fakultas Ekonomi dan Bisnis', '', '', 'R. Ketua Program Studi Doktor Manajemen', 2, 'Gedung Pascasarjana', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `fk_fikom`
--

CREATE TABLE `fk_fikom` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `gedung` varchar(512) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fk_fikom`
--

INSERT INTO `fk_fikom` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10080001, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 01', 7, 'Gedung Dekanat', 0, ''),
(2, 10080002, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 02', 7, 'Gedung Dekanat', 0, ''),
(3, 10080003, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 03', 7, 'Gedung Dekanat', 0, ''),
(4, 10080004, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 04', 7, 'Gedung Dekanat', 0, ''),
(5, 10080005, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 05', 7, 'Gedung Dekanat', 0, ''),
(6, 10080006, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 06', 7, 'Gedung Dekanat', 0, ''),
(7, 10080007, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 07', 7, 'Gedung Dekanat', 0, ''),
(8, 10080008, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 08', 7, 'Gedung Dekanat', 0, ''),
(9, 10080009, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 09', 7, 'Gedung Dekanat', 0, ''),
(10, 10080010, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 10', 7, 'Gedung Dekanat', 0, ''),
(11, 10080011, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 11', 7, 'Gedung Dekanat', 0, ''),
(12, 10080012, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 12', 7, 'Gedung Dekanat', 0, ''),
(13, 10080013, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 13', 7, 'Gedung Dekanat', 0, ''),
(14, 10080014, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 14', 7, 'Gedung Dekanat', 0, ''),
(15, 10080015, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 15', 7, 'Gedung Dekanat', 0, ''),
(16, 10080016, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 16', 7, 'Gedung Dekanat', 0, ''),
(17, 10080017, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 17', 7, 'Gedung Dekanat', 0, ''),
(18, 10080018, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 18', 7, 'Gedung Dekanat', 0, ''),
(19, 10080019, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 19', 7, 'Gedung Dekanat', 0, ''),
(20, 10080020, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 20', 7, 'Gedung Dekanat', 0, ''),
(21, 10080021, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 21', 7, 'Gedung Dekanat', 0, ''),
(22, 10080022, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 22', 7, 'Gedung Dekanat', 0, ''),
(23, 10080023, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 23', 7, 'Gedung Dekanat', 0, ''),
(24, 10080024, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 24', 7, 'Gedung Dekanat', 0, ''),
(25, 10080025, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 25', 7, 'Gedung Dekanat', 0, ''),
(26, 10080026, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 26', 7, 'Gedung Dekanat', 0, ''),
(27, 10080027, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 27', 7, 'Gedung Dekanat', 0, ''),
(28, 10080028, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 28', 7, 'Gedung Dekanat', 0, ''),
(29, 10080029, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 29', 7, 'Gedung Dekanat', 0, ''),
(30, 10080030, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 30', 7, 'Gedung Dekanat', 0, ''),
(31, 10080031, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 31', 7, 'Gedung Dekanat', 0, ''),
(32, 10080032, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 32', 7, 'Gedung Dekanat', 0, ''),
(33, 10080033, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 33', 7, 'Gedung Dekanat', 0, ''),
(34, 10080034, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 34', 7, 'Gedung Dekanat', 0, ''),
(35, 10080035, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 35', 7, 'Gedung Dekanat', 0, ''),
(36, 10080036, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 36', 7, 'Gedung Dekanat', 0, ''),
(37, 10080037, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 37', 7, 'Gedung Dekanat', 0, ''),
(38, 10080038, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 38', 7, 'Gedung Dekanat', 0, ''),
(39, 10080039, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 39', 7, 'Gedung Dekanat', 0, ''),
(40, 10080040, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 40', 7, 'Gedung Dekanat', 0, ''),
(41, 10080041, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dekan', 7, 'Gedung Dekanat', 0, ''),
(42, 10080042, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 1', 7, 'Gedung Dekanat', 0, ''),
(43, 10080043, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Wakil Dekan  2', 7, 'Gedung Dekanat', 0, ''),
(44, 10080044, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Wakil Dekan  3', 7, 'Gedung Dekanat', 0, ''),
(45, 10080045, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Sekretaris Doktor Ilmu Komunikasi', 7, 'Gedung Dekanat', 0, ''),
(46, 10080046, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Magister Ilmu Komunikasi', 7, 'Gedung Dekanat', 0, ''),
(47, 10080047, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Sekretarris Program Studi Ilmu Komunikasi', 7, 'Gedung Dekanat', 0, ''),
(48, 10080048, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Ketua Program Studi Doktor Ilmu Komunikasi', 7, 'Gedung Dekanat', 0, ''),
(49, 10080049, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Ketua Program Studi Magister Ilmu Komunikasi', 7, 'Gedung Dekanat', 0, ''),
(50, 10080050, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Ketua Program Studi Sarjana Ilmu Komunikasi', 7, 'Gedung Dekanat', 0, ''),
(51, 10080051, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Kasie 1', 7, 'Gedung Dekanat', 0, ''),
(52, 10080052, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Kasie 2', 7, 'Gedung Dekanat', 0, ''),
(53, 10080053, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Kasie 3', 7, 'Gedung Dekanat', 0, ''),
(54, 10080054, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Pelayanan', 7, 'Gedung Dekanat', 0, ''),
(55, 10080055, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. BPM FIKOM', 7, 'Gedung Dekanat', 0, ''),
(56, 10080056, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'Toilet Pria', 7, 'Gedung Dekanat', 0, ''),
(57, 10080057, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'Toilet Wanita', 7, 'Gedung Dekanat', 0, ''),
(58, 10080058, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'Janitor', 7, 'Gedung Dekanat', 0, ''),
(59, 10080059, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dapur', 7, 'Gedung Dekanat', 0, ''),
(60, 10080060, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Panel', 7, 'Gedung Dekanat', 0, ''),
(61, 10080061, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 41', 8, 'Gedung Dekanat', 0, ''),
(62, 10080062, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 42', 8, 'Gedung Dekanat', 0, ''),
(63, 10080063, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 43', 8, 'Gedung Dekanat', 0, ''),
(64, 10080064, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 44', 8, 'Gedung Dekanat', 0, ''),
(65, 10080065, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 45', 8, 'Gedung Dekanat', 0, ''),
(66, 10080066, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 46', 8, 'Gedung Dekanat', 0, ''),
(67, 10080067, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 47', 8, 'Gedung Dekanat', 0, ''),
(68, 10080068, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 48', 8, 'Gedung Dekanat', 0, ''),
(69, 10080069, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 49', 8, 'Gedung Dekanat', 0, ''),
(70, 10080070, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 50', 8, 'Gedung Dekanat', 0, ''),
(71, 10080071, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 51', 8, 'Gedung Dekanat', 0, ''),
(72, 10080072, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 52', 8, 'Gedung Dekanat', 0, ''),
(73, 10080073, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dosen FIKOM 53', 8, 'Gedung Dekanat', 0, ''),
(74, 10080074, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'Toilet Pria', 8, 'Gedung Dekanat', 0, ''),
(75, 10080075, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'Toilet Wanita', 8, 'Gedung Dekanat', 0, ''),
(76, 10080076, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'Janitor', 8, 'Gedung Dekanat', 0, ''),
(77, 10080077, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Dapur', 8, 'Gedung Dekanat', 0, ''),
(78, 10080078, 'Fakultas Ilmu Komunikasi', 'Sekretariat Fakultas', '', 'R. Panel', 8, 'Gedung Dekanat', 0, ''),
(79, 10080079, 'Fakultas Ilmu Komunikasi', '', '', 'Lab Film', 2, 'Gedung Tamansari 1', 0, ''),
(80, 0, '', '', '', 'Lab Grafis', 2, 'Gedung Tamansari 1', 0, ''),
(81, 0, '', '', '', 'R.Simulasi', 2, 'Gedung Tamansari 1', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `fk_hukum`
--

CREATE TABLE `fk_hukum` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `gedung` varchar(512) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fk_hukum`
--

INSERT INTO `fk_hukum` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10040001, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 01', 6, 'Gedung Dekanat', 0, ''),
(2, 10040002, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 02', 6, 'Gedung Dekanat', 0, ''),
(3, 10040003, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 03', 6, 'Gedung Dekanat', 0, ''),
(4, 10040004, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 04', 6, 'Gedung Dekanat', 0, ''),
(5, 10040005, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 05', 6, 'Gedung Dekanat', 0, ''),
(6, 10040006, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 06', 6, 'Gedung Dekanat', 0, ''),
(7, 10040007, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 07', 6, 'Gedung Dekanat', 0, ''),
(8, 10040008, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 08', 6, 'Gedung Dekanat', 0, ''),
(9, 10040009, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 09', 6, 'Gedung Dekanat', 0, ''),
(10, 10040010, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 10', 6, 'Gedung Dekanat', 0, ''),
(11, 10040011, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 11', 6, 'Gedung Dekanat', 0, ''),
(12, 10040012, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 12', 6, 'Gedung Dekanat', 0, ''),
(13, 10040013, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 13', 6, 'Gedung Dekanat', 0, ''),
(14, 10040014, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 14', 6, 'Gedung Dekanat', 0, ''),
(15, 10040015, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 15', 6, 'Gedung Dekanat', 0, ''),
(16, 10040016, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 16', 6, 'Gedung Dekanat', 0, ''),
(17, 10040017, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 17', 6, 'Gedung Dekanat', 0, ''),
(18, 10040018, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 18', 6, 'Gedung Dekanat', 0, ''),
(19, 10040019, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 19', 6, 'Gedung Dekanat', 0, ''),
(20, 10040020, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 20', 6, 'Gedung Dekanat', 0, ''),
(21, 10040021, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 21', 6, 'Gedung Dekanat', 0, ''),
(22, 10040022, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 22', 6, 'Gedung Dekanat', 0, ''),
(23, 10040023, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 23', 6, 'Gedung Dekanat', 0, ''),
(24, 10040024, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 24', 6, 'Gedung Dekanat', 0, ''),
(25, 10040025, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 25', 6, 'Gedung Dekanat', 0, ''),
(26, 10040026, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 26', 6, 'Gedung Dekanat', 0, ''),
(27, 10040027, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 27', 6, 'Gedung Dekanat', 0, ''),
(28, 10040028, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 28', 6, 'Gedung Dekanat', 0, ''),
(29, 10040029, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 29', 6, 'Gedung Dekanat', 0, ''),
(30, 10040030, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 30', 6, 'Gedung Dekanat', 0, ''),
(31, 10040031, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 31', 6, 'Gedung Dekanat', 0, ''),
(32, 10040032, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dosen Hukum 32', 6, 'Gedung Dekanat', 0, ''),
(33, 10040033, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Rapat & Perpustakaan', 6, 'Gedung Dekanat', 0, ''),
(34, 10040034, 'Fakultas Hukum', 'Prodi Doktor Ilmu Hukum', '', 'R. Ketua Program Studi Doktor Ilmu Hukum', 6, 'Gedung Dekanat', 0, ''),
(35, 10040035, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dekan', 6, 'Gedung Dekanat', 0, ''),
(36, 10040036, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 1', 6, 'Gedung Dekanat', 0, ''),
(37, 10040037, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 2', 6, 'Gedung Dekanat', 0, ''),
(38, 10040038, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 3', 6, 'Gedung Dekanat', 0, ''),
(39, 10040039, 'Fakultas Hukum', 'Prodi Sarjana Ilmu Hukum', '', 'R. Sekretaris Program Studi Sarjana Ilmu Hukum', 6, 'Gedung Dekanat', 0, ''),
(40, 10040040, 'Fakultas Hukum', 'Prodi Magister Kenotariatan', '', 'R. Ketua Program Studi Magister Kenotariatan', 6, 'Gedung Dekanat', 0, ''),
(41, 10040041, 'Fakultas Hukum', 'Prodi Sarjana Ilmu Hukum', '', 'R. Ketua Program Studi Sarjana Ilmu Hukum', 6, 'Gedung Dekanat', 0, ''),
(42, 10040042, 'Fakultas Hukum', 'Prodi Magister Ilmu Hukum', '', 'R. Ketua Prodi Magister Ilmu Hukum', 6, 'Gedung Dekanat', 0, ''),
(43, 10040044, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Kasie 1', 6, 'Gedung Dekanat', 0, ''),
(44, 10040045, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Kasie 2', 6, 'Gedung Dekanat', 0, ''),
(45, 10040046, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Kasie 3', 6, 'Gedung Dekanat', 0, ''),
(46, 10040047, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Pelayanan', 6, 'Gedung Dekanat', 0, ''),
(47, 10040048, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'Toilet Pria', 6, 'Gedung Dekanat', 0, ''),
(48, 10040049, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'Toilet Wanita', 6, 'Gedung Dekanat', 0, ''),
(49, 10040050, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'Janitor', 6, 'Gedung Dekanat', 0, ''),
(50, 10040051, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Dapur', 6, 'Gedung Dekanat', 0, ''),
(51, 10040052, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Panel', 6, 'Gedung Dekanat', 0, ''),
(52, 10040053, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'R. Kasie Lab Hukum', 4, 'Gedung Tamansari 1', 0, ''),
(53, 10040054, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'Lab. Litigasi', 4, 'Gedung Tamansari 1', 0, ''),
(54, 10040055, 'Fakultas Hukum', 'Sekretariat Fakultas', '', 'Lab Komputer', 4, 'Gedung Tamansari 1', 0, ''),
(55, 10040056, 'Fakultas Hukum', 'Sekretariat Fakultas', '', '', 0, '', 0, ''),
(56, 10040057, 'Fakultas Hukum', 'Sekretariat Fakultas', '', '', 0, '', 0, ''),
(57, 10040058, 'Fakultas Hukum', 'Sekretariat Fakultas', '', '', 0, '', 0, ''),
(58, 10040059, 'Fakultas Hukum', 'Sekretariat Fakultas', '', '', 0, '', 0, ''),
(59, 10040060, '', '', '', '', 0, '', 0, ''),
(60, 10040061, '', '', '', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `fk_syariah`
--

CREATE TABLE `fk_syariah` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` varchar(512) DEFAULT NULL,
  `gedung` varchar(512) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fk_syariah`
--

INSERT INTO `fk_syariah` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10010001, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 01', '1', 'Gedung Dekanat', 0, '0'),
(2, 10010002, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 02', '1', 'Gedung Dekanat', 0, '0'),
(3, 10010003, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 03', '1', 'Gedung Dekanat', 0, '0'),
(4, 10010004, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 04', '1', 'Gedung Dekanat', 0, '0'),
(5, 10010005, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 05', '1', 'Gedung Dekanat', 0, '0'),
(6, 10010006, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 06', '1', 'Gedung Dekanat', 0, '0'),
(7, 10010007, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 07', '1', 'Gedung Dekanat', 0, '0'),
(8, 10010008, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 08', '1', 'Gedung Dekanat', 0, '0'),
(9, 10010009, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 09', '1', 'Gedung Dekanat', 0, '0'),
(10, 10010010, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 10', '1', 'Gedung Dekanat', 0, '0'),
(11, 10010011, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 11', '1', 'Gedung Dekanat', 0, '0'),
(12, 10010012, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 12', '1', 'Gedung Dekanat', 0, '0'),
(13, 10010013, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 13', '1', 'Gedung Dekanat', 0, '0'),
(14, 10010014, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 14', '1', 'Gedung Dekanat', 0, '0'),
(15, 10010015, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 15', '1', 'Gedung Dekanat', 0, '0'),
(16, 10010016, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 16', '1', 'Gedung Dekanat', 0, '0'),
(17, 10010017, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 17', '1', 'Gedung Dekanat', 0, '0'),
(18, 10010018, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 18', '1', 'Gedung Dekanat', 0, '0'),
(19, 10010019, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 19', '1', 'Gedung Dekanat', 0, '0'),
(20, 10010020, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 20', '1', 'Gedung Dekanat', 0, '0'),
(21, 10010021, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 21', '1', 'Gedung Dekanat', 0, '0'),
(22, 10010022, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 22', '1', 'Gedung Dekanat', 0, '0'),
(23, 10010023, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 23', '1', 'Gedung Dekanat', 0, '0'),
(24, 10010024, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 24', '1', 'Gedung Dekanat', 0, '0'),
(25, 10010025, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 25', '1', 'Gedung Dekanat', 0, '0'),
(26, 10010026, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 26', '1', 'Gedung Dekanat', 0, '0'),
(27, 10010027, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 27', '1', 'Gedung Dekanat', 0, '0'),
(28, 10010028, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 28', '1', 'Gedung Dekanat', 0, '0'),
(29, 10010029, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 29', '1', 'Gedung Dekanat', 0, '0'),
(30, 10010030, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 30', '1', 'Gedung Dekanat', 0, '0'),
(31, 10010031, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dosen Syari\'ah 31', '1', 'Gedung Dekanat', 0, '0'),
(32, 10010032, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Arsiparis', '1', 'Gedung Dekanat', 0, '0'),
(33, 10010033, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Rapat & Konsultasi', '1', 'Gedung Dekanat', 0, '0'),
(34, 10010034, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dekan', '1', 'Gedung Dekanat', 0, '0'),
(35, 10010035, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Wakil Dekan 1', '1', 'Gedung Dekanat', 0, '0'),
(36, 10010036, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Wakil Dekan 2', '1', 'Gedung Dekanat', 0, '0'),
(37, 10010037, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Wakil Dekan 3', '1', 'Gedung Dekanat', 0, '0'),
(38, 10010038, 'Fakultas Syari\'ah', 'Program Studi Hukum Ekonomi Syari\'ah', '', 'R. Sekretaris Program Studi  Hukum Ekonomi Syari\'ah', '1', 'Gedung Dekanat', 0, '0'),
(39, 10010039, 'Fakultas Syari\'ah', 'Program Studi Hukum Keluarga Islam', '', 'R. Sekretaris Program Studi  Hukum Keluarga Islam', '1', 'Gedung Dekanat', 0, '0'),
(40, 10010040, 'Fakultas Syari\'ah', 'Program Studi Perbankan Syari\'ah', '', 'R. Sekretaris Program Studi Perbankan Syari\'ah', '1', 'Gedung Dekanat', 0, '0'),
(41, 10010041, 'Fakultas Syari\'ah', 'Program Studi Hukum Ekonomi Syari\'ah', '', 'R. Ketua Program Studi Hukum Ekonomi Syari\'ah', '1', 'Gedung Dekanat', 0, '0'),
(42, 10010042, 'Fakultas Syari\'ah', 'Program Studi Hukum Keluarga Islam', '', 'R. Ketua Program Studi Hukum Keluarga Islam', '1', 'Gedung Dekanat', 0, '0'),
(43, 10010043, 'Fakultas Syari\'ah', 'Program Studi Perbankan Syari\'ah', '', 'R. Ketua Program Studi Perbankan Syari\'ah', '1', 'Gedung Dekanat', 0, '0'),
(44, 10010044, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Lobby', '1', 'Gedung Dekanat', 0, '0'),
(45, 10010045, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'Toilet Pria', '1', 'Gedung Dekanat', 0, '0'),
(46, 10010046, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'Toilet Wanita', '1', 'Gedung Dekanat', 0, '0'),
(47, 10010047, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Dapur', '1', 'Gedung Dekanat', 0, '0'),
(48, 10010048, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Panel', '1', 'Gedung Dekanat', 0, '0'),
(49, 10010049, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Gudang', '1', 'Gedung Dekanat', 0, '0'),
(50, 10010050, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'Toilet Disabilitas', '1', 'Gedung Dekanat', 0, '0'),
(51, 10010051, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'Janitor', '1', 'Gedung Dekanat', 0, '0'),
(52, 10010052, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Pelayanan', '1', 'Gedung Dekanat', 0, '0'),
(53, 10010053, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Kasie 1', '1', 'Gedung Dekanat', 0, '0'),
(54, 10010054, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Kasie 2', '1', 'Gedung Dekanat', 0, '0'),
(55, 10010055, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. Kasie 3', '1', 'Gedung Dekanat', 0, '0'),
(56, 10010056, 'Fakultas Syari\'ah', 'Sekertariat Fakultas', '', 'R. BPMF Syariah', '1', 'Gedung Dekanat', 0, '0'),
(57, 0, '', '', '', 'R. Ketua Program Studi Magister', '2', 'Gedung Tamansari 1', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `fk_tarbiyah`
--

CREATE TABLE `fk_tarbiyah` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `gedung` varchar(512) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fk_tarbiyah`
--

INSERT INTO `fk_tarbiyah` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10030001, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 01', 2, 'Gedung Dekanat', 0, ''),
(2, 10030002, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 02', 2, 'Gedung Dekanat', 0, ''),
(3, 10030003, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 03', 2, 'Gedung Dekanat', 0, ''),
(4, 10030004, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 04', 2, 'Gedung Dekanat', 0, ''),
(5, 10030005, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 05', 2, 'Gedung Dekanat', 0, ''),
(6, 10030006, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 06', 2, 'Gedung Dekanat', 0, ''),
(7, 10030007, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 07', 2, 'Gedung Dekanat', 0, ''),
(8, 10030008, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 08', 2, 'Gedung Dekanat', 0, ''),
(9, 10030009, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 09', 2, 'Gedung Dekanat', 0, ''),
(10, 10030010, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 10', 2, 'Gedung Dekanat', 0, ''),
(11, 10030011, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 11', 2, 'Gedung Dekanat', 0, ''),
(12, 10030012, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 12', 2, 'Gedung Dekanat', 0, ''),
(13, 10030013, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 13', 2, 'Gedung Dekanat', 0, ''),
(14, 10030014, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 14', 2, 'Gedung Dekanat', 0, ''),
(15, 10030015, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 15', 2, 'Gedung Dekanat', 0, ''),
(16, 10030016, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 16', 2, 'Gedung Dekanat', 0, ''),
(17, 10030017, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 17', 2, 'Gedung Dekanat', 0, ''),
(18, 10030018, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 18', 2, 'Gedung Dekanat', 0, ''),
(19, 10030019, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 19', 2, 'Gedung Dekanat', 0, ''),
(20, 10030020, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 20', 2, 'Gedung Dekanat', 0, ''),
(21, 10030021, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 21', 2, 'Gedung Dekanat', 0, ''),
(22, 10030022, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 22', 2, 'Gedung Dekanat', 0, ''),
(23, 10030023, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 23', 2, 'Gedung Dekanat', 0, ''),
(24, 10030024, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 24', 2, 'Gedung Dekanat', 0, ''),
(25, 10030025, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 25', 2, 'Gedung Dekanat', 0, ''),
(26, 10030026, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 26', 2, 'Gedung Dekanat', 0, ''),
(27, 10030027, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 27', 2, 'Gedung Dekanat', 0, ''),
(28, 10030028, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 28', 2, 'Gedung Dekanat', 0, ''),
(29, 10030029, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 29', 2, 'Gedung Dekanat', 0, ''),
(30, 10030030, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 30', 2, 'Gedung Dekanat', 0, ''),
(31, 10030031, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 31', 2, 'Gedung Dekanat', 0, ''),
(32, 10030032, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 32', 2, 'Gedung Dekanat', 0, ''),
(33, 10030033, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 33', 2, 'Gedung Dekanat', 0, ''),
(34, 10030034, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 34', 2, 'Gedung Dekanat', 0, ''),
(35, 10030035, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 35', 2, 'Gedung Dekanat', 0, ''),
(36, 10030036, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 36', 2, 'Gedung Dekanat', 0, ''),
(37, 10030037, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 37', 2, 'Gedung Dekanat', 0, ''),
(38, 10030038, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 38', 2, 'Gedung Dekanat', 0, ''),
(39, 10030039, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dosen Tarbiyah dan Keguruan 39', 2, 'Gedung Dekanat', 0, ''),
(40, 10030040, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dekan', 2, 'Gedung Dekanat', 0, ''),
(41, 10030041, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 1', 2, 'Gedung Dekanat', 0, ''),
(42, 10030042, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 2', 2, 'Gedung Dekanat', 0, ''),
(43, 10030043, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 3', 2, 'Gedung Dekanat', 0, ''),
(44, 10030044, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Kasie 1', 2, 'Gedung Dekanat', 0, ''),
(45, 10030045, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Kasie 2', 2, 'Gedung Dekanat', 0, ''),
(46, 10030046, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Kasie 3', 2, 'Gedung Dekanat', 0, ''),
(47, 10030047, 'Fakultas Tarbiyah dan Keguruan', 'Program Studi Pendidikan Agama Islam', '', 'R. Ketua Program Studi Pendidikan Agama Islam', 2, 'Gedung Dekanat', 0, ''),
(48, 10030048, 'Fakultas Tarbiyah dan Keguruan', 'Program Studi Pendidikan Guru - Pendidikan Anak Usia Dini', '', 'R. Ketua Program Studi  PG-PAUD', 2, 'Gedung Dekanat', 0, ''),
(49, 10030049, 'Fakultas Tarbiyah dan Keguruan', 'Program Studi Pendidikan Agama Islam', '', 'R. Sekretaris Program Studi Pendidikan Agama Islam', 2, 'Gedung Dekanat', 0, ''),
(50, 10030050, 'Fakultas Tarbiyah dan Keguruan', 'R. Sekretaris Prodi Pendidikan Agama Islam', '', 'R. Sekretaris Program Studi PG-PAUD', 2, 'Gedung Dekanat', 0, ''),
(51, 10030051, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Pelayanan', 2, 'Gedung Dekanat', 0, ''),
(52, 10030052, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'Toilet Pria', 2, 'Gedung Dekanat', 0, ''),
(53, 10030053, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'Toilet Wanita', 2, 'Gedung Dekanat', 0, ''),
(54, 10030054, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'Janitor', 2, 'Gedung Dekanat', 0, ''),
(55, 10030055, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Panel', 2, 'Gedung Dekanat', 0, ''),
(56, 10030056, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. Dapur', 2, 'Gedung Dekanat', 0, ''),
(57, 10030057, 'Fakultas Tarbiyah dan Keguruan', 'Sekretariat Fakultas', '', 'R. BPMF Tarbiyah dan Keguruan', 2, 'Gedung Dekanat', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `fk_teknik`
--

CREATE TABLE `fk_teknik` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `gedung` varchar(512) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fk_teknik`
--

INSERT INTO `fk_teknik` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `gedung`, `ukuranR`, `ket`) VALUES
(1, 10070001, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 01', 4, 'Gedung Dekanat', 0, ''),
(2, 10070002, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 02', 4, 'Gedung Dekanat', 0, ''),
(3, 10070003, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 03', 4, 'Gedung Dekanat', 0, ''),
(4, 10070004, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 04', 4, 'Gedung Dekanat', 0, ''),
(5, 10070005, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 05', 4, 'Gedung Dekanat', 0, ''),
(6, 10070006, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 06', 4, 'Gedung Dekanat', 0, ''),
(7, 10070007, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 07', 4, 'Gedung Dekanat', 0, ''),
(8, 10070008, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 08', 4, 'Gedung Dekanat', 0, ''),
(9, 10070009, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 09', 4, 'Gedung Dekanat', 0, ''),
(10, 10070010, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 10', 4, 'Gedung Dekanat', 0, ''),
(11, 10070011, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 11', 4, 'Gedung Dekanat', 0, ''),
(12, 10070012, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 12', 4, 'Gedung Dekanat', 0, ''),
(13, 10070013, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 13', 4, 'Gedung Dekanat', 0, ''),
(14, 10070014, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 14', 4, 'Gedung Dekanat', 0, ''),
(15, 10070015, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 15', 4, 'Gedung Dekanat', 0, ''),
(16, 10070016, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 16', 4, 'Gedung Dekanat', 0, ''),
(17, 10070017, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 17', 4, 'Gedung Dekanat', 0, ''),
(18, 10070018, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 18', 4, 'Gedung Dekanat', 0, ''),
(19, 10070019, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 19', 4, 'Gedung Dekanat', 0, ''),
(20, 10070020, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 20', 4, 'Gedung Dekanat', 0, ''),
(21, 10070021, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 21', 4, 'Gedung Dekanat', 0, ''),
(22, 10070022, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 22', 4, 'Gedung Dekanat', 0, ''),
(23, 10070023, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 23', 4, 'Gedung Dekanat', 0, ''),
(24, 10070024, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 24', 4, 'Gedung Dekanat', 0, ''),
(25, 10070025, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 25', 4, 'Gedung Dekanat', 0, ''),
(26, 10070026, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 26', 4, 'Gedung Dekanat', 0, ''),
(27, 10070027, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 27', 4, 'Gedung Dekanat', 0, ''),
(28, 10070028, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 28', 4, 'Gedung Dekanat', 0, ''),
(29, 10070029, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 29', 4, 'Gedung Dekanat', 0, ''),
(30, 10070030, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 30', 4, 'Gedung Dekanat', 0, ''),
(31, 10070031, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 31', 5, 'Gedung Dekanat', 0, ''),
(32, 10070032, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 32', 5, 'Gedung Dekanat', 0, ''),
(33, 10070033, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 33', 5, 'Gedung Dekanat', 0, ''),
(34, 10070034, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 34', 5, 'Gedung Dekanat', 0, ''),
(35, 10070035, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 35', 5, 'Gedung Dekanat', 0, ''),
(36, 10070036, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 36', 5, 'Gedung Dekanat', 0, ''),
(37, 10070037, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 37', 5, 'Gedung Dekanat', 0, ''),
(38, 10070038, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 38', 5, 'Gedung Dekanat', 0, ''),
(39, 10070039, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 39', 5, 'Gedung Dekanat', 0, ''),
(40, 10070040, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 40', 5, 'Gedung Dekanat', 0, ''),
(41, 10070041, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 41', 5, 'Gedung Dekanat', 0, ''),
(42, 10070042, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 42', 5, 'Gedung Dekanat', 0, ''),
(43, 10070043, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 43', 5, 'Gedung Dekanat', 0, ''),
(44, 10070044, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 44', 5, 'Gedung Dekanat', 0, ''),
(45, 10070045, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 45', 5, 'Gedung Dekanat', 0, ''),
(46, 10070046, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 46', 5, 'Gedung Dekanat', 0, ''),
(47, 10070047, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 47', 5, 'Gedung Dekanat', 0, ''),
(48, 10070048, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 48', 5, 'Gedung Dekanat', 0, ''),
(49, 10070049, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 49', 5, 'Gedung Dekanat', 0, ''),
(50, 10070050, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 50', 5, 'Gedung Dekanat', 0, ''),
(51, 10070051, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 51', 5, 'Gedung Dekanat', 0, ''),
(52, 10070052, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 52', 5, 'Gedung Dekanat', 0, ''),
(53, 10070053, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 53', 5, 'Gedung Dekanat', 0, ''),
(54, 10070054, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 54', 5, 'Gedung Dekanat', 0, ''),
(55, 10070055, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 55', 5, 'Gedung Dekanat', 0, ''),
(56, 10070056, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 56', 5, 'Gedung Dekanat', 0, ''),
(57, 10070057, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 57', 5, 'Gedung Dekanat', 0, ''),
(58, 10070058, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 58', 5, 'Gedung Dekanat', 0, ''),
(59, 10070059, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 59', 5, 'Gedung Dekanat', 0, ''),
(60, 10070060, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 60', 5, 'Gedung Dekanat', 0, ''),
(61, 10070061, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 61', 5, 'Gedung Dekanat', 0, ''),
(62, 10070062, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 62', 5, 'Gedung Dekanat', 0, ''),
(63, 10070063, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 63', 5, 'Gedung Dekanat', 0, ''),
(64, 10070064, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 64', 5, 'Gedung Dekanat', 0, ''),
(65, 10070065, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 65', 5, 'Gedung Dekanat', 0, ''),
(66, 10070066, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 66', 5, 'Gedung Dekanat', 0, ''),
(67, 10070067, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Pelayanan PSPPI', 5, 'Gedung Dekanat', 0, ''),
(68, 10070068, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Ketua Program Studi PSPPI', 5, 'Gedung Dekanat', 0, ''),
(69, 10070069, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Rapat Program Studi PSPPI', 5, 'Gedung Dekanat', 0, ''),
(70, 10070070, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dekan', 5, 'Gedung Dekanat', 0, ''),
(71, 10070071, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 1', 5, 'Gedung Dekanat', 0, ''),
(72, 10070072, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 2', 5, 'Gedung Dekanat', 0, ''),
(73, 10070073, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Wakil Dekan 3', 5, 'Gedung Dekanat', 0, ''),
(74, 10070074, 'Fakultas Teknik', 'Program Studi Teknik Pertambangan', '', 'R. Ketua Program Studi Teknik Pertambangan', 5, 'Gedung Dekanat', 0, ''),
(75, 10070075, 'Fakultas Teknik', 'Program Studi Teknik Industri', '', 'R. Ketua Program Studi Teknik Industri', 5, 'Gedung Dekanat', 0, ''),
(76, 10070076, 'Fakultas Teknik', 'Program Studi Perencanaan Wilayah & Kota', '', 'R. Ketua Program Studi Perencanaan Wilayah & Kota', 5, 'Gedung Dekanat', 0, ''),
(77, 10070077, 'Fakultas Teknik', '', '', 'R. Sekretaris Program Studi Teknik Tambang', 5, 'Gedung Dekanat', 0, ''),
(78, 10070078, 'Fakultas Teknik', '', '', 'R. Sekretaris Program Studi Teknik Industri', 5, 'Gedung Dekanat', 0, ''),
(79, 10070079, 'Fakultas Teknik', '', '', 'R. Sekretaris Program Studi Perencana Wilayah dan Kota', 5, 'Gedung Dekanat', 0, ''),
(80, 10070080, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Kasie 1', 5, 'Gedung Dekanat', 0, ''),
(81, 10070081, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Kasie 2', 5, 'Gedung Dekanat', 0, ''),
(82, 10070082, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Kasie 3', 5, 'Gedung Dekanat', 0, ''),
(83, 10070083, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Pelayanan', 5, 'Gedung Dekanat', 0, ''),
(84, 10070084, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'Toilet Pria', 5, 'Gedung Dekanat', 0, ''),
(85, 10070085, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'Toilet Wanita', 5, 'Gedung Dekanat', 0, ''),
(86, 10070086, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'Janitor', 5, 'Gedung Dekanat', 0, ''),
(87, 10070087, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dapur', 5, 'Gedung Dekanat', 0, ''),
(88, 10070088, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Panel', 5, 'Gedung Dekanat', 0, ''),
(89, 10070089, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. BPMF Teknik', 5, 'Gedung Dekanat', 0, ''),
(90, 10070090, 'Fakultas Teknik', '', '', 'Lab. Perencanaan Wilayah dan Kota', 1, 'Gedung Tamansari 1', 0, ''),
(91, 10070091, 'Fakultas Teknik', '', '', 'Lab. Sistem Produksi', 1, 'Gedung Tamansari 1', 0, ''),
(92, 10070092, 'Fakultas Teknik', '', '', 'Lab. Geomekanika & Ventilasi Tambang Teknik Tambang', 1, 'Gedung Tamansari 1', 0, ''),
(93, 10070093, 'Fakultas Teknik', '', '', 'R. Staf Ahli Lab Sistem Produksi', 1, 'Gedung Tamansari 1', 0, ''),
(94, 10070094, 'Fakultas Teknik', '', '', 'R. Ikatan Alumni Tambang', 1, 'Gedung Tamansari 1', 0, ''),
(95, 10070095, 'Fakultas Teknik', '', '', 'R. Sistem Produksi 01', 1, 'Gedung Tamansari 1', 0, ''),
(96, 10070096, 'Fakultas Teknik', '', '', 'R. Sistem Produksi 02', 1, 'Gedung Tamansari 1', 0, ''),
(97, 10070097, 'Fakultas Teknik', '', '', 'R. Sistem Produksi 03', 1, 'Gedung Tamansari 1', 0, ''),
(98, 10070098, 'Fakultas Teknik', '', '', 'Lab. Tambang Pengolahan Bahan Galian', 1, 'Gedung Tamansari 1', 0, ''),
(99, 10070099, 'Fakultas Teknik', '', '', 'R. Kasie 1', 1, 'Gedung Tamansari 1', 0, ''),
(100, 10070100, 'Fakultas Teknik', '', '', 'R. Kasie 2', 1, 'Gedung Tamansari 1', 0, ''),
(101, 10070101, 'Fakultas Teknik', '', '', 'Gudang Tambang Pengolahan', 1, 'Gedung Tamansari 1', 0, ''),
(102, 10070102, 'Fakultas Teknik', '', '', 'Lab. Perencanaan & Perancangan Sistem Ruang', 1, 'Gedung Tamansari 1', 0, ''),
(103, 10070103, 'Fakultas Teknik', '', '', 'Koperasi Mahasiswa 01', 1, 'Gedung Tamansari 1', 0, ''),
(104, 10070104, 'Fakultas Teknik', '', '', 'Koperasi Mahasiswa 02', 1, 'Gedung Tamansari 1', 0, ''),
(105, 10070105, 'Fakultas Teknik', '', '', 'R.Perpustakaan & E-Library', 1, 'Gedung Tamansari 1', 0, ''),
(106, 10070106, 'Fakultas Teknik', '', '', 'R.Himpunan Mahasiswa Teknik Planologi', 1, 'Gedung Tamansari 1', 0, ''),
(107, 10070107, 'Fakultas Teknik', '', '', 'R.Iklim Lab .APK & Ergonomi', 1, 'Gedung Tamansari 1', 0, ''),
(108, 10070108, 'Fakultas Teknik', '', '', 'Lab Perpetaan', 1, 'Gedung Tamansari 1', 0, ''),
(109, 10070109, 'Fakultas Teknik', '', '', 'R.Sekretaris Keluarga Mahasiswa Teknik Industri', 1, 'Gedung Tamansari 1', 0, ''),
(110, 10070110, 'Fakultas Teknik', '', '', 'R.Praktikum Lab Geologi', 1, 'Gedung Tamansari 1', 0, ''),
(111, 10070111, 'Fakultas Teknik', '', '', 'R.Praktek Lab Teknik Peledakan', 1, 'Gedung Tamansari 1', 0, ''),
(112, 10070112, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(113, 10070113, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(114, 10070114, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(115, 10070115, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(116, 10070116, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(117, 10070117, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(118, 10070118, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(119, 10070119, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(120, 10070120, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(121, 10070121, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(122, 10070122, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(123, 10070123, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(124, 10070124, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(125, 10070125, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(126, 10070126, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(127, 10070127, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(128, 10070128, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(129, 10070129, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(130, 10070130, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(131, 10070131, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(132, 10070132, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(133, 10070133, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(134, 10070134, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(135, 10070135, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(136, 10070136, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(137, 10070137, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(138, 10070138, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(139, 10070139, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(140, 10070140, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(141, 10070141, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(142, 10070142, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(143, 10070143, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(144, 10070144, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(145, 10070145, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(146, 10070146, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(147, 10070147, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(148, 10070148, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(149, 10070149, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, ''),
(150, 10070150, 'Fakultas Teknik', '', '', '', 1, 'Gedung Tamansari 1', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `history_hydrantapar`
--

CREATE TABLE `history_hydrantapar` (
  `id` int(11) NOT NULL,
  `no` varchar(20) NOT NULL COMMENT 'Referensi ke tabel utama',
  `Proteksi` enum('Hydrant','APAR') NOT NULL,
  `Tanggal_Pengisian` date DEFAULT NULL COMMENT 'Tanggal pengisian terakhir',
  `Tanggal_Pengecekan` date NOT NULL COMMENT 'Tanggal pengecekan',
  `Kapasitas` varchar(50) DEFAULT NULL,
  `Tekanan` varchar(50) DEFAULT NULL,
  `Expired_Date` date DEFAULT NULL COMMENT 'Tanggal kadaluarsa',
  `Keterangan` varchar(500) DEFAULT NULL,
  `Pemeriksa` varchar(100) DEFAULT NULL COMMENT 'Nama pemeriksa',
  `Kondisi` enum('Baik','Perlu Perbaikan','Rusak') DEFAULT 'Baik',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_hydrantapar`
--

INSERT INTO `history_hydrantapar` (`id`, `no`, `Proteksi`, `Tanggal_Pengisian`, `Tanggal_Pengecekan`, `Kapasitas`, `Tekanan`, `Expired_Date`, `Keterangan`, `Pemeriksa`, `Kondisi`, `created_at`) VALUES
(1, '10130001', 'Hydrant', NULL, '2024-01-15', NULL, '5 Bar', NULL, 'Pengecekan rutin', 'Budi Santoso', 'Baik', '2026-02-05 07:50:15'),
(2, '10130003', 'APAR', '2024-01-10', '2024-01-15', '1,5 KG', '12 Bar', '2025-01-10', 'Pengisian ulang', 'Budi Santoso', 'Baik', '2026-02-05 07:50:15'),
(3, '10130007', 'APAR', '2023-12-20', '2024-01-15', '1,5 KG', '11.5 Bar', '2024-12-20', 'Tekanan normal', 'Budi Santoso', 'Baik', '2026-02-05 07:50:15'),
(4, '10130021', 'APAR', NULL, '2024-01-16', '1,5 KG', '10 Bar', '2024-06-30', 'Perlu perhatian', 'Siti Aminah', 'Perlu Perbaikan', '2026-02-05 07:50:15'),
(5, '10130058', 'Hydrant', NULL, '2024-01-16', NULL, '4.8 Bar', NULL, 'Pengecekan valve', 'Ahmad Fauzi', 'Baik', '2026-02-05 07:50:15'),
(6, '10130056', 'APAR', '2024-01-10', '2024-01-17', '1,5 KG', '12.2 Bar', '2025-01-10', 'Pengisian rutin', 'Budi Santoso', 'Baik', '2026-02-05 07:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `hydrant_apar`
--

CREATE TABLE `hydrant_apar` (
  `id` int(11) NOT NULL,
  `no` varchar(20) NOT NULL COMMENT 'Nomor unik alat',
  `Proteksi` enum('Hydrant','APAR') NOT NULL COMMENT 'Jenis proteksi (Hydrant/APAR)',
  `Lantai` varchar(50) NOT NULL COMMENT 'Lokasi lantai',
  `Gedung` varchar(100) NOT NULL COMMENT 'Nama gedung',
  `Kapasitas` varchar(50) DEFAULT NULL COMMENT 'Kapasitas alat (khusus APAR)',
  `Tekanan` varchar(50) DEFAULT NULL COMMENT 'Tekanan alat',
  `Keterangan` varchar(500) DEFAULT NULL COMMENT 'Catatan tambahan',
  `Status` enum('Aktif','Tidak Aktif','Dalam Perbaikan') DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Merk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hydrant_apar`
--

INSERT INTO `hydrant_apar` (`id`, `no`, `Proteksi`, `Lantai`, `Gedung`, `Kapasitas`, `Tekanan`, `Keterangan`, `Status`, `created_at`, `updated_at`, `Merk`) VALUES
(1, '10130001', 'Hydrant', 'Site Plan', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(2, '10130002', 'Hydrant', 'Site Plan', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(3, '10130003', 'APAR', 'Site Plan', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(4, '10130004', 'Hydrant', 'B1', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(5, '10130005', 'Hydrant', 'B1', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(6, '10130006', 'Hydrant', 'B1', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(7, '10130007', 'APAR', 'B1', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(8, '10130008', 'APAR', 'B1', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(9, '10130009', 'Hydrant', 'B2', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(10, '10130010', 'Hydrant', 'B2', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(11, '10130011', 'APAR', 'B2', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(12, '10130012', 'APAR', 'B2', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(13, '10130013', 'Hydrant', 'B3', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(14, '10130014', 'Hydrant', 'B3', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(15, '10130015', 'Hydrant', 'B3', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(16, '10130016', 'APAR', 'B3', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(17, '10130017', 'APAR', 'B3', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(18, '10130018', 'Hydrant', '1', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(19, '10130019', 'Hydrant', '1', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(20, '10130020', 'Hydrant', '1', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(21, '10130021', 'APAR', '1', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(22, '10130022', 'APAR', '1', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(23, '10130023', 'Hydrant', '2', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(24, '10130024', 'Hydrant', '2', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(25, '10130025', 'Hydrant', '2', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(26, '10130026', 'APAR', '2', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(27, '10130027', 'APAR', '2', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(28, '10130028', 'Hydrant', '3', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(29, '10130029', 'Hydrant', '3', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(30, '10130030', 'Hydrant', '3', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(31, '10130031', 'APAR', '3', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(32, '10130032', 'APAR', '3', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(33, '10130033', 'Hydrant', '4', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(34, '10130034', 'Hydrant', '4', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(35, '10130035', 'Hydrant', '4', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(36, '10130036', 'APAR', '4', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(37, '10130037', 'APAR', '4', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(38, '10130038', 'Hydrant', '5', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(39, '10130039', 'Hydrant', '5', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(40, '10130040', 'Hydrant', '5', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(41, '10130041', 'APAR', '5', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(42, '10130042', 'APAR', '5', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(43, '10130043', 'Hydrant', '6', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(44, '10130044', 'Hydrant', '6', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(45, '10130045', 'Hydrant', '6', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(46, '10130046', 'APAR', '6', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(47, '10130047', 'APAR', '6', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(48, '10130048', 'Hydrant', '7', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(49, '10130049', 'Hydrant', '7', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(50, '10130050', 'Hydrant', '7', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(51, '10130051', 'APAR', '7', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(52, '10130052', 'APAR', '7', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(53, '10130053', 'Hydrant', '8', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(54, '10130054', 'Hydrant', '8', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(55, '10130055', 'Hydrant', '8', 'Gedung Dekanat', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(56, '10130056', 'APAR', '8', 'Gedung Dekanat', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(57, '10130058', 'Hydrant', 'B1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(58, '10130059', 'Hydrant', 'B1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(59, '10130060', 'APAR', 'B1', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(60, '10130061', 'APAR', 'B1', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(61, '10130062', 'Hydrant', 'B2', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(62, '10130063', 'APAR', 'B2', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(63, '10130064', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(64, '10130065', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(65, '10130066', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(66, '10130067', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(67, '10130068', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(68, '10130069', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(69, '10130070', 'Hydrant', '1', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(70, '10130071', 'APAR', '1', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(71, '10130072', 'APAR', '1', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(72, '10130073', 'Hydrant', '2', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(73, '10130074', 'Hydrant', '2', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(74, '10130075', 'Hydrant', '2', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(75, '10130076', 'APAR', '2', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(76, '10130077', 'Hydrant', '3', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(77, '10130078', 'Hydrant', '3', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(78, '10130079', 'Hydrant', '3', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(79, '10130080', 'APAR', '3', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(80, '10130081', 'Hydrant', '4', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(81, '10130082', 'Hydrant', '4', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(82, '10130083', 'Hydrant', '4', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(83, '10130084', 'APAR', '4', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(84, '10130085', 'APAR', '4', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(85, '10130086', 'Hydrant', '5', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(86, '10130087', 'Hydrant', '5', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(87, '10130088', 'Hydrant', '5', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(88, '10130089', 'APAR', '5', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(89, '10130090', 'APAR', '5', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(90, '10130091', 'Hydrant', '6', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(91, '10130092', 'Hydrant', '6', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(92, '10130093', 'Hydrant', '6', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(93, '10130094', 'APAR', '6', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(94, '10130095', 'APAR', '6', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(95, '10130096', 'Hydrant', '7', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(96, '10130097', 'Hydrant', '7', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(97, '10130098', 'Hydrant', '7', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(98, '10130099', 'APAR', '7', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(99, '10130100', 'APAR', '7', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(100, '10130101', 'Hydrant', '8', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(101, '10130102', 'Hydrant', '8', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(102, '10130103', 'Hydrant', '8', 'Gedung Kedokteran', NULL, NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(103, '10130104', 'APAR', '8', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(104, '10130105', 'APAR', '8', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', ''),
(105, '10130106', 'APAR', '9', 'Gedung Kedokteran', '1,5 KG', NULL, NULL, 'Aktif', '2026-02-05 07:50:15', '2026-02-05 07:50:15', '');

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_time` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'success',
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `user_id`, `username`, `login_time`, `logout_time`, `ip_address`, `user_agent`, `status`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'admin', '2026-02-18 02:09:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-18 02:09:46', NULL),
(2, 2, 'admin', '2026-02-18 02:13:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-18 02:13:50', NULL),
(3, 2, 'admin', '2026-02-18 06:20:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-18 06:20:56', NULL),
(4, 2, 'admin', '2026-02-18 06:21:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-18 06:21:27', NULL),
(6, 2, 'admin', '2026-02-23 02:04:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 02:04:00', NULL),
(7, 2, 'admin', '2026-02-23 03:55:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 03:55:08', NULL),
(8, 2, 'admin', '2026-02-23 04:10:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 04:10:20', NULL),
(9, 2, 'admin', '2026-02-23 04:21:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 04:21:04', NULL),
(10, 2, 'admin', '2026-02-23 04:45:28', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 04:45:28', NULL),
(11, 2, 'admin', '2026-02-23 04:46:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 04:46:23', NULL),
(12, 2, 'admin', '2026-02-23 05:53:59', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 05:53:59', NULL),
(13, 2, 'admin', '2026-02-23 06:11:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 06:11:49', NULL),
(14, 2, 'admin', '2026-02-23 06:37:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 06:37:31', NULL),
(15, 2, 'admin', '2026-02-23 06:54:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 06:54:34', NULL),
(16, 2, 'admin', '2026-02-23 07:26:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 07:26:04', NULL),
(17, 2, 'admin', '2026-02-23 07:53:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-23 07:53:46', NULL),
(18, 2, 'admin', '2026-02-24 01:08:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 01:08:20', NULL),
(19, 2, 'admin', '2026-02-24 01:08:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 01:08:53', NULL),
(20, 2, 'admin', '2026-02-24 01:32:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 01:32:16', NULL),
(22, 2, 'admin', '2026-02-24 01:52:05', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 01:52:05', NULL),
(23, 2, 'admin', '2026-02-24 02:14:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 02:14:46', NULL),
(24, 2, 'admin', '2026-02-24 02:26:17', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 02:26:17', NULL),
(25, 2, 'admin', '2026-02-24 02:28:05', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 02:28:05', NULL),
(26, 2, 'admin', '2026-02-24 02:52:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 02:52:14', NULL),
(27, 2, 'admin', '2026-02-24 03:18:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 03:18:45', NULL),
(28, 2, 'admin', '2026-02-24 03:22:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 03:22:46', NULL),
(29, 2, 'admin', '2026-02-24 03:23:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 03:23:49', NULL),
(30, 2, 'admin', '2026-02-24 03:26:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 03:26:34', NULL),
(33, 2, 'admin', '2026-02-24 03:49:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.6456', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 03:49:54', NULL),
(34, 2, 'admin', '2026-02-24 04:30:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 04:30:04', NULL),
(35, 2, 'admin', '2026-02-24 04:31:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.6456', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 04:31:15', NULL),
(36, 2, 'admin', '2026-02-24 04:40:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.6456', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 04:40:52', NULL),
(37, 2, 'admin', '2026-02-24 04:44:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.6456', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 04:44:08', NULL),
(38, 2, 'admin', '2026-02-24 04:49:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 04:49:06', NULL),
(39, 2, 'admin', '2026-02-24 04:57:11', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 04:57:11', NULL),
(40, 12, 'anjas', '2026-02-24 05:04:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhb', '2026-02-24 05:04:15', NULL),
(41, 2, 'admin', '2026-02-24 05:05:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 05:05:56', NULL),
(42, 2, 'admin', '2026-02-24 07:16:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-24 07:16:41', NULL),
(43, 2, 'admin', '2026-02-26 02:02:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 02:02:32', NULL),
(50, 14, 'test', '2026-02-26 02:04:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0Z', '2026-02-26 02:04:22', NULL),
(51, 14, 'test', '2026-02-26 02:13:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0Z', '2026-02-26 02:13:19', NULL),
(52, 2, 'admin', '2026-02-26 02:17:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 02:17:13', NULL),
(53, 2, 'admin', '2026-02-26 02:45:18', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 02:45:18', NULL),
(56, 2, 'admin', '2026-02-26 04:38:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 04:38:29', NULL),
(58, 14, 'test', '2026-02-26 04:42:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0Z', '2026-02-26 04:42:04', NULL),
(59, 14, 'test', '2026-02-26 04:53:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0Z', '2026-02-26 04:53:01', NULL),
(60, 2, 'admin', '2026-02-26 05:11:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 05:11:09', NULL),
(61, 2, 'admin', '2026-02-26 06:32:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 06:32:23', NULL),
(62, 2, 'admin', '2026-02-26 06:43:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 06:43:23', NULL),
(65, 2, 'admin', '2026-02-26 06:49:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 06:49:06', NULL),
(66, 2, 'admin', '2026-02-26 07:06:21', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 07:06:21', NULL),
(67, 2, 'admin', '2026-02-26 10:40:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-26 10:40:12', NULL),
(68, 2, 'admin', '2026-02-27 02:41:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 02:41:23', NULL),
(69, 2, 'admin', '2026-02-27 03:57:43', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 03:57:43', NULL),
(70, 2, 'admin', '2026-02-27 05:01:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 05:01:14', NULL),
(71, 2, 'admin', '2026-02-27 06:08:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 06:08:15', NULL),
(72, 2, 'admin', '2026-02-27 06:34:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 06:34:36', NULL),
(73, 2, 'admin', '2026-02-27 07:01:44', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 07:01:44', NULL),
(74, 2, 'admin', '2026-02-27 07:18:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 07:18:35', NULL),
(75, 2, 'admin', '2026-02-27 07:34:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 07:34:14', NULL),
(76, 2, 'admin', '2026-02-27 09:37:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-02-27 09:37:45', NULL),
(77, 2, 'admin', '2026-03-02 04:29:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 04:29:46', NULL),
(78, 2, 'admin', '2026-03-02 04:46:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 04:46:13', NULL),
(79, 2, 'admin', '2026-03-02 05:50:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 05:50:31', NULL),
(80, 2, 'admin', '2026-03-02 06:57:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 06:57:26', NULL),
(81, 2, 'admin', '2026-03-02 07:44:25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 07:44:25', NULL),
(82, 2, 'admin', '2026-03-02 08:05:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 08:05:36', NULL),
(83, 2, 'admin', '2026-03-02 08:36:39', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 08:36:39', NULL),
(84, 2, 'admin', '2026-03-02 09:08:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 09:08:52', NULL),
(85, 2, 'admin', '2026-03-02 09:24:51', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 09:24:51', NULL),
(86, 2, 'admin', '2026-03-02 09:35:03', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 09:35:03', NULL),
(87, 2, 'admin', '2026-03-02 10:08:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-02 10:08:53', NULL),
(88, 2, 'admin', '2026-03-03 03:31:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-03 03:31:04', NULL),
(89, 2, 'admin', '2026-03-04 07:17:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-04 07:17:41', NULL),
(94, 2, 'admin', '2026-03-04 07:19:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-04 07:19:01', NULL),
(95, 15, 'pawdosq', '2026-03-04 07:28:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-04 07:28:20', NULL),
(96, 15, 'pawdosq', '2026-03-04 07:36:28', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-04 07:36:28', NULL),
(97, 15, 'pawdosq', '2026-03-04 07:41:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-04 07:41:13', NULL),
(98, 15, 'pawdosq', '2026-03-04 07:59:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-04 07:59:02', NULL),
(99, 15, 'pawdosq', '2026-03-04 08:01:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-04 08:01:49', NULL),
(100, 15, 'pawdosq', '2026-03-04 08:06:11', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-04 08:06:11', NULL),
(101, 15, 'pawdosq', '2026-03-09 03:59:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-09 03:59:34', NULL),
(102, 15, 'pawdosq', '2026-03-09 03:59:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-09 03:59:49', NULL),
(103, 15, 'pawdosq', '2026-03-09 04:37:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-09 04:37:02', NULL),
(104, 15, 'pawdosq', '2026-03-09 04:56:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-09 04:56:32', NULL),
(105, 2, 'admin', '2026-03-09 04:57:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-09 04:57:46', NULL),
(106, 2, 'admin', '2026-03-10 07:20:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 07:20:29', NULL),
(107, 2, 'admin', '2026-03-10 07:54:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 07:54:50', NULL),
(108, 2, 'admin', '2026-03-10 08:22:43', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 08:22:43', NULL),
(112, 15, 'pawdosq', '2026-03-10 08:31:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 08:31:42', NULL),
(113, 15, 'pawdosq', '2026-03-10 10:16:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:16:31', NULL),
(114, 15, 'pawdosq', '2026-03-10 10:18:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:18:40', NULL),
(115, 2, 'admin', '2026-03-10 10:19:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:19:09', NULL),
(116, 2, 'admin', '2026-03-10 10:20:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:20:12', NULL),
(117, 15, 'pawdosq', '2026-03-10 10:21:21', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:21:21', NULL),
(118, 2, 'admin', '2026-03-10 10:24:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:24:00', NULL),
(119, 2, 'admin', '2026-03-10 10:24:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:24:20', NULL),
(120, 15, 'pawdosq', '2026-03-10 10:37:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:37:52', NULL),
(121, 15, 'pawdosq', '2026-03-10 10:43:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:43:14', NULL),
(122, 2, 'admin', '2026-03-10 10:43:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:43:35', NULL),
(123, 2, 'admin', '2026-03-10 10:45:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:45:01', NULL),
(124, 2, 'admin', '2026-03-10 10:45:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:45:14', NULL),
(125, 2, 'admin', '2026-03-10 10:45:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ', '2026-03-10 10:45:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mainten`
--

CREATE TABLE `mainten` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Normal, 1 = Maintenance aktif',
  `message` varchar(500) NOT NULL DEFAULT 'Kami sedang melakukan pembaruan sistem. Mohon tunggu sebentar.' COMMENT 'Pesan yang ditampilkan saat maintenance',
  `updated_by` varchar(100) DEFAULT NULL COMMENT 'Username developer yang terakhir update',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Status maintenance aplikasi - hanya 1 baris (id=1)';

--
-- Dumping data for table `mainten`
--

INSERT INTO `mainten` (`id`, `status`, `message`, `updated_by`, `updated_at`, `created_at`) VALUES
(1, 0, 'Kami sedang melakukan pembaruan sistem. Mohon tunggu sebentar dan coba kembali.', 'pawdosq', '2026-03-10 10:43:49', '2026-03-04 07:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `patch_notif`
--

CREATE TABLE `patch_notif` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL COMMENT 'Judul notifikasi, contoh: Update v2.3.1',
  `subtitle` varchar(300) DEFAULT NULL COMMENT 'Sub judul, contoh: Perbaikan bug & peningkatan performa',
  `message` text NOT NULL COMMENT 'Isi deskripsi perubahan',
  `bug_url` varchar(500) DEFAULT NULL COMMENT 'Link untuk report bug (GitHub Issues, dll)',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = aktif (tampil ke user), 0 = nonaktif',
  `created_by` varchar(100) DEFAULT NULL COMMENT 'Username developer yang membuat',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Patch/update notification yang dikirim developer ke semua user';

-- --------------------------------------------------------

--
-- Table structure for table `univ`
--

CREATE TABLE `univ` (
  `id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `lokasi` varchar(512) DEFAULT NULL,
  `ukuranR` int(11) DEFAULT NULL,
  `ket` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `univ`
--

INSERT INTO `univ` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `lokasi`, `ukuranR`, `ket`) VALUES
(1, 10120001, 'Universitas', '', 'PSITEK', 'R. Rapat 1', 4, 'Gedung Dekanat', 0, ''),
(2, 10120002, 'Universitas', '', 'PSITEK', 'R. Kepala Bagian 1', 4, 'Gedung Dekanat', 0, ''),
(3, 10120003, 'Universitas', '', 'PSITEK', 'R. Pelayanan', 4, 'Gedung Dekanat', 0, ''),
(4, 10120004, 'Universitas', '', 'PSITEK', 'R. Kasie', 4, 'Gedung Dekanat', 0, ''),
(5, 10120005, 'Universitas', '', 'PSITEK', 'PSITEK', 4, 'Gedung Dekanat', 0, ''),
(6, 10120006, 'Universitas', '', 'PSITEK', 'R. Administrasi', 4, 'Gedung Dekanat', 0, ''),
(7, 10120007, 'Universitas', '', 'PSITEK', 'R. Server', 4, 'Gedung Dekanat', 0, ''),
(8, 10120008, 'Universitas', '', 'PSITEK', 'R. ADM', 4, 'Gedung Dekanat', 0, ''),
(9, 10120009, 'Universitas', '', 'e-learning', 'R. Rapat 2', 4, 'Gedung Dekanat', 0, ''),
(10, 10120010, 'Universitas', '', 'e-learning', 'E-LEARNING', 4, 'Gedung Dekanat', 0, ''),
(11, 10120011, 'Universitas', '', 'e-learning', 'R. Kepala Bagian 2', 4, 'Gedung Dekanat', 0, ''),
(12, 10120012, 'Universitas', '', 'SDM & UMUM', 'R. Auditorium', 8, 'Gedung Dekanat', 0, ''),
(13, 10120013, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 01', 8, 'Gedung Dekanat', 0, ''),
(14, 10120014, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 02', 8, 'Gedung Dekanat', 0, ''),
(15, 10120015, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 03', 8, 'Gedung Dekanat', 0, ''),
(16, 10120016, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 04', 8, 'Gedung Dekanat', 0, ''),
(17, 10120017, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', 'Masjid Al Miraj', 'Masjid Al Miraj', 9, 'Gedung Dekanat', 0, ''),
(18, 10120018, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', 'Masjid Al Miraj', 'Tempat Wudhu Pria', 9, 'Gedung Dekanat', 0, ''),
(19, 10120019, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', 'Masjid Al Miraj', 'Tempat Wudhu Wanita', 9, 'Gedung Dekanat', 0, ''),
(20, 10120020, 'Universitas', '', '', 'BEM UNISBA', 1, 'Gedung Tamansari 1', 0, ''),
(21, 10120021, 'Universitas', '', '', 'KSR PMI', 1, 'Gedung Tamansari 1', 0, ''),
(22, 10120022, 'Universitas', '', '', 'STUBA', 1, 'Gedung Tamansari 1', 0, ''),
(23, 10120023, 'Universitas', '', '', 'BEM. Fak. MIPA', 1, 'Gedung Tamansari 1', 0, ''),
(24, 10120024, 'Universitas', '', '', 'BEM. Fak. Syariah', 1, 'Gedung Tamansari 1', 0, ''),
(25, 10120025, 'Universitas', '', '', 'BEM Fak. Hukum', 1, 'Gedung Tamansari 1', 0, ''),
(26, 10120026, 'Universitas', '', '', 'R. Damu', 1, 'Gedung Tamansari 1', 0, ''),
(27, 10120027, 'Universitas', '', '', 'Aula', 1, 'Gedung Tamansari 1', 0, ''),
(28, 10120028, 'Universitas', '', '', 'Dapur Aula', 1, 'Gedung Tamansari 1', 0, ''),
(29, 10120029, 'Universitas', '', '', 'G. Perpustakaan Ruang Baca', 1, 'Gedung Tamansari 1', 0, ''),
(30, 10120030, 'Universitas', '', '', 'R. Gudang 01', 1, 'Gedung Tamansari 1', 0, ''),
(31, 10120031, 'Universitas', '', '', 'R. Gudang 02', 1, 'Gedung Tamansari 1', 0, ''),
(32, 10120032, 'Universitas', '', '', 'R. Gudang 03', 1, 'Gedung Tamansari 1', 0, ''),
(33, 10120033, 'Universitas', '', '', 'R. Gudang 04', 1, 'Gedung Tamansari 1', 0, ''),
(34, 10120034, 'Universitas', '', '', 'R. Gudang Aula', 1, 'Gedung Tamansari 1', 0, ''),
(35, 10120035, 'Universitas', '', '', 'R. Staff Perpustakaan', 1, 'Gedung Tamansari 1', 0, ''),
(36, 10120036, 'Universitas', '', '', 'R. Photo Copy', 1, 'Gedung Tamansari 1', 0, ''),
(37, 10120037, 'Universitas', '', '', 'R. Pelayanan Perpustakaan', 1, 'Gedung Tamansari 1', 0, ''),
(38, 10120038, 'Universitas', '', '', 'R.Ketua Bagian Perpustakaan', 1, 'Gedung Tamansari 1', 0, ''),
(39, 10120039, 'Universitas', '', '', 'R.Himpunan Pengusaha Muda Indonesia Unisba', 1, 'Gedung Tamansari 1', 0, ''),
(40, 10120040, 'Universitas', '', '', 'R.Badan Operasional Monitoring Pendidikan Agama Islam', 1, 'Gedung Tamansari 1', 0, ''),
(41, 10120041, 'Universitas', '', '', 'R.Simpan Perpustakaan', 1, 'Gedung Tamansari 1', 0, ''),
(42, 10120042, 'Universitas', '', '', 'R.Koperasi Mandiri 01', 1, 'Gedung Tamansari 1', 0, ''),
(43, 10120043, 'Universitas', '', '', 'R.Koperasi Mandiri 02', 1, 'Gedung Tamansari 1', 0, ''),
(44, 10120043, 'Universitas', '', '', 'R.Stok Buku', 2, 'Gedung Tamansari 1', 0, ''),
(45, 10120043, 'Universitas', '', '', 'R.Baca', 2, 'Gedung Tamansari 1', 0, ''),
(46, 10120043, 'Universitas', '', '', 'Masjid Al Syari', 2, 'Gedung Tamansari 1', 0, ''),
(47, 10120043, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', '', 'Plaza', 2, 'Gedung Tamansari 1', 0, ''),
(48, 10120043, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', '', 'Tempat Penitipan', 2, 'Gedung Tamansari 2', 0, ''),
(49, 10120043, 'Universitas', '', '', 'R. FCC', 0, 'Gedung Kedokteran', 0, ''),
(50, 10120043, 'Universitas', '', '', 'Smoke Lobby', 0, 'Gedung Kedokteran', 0, ''),
(51, 10120043, 'Universitas', '', '', 'Power House', 0, 'Gedung Kedokteran', 0, ''),
(52, 10120043, 'Universitas', '', '', 'Genset', 0, 'Gedung Kedokteran', 0, ''),
(53, 10120043, 'Universitas', '', '', 'Panel', 0, 'Gedung Kedokteran', 0, ''),
(54, 10120043, 'Universitas', '', '', 'Shaft', 0, 'Gedung Kedokteran', 0, ''),
(55, 0, '', '', '', 'R Pompa', 0, 'Gedung Kedokteran', 0, ''),
(56, 0, '', '', '', 'R Gudang - 01', 0, 'Gedung Kedokteran', 0, ''),
(57, 0, '', '', '', 'R Gudang - 02', 0, 'Gedung Kedokteran', 0, ''),
(58, 0, '', '', '', 'R Gudang - 03', 0, 'Gedung Kedokteran', 0, ''),
(59, 0, '', '', '', 'Toilet Wanita', 0, 'Gedung Kedokteran', 0, ''),
(60, 0, '', '', '', 'Toilet Pria', 0, 'Gedung Kedokteran', 0, ''),
(61, 0, '', '', '', 'T. Wudhu', 0, 'Gedung Kedokteran', 0, ''),
(62, 0, '', '', '', 'Mushola', 0, 'Gedung Kedokteran', 0, ''),
(63, 0, '', '', '', '', 0, 'Gedung Kedokteran', 0, ''),
(64, 10070001, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 01', 4, 'Gedung Dekanat', 0, ''),
(65, 10070002, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 02', 4, 'Gedung Dekanat', 0, ''),
(66, 10070003, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 03', 4, 'Gedung Dekanat', 0, ''),
(67, 10070004, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 04', 4, 'Gedung Dekanat', 0, ''),
(68, 10070005, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 05', 4, 'Gedung Dekanat', 0, ''),
(69, 10070006, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 06', 4, 'Gedung Dekanat', 0, ''),
(70, 10070007, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 07', 4, 'Gedung Dekanat', 0, ''),
(71, 10070008, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 08', 4, 'Gedung Dekanat', 0, ''),
(72, 10070009, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 09', 4, 'Gedung Dekanat', 0, ''),
(73, 10070010, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 10', 4, 'Gedung Dekanat', 0, ''),
(74, 10070011, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 11', 4, 'Gedung Dekanat', 0, ''),
(75, 10070012, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 12', 4, 'Gedung Dekanat', 0, ''),
(76, 10070013, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 13', 4, 'Gedung Dekanat', 0, ''),
(77, 10070014, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 14', 4, 'Gedung Dekanat', 0, ''),
(78, 10070015, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 15', 4, 'Gedung Dekanat', 0, ''),
(79, 10070016, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 16', 4, 'Gedung Dekanat', 0, ''),
(80, 10070017, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 17', 4, 'Gedung Dekanat', 0, ''),
(81, 10070018, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 18', 4, 'Gedung Dekanat', 0, ''),
(82, 10070019, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 19', 4, 'Gedung Dekanat', 0, ''),
(83, 10070020, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 20', 4, 'Gedung Dekanat', 0, ''),
(84, 10070021, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 21', 4, 'Gedung Dekanat', 0, ''),
(85, 10070022, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 22', 4, 'Gedung Dekanat', 0, ''),
(86, 10070023, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 23', 4, 'Gedung Dekanat', 0, ''),
(87, 10070024, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 24', 4, 'Gedung Dekanat', 0, ''),
(88, 10070025, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 25', 4, 'Gedung Dekanat', 0, ''),
(89, 10070026, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 26', 4, 'Gedung Dekanat', 0, ''),
(90, 10070027, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 27', 4, 'Gedung Dekanat', 0, ''),
(91, 10070028, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 28', 4, 'Gedung Dekanat', 0, ''),
(92, 10070029, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 29', 4, 'Gedung Dekanat', 0, ''),
(93, 10070030, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 30', 4, 'Gedung Dekanat', 0, ''),
(94, 10070031, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 31', 5, 'Gedung Dekanat', 0, ''),
(95, 10070032, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 32', 5, 'Gedung Dekanat', 0, ''),
(96, 10070033, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 33', 5, 'Gedung Dekanat', 0, ''),
(97, 10070034, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 34', 5, 'Gedung Dekanat', 0, ''),
(98, 10070035, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 35', 5, 'Gedung Dekanat', 0, ''),
(99, 10070036, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 36', 5, 'Gedung Dekanat', 0, ''),
(100, 10070037, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 37', 5, 'Gedung Dekanat', 0, ''),
(101, 10070038, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 38', 5, 'Gedung Dekanat', 0, ''),
(102, 10070039, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 39', 5, 'Gedung Dekanat', 0, ''),
(103, 10070040, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 40', 5, 'Gedung Dekanat', 0, ''),
(104, 10070041, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 41', 5, 'Gedung Dekanat', 0, ''),
(105, 10070042, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 42', 5, 'Gedung Dekanat', 0, ''),
(106, 10070043, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 43', 5, 'Gedung Dekanat', 0, ''),
(107, 10070044, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 44', 5, 'Gedung Dekanat', 0, ''),
(108, 10070045, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 45', 5, 'Gedung Dekanat', 0, ''),
(109, 10070046, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 46', 5, 'Gedung Dekanat', 0, ''),
(110, 10070047, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 47', 5, 'Gedung Dekanat', 0, ''),
(111, 10070048, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 48', 5, 'Gedung Dekanat', 0, ''),
(112, 10070049, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 49', 5, 'Gedung Dekanat', 0, ''),
(113, 10070050, 'Fakultas Teknik', 'Sekretariat Fakultas', '', 'R. Dosen Teknik 50', 5, 'Gedung Dekanat', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(155) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('user','admin','developer') DEFAULT 'user',
  `refresh_token` varchar(512) DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `refresh_token`, `refresh_token_expires`, `created_at`) VALUES
(2, 'Administrator21', 'admin', '$2b$12$qv2TPHOyKDQOj1VwKm24G.AlR1D51KIfoGlUSMU4qtwdN83AS8V7u', 'admin', NULL, NULL, '2026-02-09 07:05:38'),
(10, 'lololo', 'lololo', '$2b$12$IW8bj4PI/yh4tfReMBsJfek88MO05C0rWaFHD6MPwF46n7DBMOsxi', 'user', NULL, NULL, '2026-02-24 04:50:24'),
(11, 'lololo2', 'lololo2', '$2b$12$YgplCy508nWe.H4B2Xm0au.EbBaBI5ph3A9gqPRg4mo7bdUf8Flsa', 'user', NULL, NULL, '2026-02-24 04:57:52'),
(12, 'anjas', 'anjas', '$2b$12$pL1ThtUn2rG75SHiygCNnOVAviaHp2TnQOcVJ7fLA0YGKj5dVIQ86', 'user', NULL, NULL, '2026-02-24 05:03:57'),
(13, 'kyo', 'kyoshiro1', '$2b$12$711yU/.I0lpWaWuKV25sB.nPzIvyRM7qVcxTmRIrlsK5UT0xqc12y', 'admin', NULL, NULL, '2026-02-26 02:03:08'),
(14, 'test', 'test', '$2b$12$yCFj1hAVeKTgZdwXJzBC3OU1sZiYAVltgrP5XXy2FfO8UOzS9Xqpm', 'user', NULL, NULL, '2026-02-26 02:03:49'),
(15, 'Pawbxj0x1', 'pawdosq', '$2b$12$LYkg.oK3Iu8ImOYdmkwmf.ancPX01VazlAXu67FBAfWCrbKNFnO/K', 'developer', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwYXdkb3NxIiwidHlwZSI6InJlZnJlc2giLCJleHAiOjE3NzM3NDQxOTR9.RwlowN7nc61vSwPIqYNE7hEfjmJwpfX02kHHvnQNlj8', '2026-03-17 10:43:14', '2026-02-26 04:40:47');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_status_alat`
-- (See below for the actual view)
--
CREATE TABLE `view_status_alat` (
`no` varchar(20)
,`Proteksi` enum('Hydrant','APAR')
,`Lantai` varchar(50)
,`Gedung` varchar(100)
,`Status_Alat` enum('Aktif','Tidak Aktif','Dalam Perbaikan')
,`Kondisi_Terakhir` enum('Baik','Perlu Perbaikan','Rusak')
,`Tekanan_Terakhir` varchar(50)
,`Terakhir_Dicek` date
,`Pemeriksa_Terakhir` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_summary_harian`
-- (See below for the actual view)
--
CREATE TABLE `view_summary_harian` (
`Tanggal` date
,`Jumlah_Alat_Dicek` bigint(21)
,`Kondisi_Baik` bigint(21)
,`Perlu_Perbaikan` bigint(21)
,`Rusak` bigint(21)
,`Pemeriksa` mediumtext
);

-- --------------------------------------------------------

--
-- Structure for view `view_status_alat`
--
DROP TABLE IF EXISTS `view_status_alat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_status_alat`  AS SELECT `ha`.`no` AS `no`, `ha`.`Proteksi` AS `Proteksi`, `ha`.`Lantai` AS `Lantai`, `ha`.`Gedung` AS `Gedung`, `ha`.`Status` AS `Status_Alat`, `hs`.`Kondisi` AS `Kondisi_Terakhir`, `hs`.`Tekanan` AS `Tekanan_Terakhir`, `hs`.`Tanggal_Pengecekan` AS `Terakhir_Dicek`, `hs`.`Pemeriksa` AS `Pemeriksa_Terakhir` FROM (`hydrant_apar` `ha` left join `history_hydrantapar` `hs` on(`ha`.`no` = `hs`.`no`)) WHERE `hs`.`id` = (select max(`history_hydrantapar`.`id`) from `history_hydrantapar` where `history_hydrantapar`.`no` = `ha`.`no`) OR `hs`.`id` is null ;

-- --------------------------------------------------------

--
-- Structure for view `view_summary_harian`
--
DROP TABLE IF EXISTS `view_summary_harian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_summary_harian`  AS SELECT cast(`hs`.`created_at` as date) AS `Tanggal`, count(distinct `hs`.`no`) AS `Jumlah_Alat_Dicek`, count(case when `hs`.`Kondisi` = 'Baik' then 1 end) AS `Kondisi_Baik`, count(case when `hs`.`Kondisi` = 'Perlu Perbaikan' then 1 end) AS `Perlu_Perbaikan`, count(case when `hs`.`Kondisi` = 'Rusak' then 1 end) AS `Rusak`, group_concat(distinct `hs`.`Pemeriksa` separator ',') AS `Pemeriksa` FROM `history_hydrantapar` AS `hs` GROUP BY cast(`hs`.`created_at` as date) ORDER BY cast(`hs`.`created_at` as date) DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_user`
--
ALTER TABLE `activity_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_message`
--
ALTER TABLE `custom_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_target_role` (`target_role`),
  ADD KEY `idx_target_username` (`target_username`),
  ADD KEY `idx_is_read` (`is_read`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_unread_role_user` (`is_read`,`target_role`,`target_username`);

--
-- Indexes for table `fk_ekonomi`
--
ALTER TABLE `fk_ekonomi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no` (`no`);

--
-- Indexes for table `fk_fikom`
--
ALTER TABLE `fk_fikom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fk_hukum`
--
ALTER TABLE `fk_hukum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fk_syariah`
--
ALTER TABLE `fk_syariah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fk_tarbiyah`
--
ALTER TABLE `fk_tarbiyah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fk_teknik`
--
ALTER TABLE `fk_teknik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_hydrantapar`
--
ALTER TABLE `history_hydrantapar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_no` (`no`),
  ADD KEY `idx_tanggal_pengecekan` (`Tanggal_Pengecekan`),
  ADD KEY `idx_expired_date` (`Expired_Date`),
  ADD KEY `idx_kondisi` (`Kondisi`),
  ADD KEY `idx_no_tanggal` (`no`,`Tanggal_Pengecekan`);

--
-- Indexes for table `hydrant_apar`
--
ALTER TABLE `hydrant_apar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no` (`no`),
  ADD KEY `idx_no` (`no`),
  ADD KEY `idx_proteksi` (`Proteksi`),
  ADD KEY `idx_gedung` (`Gedung`),
  ADD KEY `idx_status` (`Status`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_login_time` (`login_time`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `mainten`
--
ALTER TABLE `mainten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patch_notif`
--
ALTER TABLE `patch_notif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_is_active` (`is_active`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `univ`
--
ALTER TABLE `univ`
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
-- AUTO_INCREMENT for table `activity_user`
--
ALTER TABLE `activity_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_message`
--
ALTER TABLE `custom_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fk_ekonomi`
--
ALTER TABLE `fk_ekonomi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `fk_fikom`
--
ALTER TABLE `fk_fikom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `fk_hukum`
--
ALTER TABLE `fk_hukum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `fk_syariah`
--
ALTER TABLE `fk_syariah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `fk_tarbiyah`
--
ALTER TABLE `fk_tarbiyah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `fk_teknik`
--
ALTER TABLE `fk_teknik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `history_hydrantapar`
--
ALTER TABLE `history_hydrantapar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hydrant_apar`
--
ALTER TABLE `hydrant_apar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `mainten`
--
ALTER TABLE `mainten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patch_notif`
--
ALTER TABLE `patch_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `univ`
--
ALTER TABLE `univ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_hydrantapar`
--
ALTER TABLE `history_hydrantapar`
  ADD CONSTRAINT `history_hydrantapar_ibfk_1` FOREIGN KEY (`no`) REFERENCES `hydrant_apar` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD CONSTRAINT `login_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
