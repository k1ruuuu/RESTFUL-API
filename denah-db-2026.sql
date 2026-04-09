-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2026 at 06:53 AM
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
  `username` varchar(255) NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `waktu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_user`
--

INSERT INTO `activity_user` (`id`, `username`, `aktivitas`, `waktu`) VALUES
(28, 'admin', 'view user_list', '2026-03-12 13:40:50.565684'),
(29, 'admin', 'create user (ID: 18)', '2026-03-12 13:41:05.067136'),
(30, 'admin', 'view user_list', '2026-03-12 13:41:05.101044'),
(31, 'admin', 'view user_list', '2026-03-12 14:11:52.385306'),
(32, 'admin', 'view user_list', '2026-03-12 14:14:09.846844'),
(33, 'admin', 'view user_list', '2026-03-12 14:25:12.997051'),
(34, 'admin', 'delete user (ID: 18)', '2026-03-12 14:26:03.328295'),
(35, 'admin', 'deleted_user_test2_id_18', '2026-03-12 14:26:03.515181'),
(36, 'admin', 'view user_list', '2026-03-12 14:26:03.539116'),
(37, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:47.976144'),
(38, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:48.486412'),
(39, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:48.908297'),
(40, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:49.042454'),
(41, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:49.411934'),
(42, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:49.506680'),
(43, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:49.577502'),
(44, 'admin', 'view hydrant_apar_list', '2026-03-12 14:36:49.623370'),
(45, 'admin', 'view user_list', '2026-03-12 14:36:50.456404'),
(46, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:18.101740'),
(47, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:18.336372'),
(48, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:18.381053'),
(49, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:18.423387'),
(50, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:40.836789'),
(51, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:41.333203'),
(52, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:41.600580'),
(53, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:41.708808'),
(54, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:41.801560'),
(55, 'admin', 'view hydrant_apar_list', '2026-03-12 14:37:41.849431'),
(56, 'admin', 'view user_list', '2026-03-12 14:37:43.882638'),
(57, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:10.483795'),
(58, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:10.644435'),
(59, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:10.675448'),
(60, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:11.008872'),
(61, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:40.164789'),
(62, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:40.356414'),
(63, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:40.786032'),
(64, 'admin', 'view hydrant_apar_list', '2026-03-12 14:38:40.871431'),
(65, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:10.218249'),
(66, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:10.384025'),
(67, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:10.809187'),
(68, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:10.855065'),
(69, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:40.297760'),
(70, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:40.465156'),
(71, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:40.577339'),
(72, 'admin', 'view hydrant_apar_list', '2026-03-12 14:39:40.885164'),
(73, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:10.220862'),
(74, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:10.369596'),
(75, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:10.797812'),
(76, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:10.865570'),
(77, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:40.217006'),
(78, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:40.526558'),
(79, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:40.743260'),
(80, 'admin', 'view hydrant_apar_list', '2026-03-12 14:40:41.025601'),
(81, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:10.174193'),
(82, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:10.359044'),
(83, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:10.803578'),
(84, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:10.855639'),
(85, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:40.184001'),
(86, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:40.363159'),
(87, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:40.863272'),
(88, 'admin', 'view hydrant_apar_list', '2026-03-12 14:41:40.927935'),
(89, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:10.242317'),
(90, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:10.711663'),
(91, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:10.790076'),
(92, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:10.825981'),
(93, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:40.225238'),
(94, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:40.637051'),
(95, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:40.797708'),
(96, 'admin', 'view hydrant_apar_list', '2026-03-12 14:42:41.205616'),
(97, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:11.675053'),
(98, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:12.614689'),
(99, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:12.787175'),
(100, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:12.977233'),
(101, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:40.038730'),
(102, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:40.100899'),
(103, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:41.535888'),
(104, 'admin', 'view hydrant_apar_list', '2026-03-12 14:43:42.068476'),
(105, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:11.128704'),
(106, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:11.197079'),
(107, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:11.253808'),
(108, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:11.283303'),
(109, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:40.373894'),
(110, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:41.473767'),
(111, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:41.822636'),
(112, 'admin', 'view hydrant_apar_list', '2026-03-12 14:44:42.236072'),
(113, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:11.103004'),
(114, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:11.201844'),
(115, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:11.247344'),
(116, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:11.277924'),
(117, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:41.115633'),
(118, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:41.192857'),
(119, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:41.240204'),
(120, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:41.281143'),
(121, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:52.432049'),
(122, 'admin', 'view hydrant_apar_list', '2026-03-12 14:45:52.578937'),
(123, 'admin', 'view hydrant_apar_list', '2026-03-12 14:46:22.853796'),
(124, 'admin', 'view hydrant_apar_list', '2026-03-12 14:46:22.892702'),
(125, 'admin', 'view hydrant_apar_list', '2026-03-12 14:46:52.917607'),
(126, 'admin', 'view hydrant_apar_list', '2026-03-12 14:46:52.965181'),
(127, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:06.813478'),
(128, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:06.864375'),
(129, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:22.867638'),
(130, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:22.926488'),
(131, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:52.965027'),
(132, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:53.011188'),
(133, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:57.866313'),
(134, 'admin', 'view hydrant_apar_list', '2026-03-12 14:47:58.068335'),
(135, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:11.093232'),
(136, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:11.154101'),
(137, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:23.079410'),
(138, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:23.121299'),
(139, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:41.126623'),
(140, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:41.171187'),
(141, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:53.078112'),
(142, 'admin', 'view hydrant_apar_list', '2026-03-12 14:48:53.113019'),
(143, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:07.402439'),
(144, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:07.561419'),
(145, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:07.659018'),
(146, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:07.689942'),
(147, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:08.409130'),
(148, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:08.567437'),
(149, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:08.774897'),
(150, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:08.811658'),
(151, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:27.145713'),
(152, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:27.298283'),
(153, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:39.074695'),
(154, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:39.140521'),
(155, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:57.208266'),
(156, 'admin', 'view hydrant_apar_list', '2026-03-12 14:50:57.370392'),
(157, 'admin', 'view hydrant_apar_list', '2026-03-12 14:51:09.111458'),
(158, 'admin', 'view hydrant_apar_list', '2026-03-12 14:51:09.189762'),
(159, 'admin', 'view hydrant_apar_list', '2026-03-12 14:51:27.073983'),
(160, 'admin', 'view hydrant_apar_list', '2026-03-12 14:51:27.132824'),
(161, 'admin', 'view hydrant_apar_list', '2026-03-12 14:51:39.117118'),
(162, 'admin', 'view hydrant_apar_list', '2026-03-12 14:51:39.179951'),
(163, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:05.553530'),
(164, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:05.922066'),
(165, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:06.197322'),
(166, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:06.318997'),
(167, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:07.098275'),
(168, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:07.166339'),
(169, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:07.336579'),
(170, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:07.434211'),
(171, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:35.871460'),
(172, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:35.954083'),
(173, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:35.993241'),
(174, 'admin', 'view hydrant_apar_list', '2026-03-12 14:54:36.038266'),
(175, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:05.905574'),
(176, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:05.962196'),
(177, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:06.019453'),
(178, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:06.047039'),
(179, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:35.874250'),
(180, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:35.935685'),
(181, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:35.997693'),
(182, 'admin', 'view hydrant_apar_list', '2026-03-12 14:55:36.027533'),
(183, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:05.081129'),
(184, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:05.255282'),
(185, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:05.326269'),
(186, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:05.365163'),
(187, 'admin', 'view history_hydrant_apar_list', '2026-03-12 14:56:29.876390'),
(188, 'admin', 'view user_list', '2026-03-12 14:56:31.606086'),
(189, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:35.252485'),
(190, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:35.357260'),
(191, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:35.478373'),
(192, 'admin', 'view hydrant_apar_list', '2026-03-12 14:56:35.528680'),
(193, 'admin', 'view history_hydrant_apar_list', '2026-03-12 14:56:46.455212'),
(194, 'admin', 'view user_list', '2026-03-12 14:56:51.282906'),
(195, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:05.461120'),
(196, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:05.510211'),
(197, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:05.724418'),
(198, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:05.761347'),
(199, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:35.197894'),
(200, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:35.303897'),
(201, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:35.384598'),
(202, 'admin', 'view hydrant_apar_list', '2026-03-12 14:57:35.428070'),
(203, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:06.119819'),
(204, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:06.213569'),
(205, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:06.256270'),
(206, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:06.273046'),
(207, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:36.107358'),
(208, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:36.193034'),
(209, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:36.240237'),
(210, 'admin', 'view hydrant_apar_list', '2026-03-12 14:58:36.270810'),
(211, 'admin', 'view hydrant_apar_list', '2026-03-12 14:59:06.882512'),
(212, 'admin', 'view hydrant_apar_list', '2026-03-12 14:59:06.933185'),
(213, 'admin', 'view hydrant_apar_list', '2026-03-12 14:59:06.974109'),
(214, 'admin', 'view hydrant_apar_list', '2026-03-12 14:59:06.994804'),
(215, 'admin', 'view hydrant_apar_list', '2026-03-12 15:00:06.944248'),
(216, 'admin', 'view hydrant_apar_list', '2026-03-12 15:00:07.001046'),
(217, 'admin', 'view hydrant_apar_list', '2026-03-12 15:00:07.044734'),
(218, 'admin', 'view hydrant_apar_list', '2026-03-12 15:00:07.075657'),
(219, 'admin', 'view hydrant_apar_list', '2026-03-12 15:01:06.874822'),
(220, 'admin', 'view hydrant_apar_list', '2026-03-12 15:01:06.924364'),
(221, 'admin', 'view hydrant_apar_list', '2026-03-12 15:01:06.964732'),
(222, 'admin', 'view hydrant_apar_list', '2026-03-12 15:01:06.991301'),
(223, 'admin', 'view hydrant_apar_list', '2026-03-12 15:02:06.901953'),
(224, 'admin', 'view hydrant_apar_list', '2026-03-12 15:02:06.956194'),
(225, 'admin', 'view hydrant_apar_list', '2026-03-12 15:02:07.011969'),
(226, 'admin', 'view hydrant_apar_list', '2026-03-12 15:02:07.037690'),
(227, 'admin', 'view hydrant_apar_list', '2026-03-12 15:03:06.874354'),
(228, 'admin', 'view hydrant_apar_list', '2026-03-12 15:03:06.936396'),
(229, 'admin', 'view hydrant_apar_list', '2026-03-12 15:03:06.983322'),
(230, 'admin', 'view hydrant_apar_list', '2026-03-12 15:03:07.032520'),
(231, 'admin', 'view hydrant_apar_list', '2026-03-12 15:04:06.897358'),
(232, 'admin', 'view hydrant_apar_list', '2026-03-12 15:04:07.063576'),
(233, 'admin', 'view hydrant_apar_list', '2026-03-12 15:04:07.244777'),
(234, 'admin', 'view hydrant_apar_list', '2026-03-12 15:04:07.278397'),
(235, 'admin', 'view hydrant_apar_list', '2026-03-12 15:05:06.911918'),
(236, 'admin', 'view hydrant_apar_list', '2026-03-12 15:05:06.988324'),
(237, 'admin', 'view hydrant_apar_list', '2026-03-12 15:05:07.038023'),
(238, 'admin', 'view hydrant_apar_list', '2026-03-12 15:05:07.075568'),
(239, 'admin', 'view hydrant_apar_list', '2026-03-12 15:06:06.893491'),
(240, 'admin', 'view hydrant_apar_list', '2026-03-12 15:06:06.955154'),
(241, 'admin', 'view hydrant_apar_list', '2026-03-12 15:06:06.992800'),
(242, 'admin', 'view hydrant_apar_list', '2026-03-12 15:06:07.066838'),
(243, 'admin', 'view hydrant_apar_list', '2026-03-12 15:07:06.956245'),
(244, 'admin', 'view hydrant_apar_list', '2026-03-12 15:07:07.026886'),
(245, 'admin', 'view hydrant_apar_list', '2026-03-12 15:07:07.134256'),
(246, 'admin', 'view hydrant_apar_list', '2026-03-12 15:07:07.187756'),
(247, 'admin', 'view hydrant_apar_list', '2026-03-12 15:08:06.894499'),
(248, 'admin', 'view hydrant_apar_list', '2026-03-12 15:08:06.947375'),
(249, 'admin', 'view hydrant_apar_list', '2026-03-12 15:08:06.994924'),
(250, 'admin', 'view hydrant_apar_list', '2026-03-12 15:08:07.017324'),
(251, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:38.731699'),
(252, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:38.843236'),
(253, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:38.996417'),
(254, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:39.094081'),
(255, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:39.195790'),
(256, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:39.251724'),
(257, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:39.285181'),
(258, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:39.317731'),
(259, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:46.163989'),
(260, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:57:46.294247'),
(261, 'pawdosq', 'view history_hydrant_apar_list', '2026-03-13 10:57:47.196198'),
(262, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:09.436912'),
(263, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:09.492089'),
(264, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:09.519488'),
(265, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:09.549216'),
(266, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:39.457563'),
(267, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:39.530144'),
(268, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:39.570640'),
(269, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:58:39.597183'),
(270, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:09.438869'),
(271, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:09.529679'),
(272, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:09.596576'),
(273, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:09.630926'),
(274, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:39.455197'),
(275, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:39.574039'),
(276, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:39.624686'),
(277, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 10:59:39.658042'),
(278, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:09.487866'),
(279, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:09.568139'),
(280, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:09.637697'),
(281, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:09.666969'),
(282, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:39.500773'),
(283, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:39.549070'),
(284, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:39.695742'),
(285, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:00:39.725835'),
(286, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:08.879567'),
(287, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:08.998411'),
(288, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:09.048959'),
(289, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:09.102422'),
(290, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:39.558602'),
(291, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:39.640678'),
(292, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:39.663760'),
(293, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:01:39.898330'),
(294, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:02:09.442870'),
(295, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:02:09.521418'),
(296, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:02:09.550880'),
(297, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:02:09.601612'),
(298, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:03:07.338623'),
(299, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:03:07.419694'),
(300, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:03:07.472648'),
(301, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:03:07.537236'),
(302, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:03.491112'),
(303, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:03.564391'),
(304, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:03.632618'),
(305, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:03.673573'),
(306, 'pawdosq', 'view user_list', '2026-03-13 11:04:07.153863'),
(307, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:08.538558'),
(308, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:08.641768'),
(309, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:08.711616'),
(310, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:08.768292'),
(311, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:39.250372'),
(312, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:39.365820'),
(313, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:39.405509'),
(314, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:04:39.468159'),
(315, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:09.254642'),
(316, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:09.319471'),
(317, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:09.359880'),
(318, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:09.437203'),
(319, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:39.319033'),
(320, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:39.391134'),
(321, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:39.474911'),
(322, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:05:39.550760'),
(323, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:07:07.562612'),
(324, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:07:07.620453'),
(325, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:07:07.655358'),
(326, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:07:07.685278'),
(327, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:07.610290'),
(328, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:07.739630'),
(329, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:07.828904'),
(330, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:07.849475'),
(331, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:24.142474'),
(332, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:24.502604'),
(333, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:24.578071'),
(334, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:24.711315'),
(335, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:24.746787'),
(336, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:24.769452'),
(337, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:54.349367'),
(338, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:54.424656'),
(339, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:54.447425'),
(340, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:08:54.534525'),
(341, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:24.417894'),
(342, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:24.544758'),
(343, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:24.571933'),
(344, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:24.626946'),
(345, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.082167'),
(346, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.185157'),
(347, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.283812'),
(348, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.349758'),
(349, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.448626'),
(350, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.482191'),
(351, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.600686'),
(352, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:09:33.652977'),
(353, 'pawdosq', 'view user_list', '2026-03-13 11:09:39.198733'),
(354, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:03.055533'),
(355, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:03.152348'),
(356, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:03.195388'),
(357, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:03.215553'),
(358, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:33.075563'),
(359, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:33.142198'),
(360, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:33.187878'),
(361, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:10:33.242515'),
(362, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:03.169254'),
(363, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:03.241236'),
(364, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:03.318716'),
(365, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:03.348161'),
(366, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:33.060106'),
(367, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:33.136546'),
(368, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:33.183425'),
(369, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:11:33.279723'),
(370, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:03.062580'),
(371, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:03.163087'),
(372, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:03.196877'),
(373, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:03.232910'),
(374, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:33.042610'),
(375, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:33.133270'),
(376, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:33.174925'),
(377, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:12:33.251906'),
(378, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:03.039880'),
(379, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:03.094384'),
(380, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:03.150563'),
(381, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:03.183785'),
(382, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:33.051161'),
(383, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:33.161764'),
(384, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:33.213763'),
(385, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:13:33.276424'),
(386, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:03.166748'),
(387, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:03.239119'),
(388, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:03.313377'),
(389, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:03.349318'),
(390, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:33.041877'),
(391, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:33.119796'),
(392, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:33.191009'),
(393, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:14:33.245373'),
(394, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:03.051655'),
(395, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:03.145990'),
(396, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:03.185614'),
(397, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:03.218667'),
(398, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:33.068529'),
(399, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:33.163098'),
(400, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:33.187156'),
(401, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:15:33.237394'),
(402, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:03.048937'),
(403, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:03.160402'),
(404, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:03.201255'),
(405, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:03.239730'),
(406, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:33.239905'),
(407, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:33.354474'),
(408, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:33.401971'),
(409, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:16:33.455166'),
(410, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:03.269653'),
(411, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:03.367556'),
(412, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:03.406453'),
(413, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:03.456347'),
(414, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:33.203293'),
(415, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:33.276653'),
(416, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:33.318539'),
(417, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:17:33.344476'),
(418, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:03.209166'),
(419, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:03.292678'),
(420, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:03.327586'),
(421, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:03.359501'),
(422, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:33.118399'),
(423, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:33.192179'),
(424, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:33.247801'),
(425, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:18:33.293719'),
(426, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:03.069886'),
(427, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:03.135219'),
(428, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:03.197186'),
(429, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:03.255678'),
(430, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:33.071339'),
(431, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:33.264662'),
(432, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:33.335552'),
(433, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:19:33.373000'),
(434, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:03.331452'),
(435, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:03.431926'),
(436, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:03.467345'),
(437, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:03.494890'),
(438, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:33.339477'),
(439, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:33.424019'),
(440, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:33.460613'),
(441, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:20:33.488536'),
(442, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:03.641332'),
(443, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:03.754184'),
(444, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:03.786285'),
(445, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:03.819387'),
(446, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:34.000890'),
(447, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:34.062242'),
(448, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:34.367312'),
(449, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:21:34.384840'),
(450, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:03.950241'),
(451, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:04.211544'),
(452, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:04.247868'),
(453, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:04.372536'),
(454, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:16.254831'),
(455, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:16.358072'),
(456, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:16.698039'),
(457, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:16.761868'),
(458, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:16.858610'),
(459, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:16.924979'),
(460, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:17.071595'),
(461, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:17.125444'),
(462, 'pawdosq', 'view user_list', '2026-03-13 11:22:28.862056'),
(463, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:47.306212'),
(464, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:47.417748'),
(465, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:47.459867'),
(466, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:47.488795'),
(467, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:51.755625'),
(468, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:22:51.941137'),
(469, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:03.782790'),
(470, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:03.937580'),
(471, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:04.171125'),
(472, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:04.269318'),
(473, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:04.474742'),
(474, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:04.554628'),
(475, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:04.707865'),
(476, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:04.777212'),
(477, 'pawdosq', 'view user_list', '2026-03-13 11:23:06.181052'),
(478, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:33.938863'),
(479, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:34.085627'),
(480, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:34.179388'),
(481, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:23:34.305470'),
(482, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:03.797020'),
(483, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:04.015126'),
(484, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:04.092506'),
(485, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:04.154564'),
(486, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:33.704439'),
(487, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:33.922029'),
(488, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:34.126008'),
(489, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:24:34.197243'),
(490, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:04.472619'),
(491, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:04.567867'),
(492, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:04.605752'),
(493, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:04.652507'),
(494, 'pawdosq', 'create user (ID: 19)', '2026-03-13 11:25:32.132714'),
(495, 'pawdosq', 'view user_list', '2026-03-13 11:25:32.179506'),
(496, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:34.283554'),
(497, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:34.364943'),
(498, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:34.417905'),
(499, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:25:34.466073'),
(500, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.248623'),
(501, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.358897'),
(502, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.494501'),
(503, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.523520'),
(504, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.610592'),
(505, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.715189'),
(506, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.856763'),
(507, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:04.912565'),
(508, 'admin', 'view user_list', '2026-03-13 11:26:07.717108'),
(509, 'admin', 'create user (ID: 20)', '2026-03-13 11:26:33.733231'),
(510, 'admin', 'view user_list', '2026-03-13 11:26:33.749742'),
(511, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:36.905965'),
(512, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:36.977106'),
(513, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:37.063026'),
(514, 'admin', 'view hydrant_apar_list', '2026-03-13 11:26:37.098100'),
(515, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.079883'),
(516, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.242241'),
(517, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.353734'),
(518, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.374535'),
(519, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.472084'),
(520, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.551185'),
(521, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.634672'),
(522, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:20.696442'),
(523, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:26.252118'),
(524, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:27:26.291090'),
(525, 'victim1', 'view history_hydrant_apar_list', '2026-03-13 11:27:28.259804'),
(526, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.364115'),
(527, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.458985'),
(528, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.553677'),
(529, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.596633'),
(530, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.822583'),
(531, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.854848'),
(532, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.933720'),
(533, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:27:58.996789'),
(534, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:28.449551'),
(535, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:28.524082'),
(536, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:28.563279'),
(537, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:28.595941'),
(538, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:58.561283'),
(539, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:58.660253'),
(540, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:58.741146'),
(541, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:28:58.788774'),
(542, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:28.486540'),
(543, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:28.566902'),
(544, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:28.600338'),
(545, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:28.614078'),
(546, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:58.469961'),
(547, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:58.550816'),
(548, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:58.583981'),
(549, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:29:58.626591'),
(550, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:28.488621'),
(551, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:28.561238'),
(552, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:28.594149'),
(553, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:28.629307'),
(554, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:58.457580'),
(555, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:58.571825'),
(556, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:58.606501'),
(557, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:30:58.669519'),
(558, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:04.460309'),
(559, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:04.786870'),
(560, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:04.875347'),
(561, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:05.209822'),
(562, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:05.335957'),
(563, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:05.450447'),
(564, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:34.144218'),
(565, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:34.199930'),
(566, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:34.644177'),
(567, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:38:34.672673'),
(568, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:04.436522'),
(569, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:04.485823'),
(570, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:04.641845'),
(571, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:04.694127'),
(572, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:34.195508'),
(573, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:34.236133'),
(574, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:35.150805'),
(575, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:39:35.204378'),
(576, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:01.468104'),
(577, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:02.282929'),
(578, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:02.818014'),
(579, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:03.017095'),
(580, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:03.199608'),
(581, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:03.253464'),
(582, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:05.520408'),
(583, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:05.685483'),
(584, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:05.736347'),
(585, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:05.781229'),
(586, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:06.548825'),
(587, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:06.703412'),
(588, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:06.774224'),
(589, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:06.903879'),
(590, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:27.467479'),
(591, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:28.065723'),
(592, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:28.465316'),
(593, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:28.847608'),
(594, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:28.949336'),
(595, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:29.133895'),
(596, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:29.173789'),
(597, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:29.196728'),
(598, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:33.986925'),
(599, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:34.162458'),
(600, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:34.298095'),
(601, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:40:34.366426'),
(602, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:49.210630'),
(603, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:49.431039'),
(604, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:49.574657'),
(605, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:49.646465'),
(606, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:49.713999'),
(607, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:49.759878'),
(608, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:55.777665'),
(609, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:56.341158'),
(610, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:56.391024'),
(611, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:56.493751'),
(612, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:56.574534'),
(613, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:40:56.628390'),
(614, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:01.575945'),
(615, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:01.789391'),
(616, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:02.129497'),
(617, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:02.227237'),
(618, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:02.394309'),
(619, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:02.461129'),
(620, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:02.576820'),
(621, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:02.687535'),
(622, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:02.745370'),
(623, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:02.795238'),
(624, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:31.298068'),
(625, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:31.438502'),
(626, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:31.485433'),
(627, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:41:31.721827'),
(628, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:31.806600'),
(629, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:31.904636'),
(630, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:31.956497'),
(631, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:41:32.020390'),
(632, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:01.369046'),
(633, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:01.463371'),
(634, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:01.553463'),
(635, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:01.688050'),
(636, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:01.800420'),
(637, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:01.914718'),
(638, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:01.977962'),
(639, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:02.016913'),
(640, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:31.314827'),
(641, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:31.432543'),
(642, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:31.498369'),
(643, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:42:31.647969'),
(644, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:31.777093'),
(645, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:31.863861'),
(646, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:31.908740'),
(647, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:42:31.978567'),
(648, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:01.728113'),
(649, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:01.861772'),
(650, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:02.063217'),
(651, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:02.335490'),
(652, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:31.666933'),
(653, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:31.753701'),
(654, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:31.803567'),
(655, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:43:31.904298'),
(656, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:01.683002'),
(657, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:01.784728'),
(658, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:01.846564'),
(659, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:01.919370'),
(660, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:32.476485'),
(661, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:32.586808'),
(662, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:32.641558'),
(663, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:32.660295'),
(664, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:35.342170'),
(665, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:35.745259'),
(666, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:53.186280'),
(667, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:44:53.236892'),
(668, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:02.499374'),
(669, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:02.535403'),
(670, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:12.767893'),
(671, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:12.941523'),
(672, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:31.616109'),
(673, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:31.675138'),
(674, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:39.249883'),
(675, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:39.749070'),
(676, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:39.884708'),
(677, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:45:40.069215'),
(678, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:03.685555'),
(679, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:03.887017'),
(680, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:04.013679'),
(681, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:04.170261'),
(682, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:33.524657'),
(683, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:33.591782'),
(684, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:33.649296'),
(685, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:33.711465'),
(686, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:43.080669'),
(687, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:43.308572'),
(688, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:43.431246'),
(689, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:46:43.644677'),
(690, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:04.088751'),
(691, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:04.209427'),
(692, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:04.730553'),
(693, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:04.889129'),
(694, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:20.460329'),
(695, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:20.688719'),
(696, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:20.924093'),
(697, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:20.976950'),
(698, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:49.888213'),
(699, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:49.971974'),
(700, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:50.035804'),
(701, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:47:50.089660'),
(702, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:19.680326'),
(703, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:19.747170'),
(704, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:19.810999'),
(705, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:19.846126'),
(706, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:37.731434'),
(707, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:37.864064'),
(708, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:44.678409'),
(709, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:44.760705'),
(710, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:49.290537'),
(711, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:48:49.357401'),
(712, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:00.311232'),
(713, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:00.462828'),
(714, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:19.992099'),
(715, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:20.036981'),
(716, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:30.042557'),
(717, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:30.134162'),
(718, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:37.849788'),
(719, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:38.052247'),
(720, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:49.601422'),
(721, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:49:49.639319'),
(722, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:07.810009'),
(723, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:07.847198'),
(724, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:19.819277'),
(725, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:19.934677'),
(726, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:21.879126'),
(727, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:21.940976'),
(728, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:33.776579'),
(729, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:33.913215');
INSERT INTO `activity_user` (`id`, `username`, `aktivitas`, `waktu`) VALUES
(730, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:43.095047'),
(731, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:43.661535'),
(732, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:45.672139'),
(733, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:45.758907'),
(734, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:46.915821'),
(735, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:47.211041'),
(736, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:47.309767'),
(737, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:50:47.448404'),
(738, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:12.105936'),
(739, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:12.238582'),
(740, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:12.421607'),
(741, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:12.662963'),
(742, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:12.821064'),
(743, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:13.062424'),
(744, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:13.100321'),
(745, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:13.146196'),
(746, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:16.969862'),
(747, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:17.047668'),
(748, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:17.094543'),
(749, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:17.156489'),
(750, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:42.019238'),
(751, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:42.125082'),
(752, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:42.171481'),
(753, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:51:42.206388'),
(754, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:47.074358'),
(755, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:47.233254'),
(756, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:47.298818'),
(757, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:51:47.373676'),
(758, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:12.632939'),
(759, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:12.750626'),
(760, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:12.898231'),
(761, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:14.484002'),
(762, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:14.680479'),
(763, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:15.029546'),
(764, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:15.069442'),
(765, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:15.169174'),
(766, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:15.211063'),
(767, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:15.333746'),
(768, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:15.390583'),
(769, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:16.894926'),
(770, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:17.011201'),
(771, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:17.078014'),
(772, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:17.127881'),
(773, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:44.708430'),
(774, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:44.841719'),
(775, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:44.881612'),
(776, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:52:44.942292'),
(777, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:46.839112'),
(778, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:46.898481'),
(779, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:46.939416'),
(780, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:52:46.993335'),
(781, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:14.477562'),
(782, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:14.610209'),
(783, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:14.676033'),
(784, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:14.708749'),
(785, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:16.838216'),
(786, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:17.028509'),
(787, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:17.061538'),
(788, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:17.100117'),
(789, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:44.703736'),
(790, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:44.788414'),
(791, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:44.837057'),
(792, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:53:44.886068'),
(793, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:46.851440'),
(794, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:46.940038'),
(795, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:47.003994'),
(796, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:53:47.035857'),
(797, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:14.699446'),
(798, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:14.803232'),
(799, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:14.884205'),
(800, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:14.927263'),
(801, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:16.784354'),
(802, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:16.849765'),
(803, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:16.877734'),
(804, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:16.901261'),
(805, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:44.680348'),
(806, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:44.777721'),
(807, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:44.832703'),
(808, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:54:44.879577'),
(809, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:46.830647'),
(810, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:47.021813'),
(811, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:47.099669'),
(812, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:54:47.143834'),
(813, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:14.710835'),
(814, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:14.795609'),
(815, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:14.872606'),
(816, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:14.926560'),
(817, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:55:16.793575'),
(818, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:55:16.869437'),
(819, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:55:16.920036'),
(820, 'victim1', 'view hydrant_apar_list', '2026-03-13 11:55:16.976829'),
(821, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:44.700655'),
(822, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:44.806356'),
(823, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:44.857221'),
(824, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:55:44.925068'),
(825, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:14.692192'),
(826, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:14.766044'),
(827, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:14.817882'),
(828, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:14.867726'),
(829, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:44.676954'),
(830, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:44.877420'),
(831, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:44.936018'),
(832, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:56:45.008952'),
(833, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:14.690402'),
(834, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:14.779666'),
(835, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:14.856052'),
(836, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:14.919262'),
(837, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:44.679959'),
(838, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:44.753519'),
(839, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:44.852378'),
(840, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:57:44.922700'),
(841, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:14.681012'),
(842, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:14.803207'),
(843, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:14.833132'),
(844, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:14.904341'),
(845, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:44.698645'),
(846, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:44.949127'),
(847, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:44.977971'),
(848, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:58:45.045871'),
(849, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:14.789166'),
(850, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:14.874417'),
(851, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:14.907442'),
(852, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:15.011700'),
(853, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:44.706635'),
(854, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:44.774456'),
(855, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:44.836918'),
(856, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 11:59:44.885972'),
(857, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:14.702650'),
(858, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:14.801386'),
(859, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:14.869325'),
(860, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:14.931285'),
(861, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:44.658833'),
(862, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:44.782160'),
(863, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:44.826047'),
(864, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:00:44.883972'),
(865, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:14.779698'),
(866, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:14.895174'),
(867, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:14.960497'),
(868, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:14.995394'),
(869, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:44.752558'),
(870, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:44.839379'),
(871, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:44.888825'),
(872, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:01:44.940265'),
(873, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:14.686719'),
(874, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:14.928241'),
(875, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:14.970787'),
(876, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:15.016455'),
(877, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:44.682309'),
(878, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:44.780392'),
(879, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:44.817903'),
(880, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:02:44.895950'),
(881, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:14.708579'),
(882, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:14.808108'),
(883, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:14.862960'),
(884, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:14.910834'),
(885, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:44.671948'),
(886, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:44.786482'),
(887, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:44.906567'),
(888, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:03:44.937486'),
(889, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:14.787726'),
(890, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:14.896435'),
(891, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:14.955387'),
(892, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:15.035058'),
(893, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:44.674967'),
(894, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:44.767910'),
(895, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:44.874619'),
(896, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:04:44.910051'),
(897, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:14.679622'),
(898, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:14.806595'),
(899, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:14.844004'),
(900, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:14.896246'),
(901, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:44.678879'),
(902, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:44.777043'),
(903, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:44.842426'),
(904, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 12:05:44.874438'),
(905, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:57.934547'),
(906, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:58.138047'),
(907, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:58.308506'),
(908, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:58.469134'),
(909, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:58.852808'),
(910, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:58.951267'),
(911, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:58.973207'),
(912, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:30:59.000137'),
(913, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:28.562311'),
(914, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:28.950272'),
(915, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:29.064699'),
(916, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:29.120551'),
(917, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:58.676286'),
(918, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:58.697037'),
(919, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:58.723965'),
(920, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:31:58.766291'),
(921, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:28.520543'),
(922, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:28.572968'),
(923, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:28.638130'),
(924, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:28.681198'),
(925, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:58.591821'),
(926, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:58.653657'),
(927, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:58.740495'),
(928, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:32:58.839232'),
(929, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:28.531667'),
(930, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:28.628936'),
(931, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:28.667291'),
(932, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:28.698040'),
(933, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:58.567589'),
(934, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:58.649440'),
(935, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:58.686344'),
(936, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:33:58.730234'),
(937, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:28.529479'),
(938, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:28.574906'),
(939, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:28.655492'),
(940, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:28.683583'),
(941, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:58.525622'),
(942, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:58.665102'),
(943, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:58.701704'),
(944, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:34:58.733652'),
(945, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:07.386119'),
(946, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:07.457859'),
(947, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:07.510659'),
(948, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:07.539111'),
(949, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:16.793882'),
(950, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:17.406829'),
(951, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:17.751938'),
(952, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:17.797655'),
(953, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:47.589519'),
(954, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:36:47.772422'),
(955, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:01.014692'),
(956, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:01.120149'),
(957, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:03.225630'),
(958, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:03.288238'),
(959, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:20.562915'),
(960, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:20.863718'),
(961, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:27.051439'),
(962, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:27.353079'),
(963, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:36.632451'),
(964, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:36.684310'),
(965, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:40.715723'),
(966, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:41.314398'),
(967, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:41.453099'),
(968, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:41.550352'),
(969, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:41.647095'),
(970, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:41.732866'),
(971, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:48.910949'),
(972, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:37:49.082075'),
(973, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:06.528692'),
(974, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:06.614012'),
(975, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:11.330842'),
(976, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:11.447634'),
(977, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:11.547969'),
(978, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:11.582932'),
(979, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:41.026465'),
(980, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:41.176758'),
(981, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:41.238729'),
(982, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:38:41.401457'),
(983, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:11.683737'),
(984, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:11.759049'),
(985, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:11.814745'),
(986, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:11.839087'),
(987, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:41.720845'),
(988, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:41.814726'),
(989, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:41.852299'),
(990, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:39:41.876435'),
(991, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:40:11.595377'),
(992, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:40:11.663349'),
(993, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:40:11.715052'),
(994, 'pawdosq', 'view hydrant_apar_list', '2026-03-13 15:40:11.826303'),
(995, 'pawdosq', 'view user_list', '2026-03-13 15:49:31.524369'),
(996, 'pawdosq', 'create user (ID: 21)', '2026-03-13 15:49:47.910787'),
(997, 'pawdosq', 'view user_list', '2026-03-13 15:49:48.016395'),
(998, 'pawdosq', 'view user_list', '2026-03-13 15:54:36.502030'),
(999, 'pawdosq', 'create user (ID: 22)', '2026-03-13 15:55:31.110888'),
(1000, 'pawdosq', 'view user_list', '2026-03-13 15:55:31.150152'),
(1001, 'jes', 'view user_list', '2026-03-31 13:49:40.900897'),
(1002, 'jes', 'view user_list', '2026-04-01 11:50:23.876112'),
(1003, 'jes', 'view user_list', '2026-04-01 14:56:47.127431');

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
(112, 15, 'pawdosq', '2026-03-10 08:31:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 08:31:42', NULL),
(113, 15, 'pawdosq', '2026-03-10 10:16:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:16:31', NULL),
(114, 15, 'pawdosq', '2026-03-10 10:18:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:18:40', NULL),
(117, 15, 'pawdosq', '2026-03-10 10:21:21', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:21:21', NULL),
(120, 15, 'pawdosq', '2026-03-10 10:37:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:37:52', NULL),
(121, 15, 'pawdosq', '2026-03-10 10:43:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-10 10:43:14', NULL),
(131, 15, 'pawdosq', '2026-03-13 03:57:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 03:57:38', NULL),
(132, 15, 'pawdosq', '2026-03-13 04:09:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 04:09:32', NULL),
(133, 15, 'pawdosq', '2026-03-13 04:22:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 04:22:15', NULL),
(134, 15, 'pawdosq', '2026-03-13 04:23:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 04:23:02', NULL),
(139, 20, 'victim1', '2026-03-13 04:27:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-03-13 04:27:19', NULL),
(140, 15, 'pawdosq', '2026-03-13 04:27:57', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 04:27:57', NULL),
(141, 20, 'victim1', '2026-03-13 04:40:25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-03-13 04:40:25', NULL),
(142, 15, 'pawdosq', '2026-03-13 04:51:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 04:51:10', NULL),
(143, 15, 'pawdosq', '2026-03-13 08:30:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 08:30:56', NULL),
(144, 15, 'pawdosq', '2026-03-13 08:47:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 08:47:09', NULL),
(145, 20, 'victim1', '2026-03-13 08:48:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-03-13 08:48:00', NULL),
(146, 19, 'kyo', '2026-03-13 08:48:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJre', '2026-03-13 08:48:26', NULL),
(147, 20, 'victim1', '2026-03-13 08:52:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-03-13 08:52:30', NULL),
(148, 15, 'pawdosq', '2026-03-13 08:54:33', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-13 08:54:33', NULL),
(149, 20, 'victim1', '2026-03-13 08:57:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-03-13 08:57:22', NULL),
(150, 15, 'pawdosq', '2026-03-30 03:16:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-30 03:16:41', NULL),
(151, 15, 'pawdosq', '2026-03-30 06:09:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-30 06:09:40', NULL),
(152, 15, 'pawdosq', '2026-03-30 06:55:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-03-30 06:55:52', NULL),
(153, 21, 'jes', '2026-03-31 06:42:05', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ', '2026-03-31 06:42:05', NULL),
(154, 15, 'pawdosq', '2026-04-01 04:12:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-04-01 04:12:00', NULL),
(155, 21, 'jes', '2026-04-01 04:42:48', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ', '2026-04-01 04:42:48', NULL),
(156, 15, 'pawdosq', '2026-04-01 06:43:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-04-01 06:43:46', NULL),
(157, 20, 'victim1', '2026-04-01 06:44:53', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-04-01 06:44:53', NULL),
(158, 20, 'victim1', '2026-04-01 06:45:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2a', '2026-04-01 06:45:37', NULL),
(160, 21, 'jes', '2026-04-01 07:16:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ', '2026-04-01 07:16:50', NULL),
(161, 21, 'jes', '2026-04-01 07:56:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ', '2026-04-01 07:56:38', NULL),
(162, 15, 'pawdosq', '2026-04-09 03:37:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-04-09 03:37:36', NULL),
(163, 15, 'pawdosq', '2026-04-09 04:05:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwY', '2026-04-09 04:05:56', NULL),
(164, 21, 'jes', '2026-04-09 04:43:59', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'success', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZ', '2026-04-09 04:43:59', NULL);

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
(1, 0, 'Kami sedang melakukan pembaruan sistem. Mohon tunggu sebentar dan coba kembali.', 'jes', '2026-04-01 07:57:20', '2026-03-04 07:23:34');

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
  `no` int(11) NOT NULL,
  `fk` varchar(512) DEFAULT NULL,
  `subUnit` varchar(512) DEFAULT NULL,
  `Bagian` varchar(512) DEFAULT NULL,
  `ruangan` varchar(512) DEFAULT NULL,
  `lantai` varchar(50) DEFAULT NULL,
  `lokasi` varchar(512) DEFAULT NULL,
  `ukuranR` varchar(50) DEFAULT NULL,
  `ket` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `univ`
--

INSERT INTO `univ` (`id`, `no`, `fk`, `subUnit`, `Bagian`, `ruangan`, `lantai`, `lokasi`, `ukuranR`, `ket`) VALUES
(1, 10120001, 'Universitas', '', 'PSITEK', 'R. Rapat 1', '4', 'Gedung Dekanat', '', ''),
(2, 10120002, 'Universitas', '', 'PSITEK', 'R. Kepala Bagian 1', '4', 'Gedung Dekanat', '', ''),
(3, 10120003, 'Universitas', '', 'PSITEK', 'R. Pelayanan', '4', 'Gedung Dekanat', '', ''),
(4, 10120004, 'Universitas', '', 'PSITEK', 'R. Kasie', '4', 'Gedung Dekanat', '', ''),
(5, 10120005, 'Universitas', '', 'PSITEK', 'PSITEK', '4', 'Gedung Dekanat', '', ''),
(6, 10120006, 'Universitas', '', 'PSITEK', 'R. Administrasi', '4', 'Gedung Dekanat', '', ''),
(7, 10120007, 'Universitas', '', 'PSITEK', 'R. Server', '4', 'Gedung Dekanat', '', ''),
(8, 10120008, 'Universitas', '', 'PSITEK', 'R. ADM ', '4', 'Gedung Dekanat', '', ''),
(9, 10120009, 'Universitas', 'e-learning', '', 'R. Rapat 2', '4', 'Gedung Dekanat', '', ''),
(10, 10120010, 'Universitas', 'e-learning', '', 'E-LEARNING', '4', 'Gedung Dekanat', '', ''),
(11, 10120011, 'Universitas', 'e-learning', '', 'R. Kepala Bagian 2', '4', 'Gedung Dekanat', '', ''),
(12, 10120012, 'Universitas', '', 'SDM & UMUM', 'R. Auditorium', '8', 'Gedung Dekanat', '', ''),
(13, 10120013, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 01', '8', 'Gedung Dekanat', '', ''),
(14, 10120014, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 02', '8', 'Gedung Dekanat', '', ''),
(15, 10120015, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 03', '8', 'Gedung Dekanat', '', ''),
(16, 10120016, 'Universitas', '', 'SDM & UMUM', 'R. Rapat 04', '8', 'Gedung Dekanat', '', ''),
(17, 10120017, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', '', 'Masjid Al Miraj', '9', 'Gedung Dekanat', '', ''),
(18, 10120018, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', '', 'Tempat Wudhu Pria', '9', 'Gedung Dekanat', '', ''),
(19, 10120019, 'Universitas', 'Lembaga Peningkatan Insan, Mujahid, Mujtahid, dan Mujaddid (LPI3M)', '', 'Tempat Wudhu Wanita', '9', 'Gedung Dekanat', '', ''),
(20, 10120020, 'Universitas', '', '', 'Smoke Lobby', 'B1', 'Gedung Kedokteran  ', '', ''),
(21, 10120021, 'Universitas', '', '', 'Power House', 'B1', 'Gedung Kedokteran', '', ''),
(22, 10120022, 'Universitas', '', '', 'Genset', 'B1', 'Gedung Kedokteran', '', ''),
(23, 10120023, 'Universitas', '', '', 'Panel', 'B1', 'Gedung Kedokteran', '', ''),
(24, 10120024, 'Universitas', '', '', 'Shaft', 'B1', 'Gedung Kedokteran', '', ''),
(25, 10120025, 'Universitas', '', '', 'R Pompa', 'B1', 'Gedung Kedokteran', '', ''),
(26, 10120026, 'Universitas', '', '', 'R Gudang - 01', 'B1', 'Gedung Kedokteran', '', ''),
(27, 10120027, 'Universitas', '', '', 'R Gudang - 02', 'B1', 'Gedung Kedokteran', '', ''),
(28, 10120028, 'Universitas', '', '', 'R Gudang - 03', 'B1', 'Gedung Kedokteran', '', ''),
(29, 10120029, 'Universitas', '', '', 'Toilet Wanita', 'B1', 'Gedung Kedokteran', '', ''),
(30, 10120030, 'Universitas', '', '', 'Toilet Pria', 'B1', 'Gedung Kedokteran', '', ''),
(31, 10120031, 'Universitas', '', '', 'Tempat Wudhu ', 'B1', 'Gedung Kedokteran', '', ''),
(32, 10120032, 'Universitas', '', '', 'Mushola', 'B1', 'Gedung Kedokteran', '', ''),
(33, 10120033, 'Universitas', '', '', 'R. Katimber', 'B1', 'Gedung Kedokteran', '', ''),
(34, 10120034, 'Universitas', '', '', 'R. Ujian', '1', 'Gedung Kedokteran', '', ''),
(35, 10120035, 'Universitas', '', '', 'Mushola Pria', 'B1', 'Gedung Pascasarjana', '27', ''),
(36, 10120036, 'Universitas', '', '', 'Tempat Wudhu Pria', 'B1', 'Gedung Pascasarjana', '', ''),
(37, 10120037, 'Universitas', '', '', 'Toilet Pria ', 'B1', 'Gedung Pascasarjana', '14', ''),
(38, 10120038, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Seminar / Aula', '1', 'Gedung Pascasarjana', '161', ''),
(39, 10120039, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Akademik', '1', 'Gedung Pascasarjana', '44', ''),
(40, 10120040, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Pelayaan ', '1', 'Gedung Pascasarjana', '9', ''),
(41, 10120041, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Arsip', '1', 'Gedung Pascasarjana', '16', ''),
(42, 10120042, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Makan ', '1', 'Gedung Pascasarjana', '18', ''),
(43, 10120043, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Lobby', '1', 'Gedung Pascasarjana', '34', ''),
(44, 10120044, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Jabatan Akademik Dosen ', '1', 'Gedung Pascasarjana', '43.5', ''),
(45, 10120045, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Pria ', '1', 'Gedung Pascasarjana', '', ''),
(46, 10120046, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Kepala Bagian Akademik', '1', 'Gedung Pascasarjana', '13.2', ''),
(47, 10120047, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Kasi dan Staff Karir Dosen', '1', 'Gedung Pascasarjana', '13.6', ''),
(48, 10120048, 'Universitas', '', 'Akademik dan Karir Dosen', ' R. Tamu Magister Pendidikan Islam', '1', 'Gedung Pascasarjana', '15.3', ''),
(49, 10120049, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Pria', '1', 'Gedung Pascasarjana', '', ''),
(50, 10120050, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Wanita', '1', 'Gedung Pascasarjana', '', ''),
(51, 10120051, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Pantry', '1', 'Gedung Pascasarjana', '5', ''),
(52, 10120052, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Panel', '1', 'Gedung Pascasarjana', '3', ''),
(53, 10120053, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 2.0 Kelas Type A ', '2', 'Gedung Pascasarjana', '56', ''),
(54, 10120054, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 2.1 Kelas Type A', '2', 'Gedung Pascasarjana', '53,5', ''),
(55, 10120055, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 2.2 Kelas Type A', '2', 'Gedung Pascasarjana', '53.5', ''),
(56, 10120056, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 2.3 Kelas Type A', '2', 'Gedung Pascasarjana', '60.3', ''),
(57, 10120057, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 2.4 Kelas Type A', '2', 'Gedung Pascasarjana', '53,5', ''),
(58, 10120058, 'Universitas', '', 'Akademik dan Karir Dosen', 'Mushola Wanita', '2', 'Gedung Pascasarjana', '24', ''),
(59, 10120059, 'Universitas', '', 'Akademik dan Karir Dosen', 'Tempat Wudhu', '2', 'Gedung Pascasarjana', '7,5', ''),
(60, 10120060, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Panel', '2', 'Gedung Pascasarjana', '3', ''),
(61, 10120061, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Pantry', '2', 'Gedung Pascasarjana', '5', ''),
(62, 10120062, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Wanita', '2', 'Gedung Pascasarjana', '', ''),
(63, 10120063, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Pria ', '2', 'Gedung Pascasarjana', '', ''),
(64, 10120064, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 3.1 Kelas Type B', '3', 'Gedung Pascasarjana', '90', ''),
(65, 10120065, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 3.2 Kelas Type B', '3', 'Gedung Pascasarjana', '74', ''),
(66, 10120066, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 3.6 Kelas Type B', '3', 'Gedung Pascasarjana', '75', ''),
(67, 10120067, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Panel', '3', 'Gedung Pascasarjana', '', ''),
(68, 10120068, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Pantry', '3', 'Gedung Pascasarjana', '5', ''),
(69, 10120069, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Wanita', '3', 'Gedung Pascasarjana', '', ''),
(70, 10120070, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Pria ', '3', 'Gedung Pascasarjana', '', ''),
(71, 10120071, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Perpustakaan', '4', 'Gedung Pascasarjana', '164', ''),
(72, 10120072, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 4.0 Kelas Type B', '4', 'Gedung Pascasarjana', '53', ''),
(73, 10120073, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 4.1 Kelas Type B', '4', 'Gedung Pascasarjana', '55', ''),
(74, 10120074, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Panel', '4', 'Gedung Pascasarjana', '5', ''),
(75, 10120075, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. Pantry', '4', 'Gedung Pascasarjana', '', ''),
(76, 10120076, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Wanita', '4', 'Gedung Pascasarjana', '', ''),
(77, 10120077, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Pria ', '4', 'Gedung Pascasarjana', '', ''),
(78, 10120078, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 5.0 Belajar Mandiri', '5', 'Gedung Pascasarjana', '', ''),
(79, 10120079, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 5.1 Kuliah-1', '5', 'Gedung Pascasarjana', '', ''),
(80, 10120080, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 5.2 Kuliah-2', '5', 'Gedung Pascasarjana', '', ''),
(81, 10120081, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 5.3 Kuliah-3', '5', 'Gedung Pascasarjana', '', ''),
(82, 10120082, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 5.4 Kuliah-4', '5', 'Gedung Pascasarjana', '', ''),
(83, 10120083, 'Universitas', '', 'Akademik dan Karir Dosen', 'R. 5.5 Kuliah-5', '5', 'Gedung Pascasarjana', '', ''),
(84, 10120084, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Wanita', '5', 'Gedung Pascasarjana', '', ''),
(85, 10120085, 'Universitas', '', 'Akademik dan Karir Dosen', 'Toilet Pria', '5', 'Gedung Pascasarjana', '', '');

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
(15, 'Pawbxj0x1', 'pawdosq', '$2b$12$LYkg.oK3Iu8ImOYdmkwmf.ancPX01VazlAXu67FBAfWCrbKNFnO/K', 'developer', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwYXdkb3NxIiwidHlwZSI6InJlZnJlc2giLCJleHAiOjE3NzYzMTIzNTZ9.aWWuzDBapQCrmlnyndmE6XSMq3uSvcWPb_cm5lEJMNo', '2026-04-16 04:05:56', '2026-02-26 04:40:47'),
(19, 'Kyoshiro', 'kyo', '$2b$12$GXv.jXDN.Jt18See63gPMujEVwSDNTXH1bNl2gsRfy/8VFOwNV/re', 'developer', NULL, NULL, '2026-03-13 04:25:32'),
(20, 'victim', 'victim1', '$2b$12$SlONmiqE29idyGIrTi0NXuhEmozX9KB68MgI81i8jfOpOkpWazMAa', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2aWN0aW0xIiwidHlwZSI6InJlZnJlc2giLCJleHAiOjE3NzU2MzA3Mzd9.haRrdTkZW3yBI2Miw2lkvNXxj6K_HR6lqxSB6R4NmQo', '2026-04-08 06:45:37', '2026-03-13 04:26:33'),
(21, 'Jesika', 'jes', '$2b$12$C640CrOt1P2gP.Ed5UYMzOTqZqDGHBJAqH6tFsQ4lzhPDp20D6Yfm', 'developer', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqZXMiLCJ0eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3NjMxNDYzOX0.JnHm3E2INY_LaqoJlfwqUhdo2H6a87rX-SZOmMsXPiY', '2026-04-16 04:43:59', '2026-03-13 08:49:47'),
(22, 'Administrator', 'Unisba#admin', '$2b$12$/YeXhYAk6sHL/fckLAjAI.I/c6LWhf3tu/noHbQppqzm1SUWE66h2', 'admin', NULL, NULL, '2026-03-13 08:55:31');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `mainten`
--
ALTER TABLE `mainten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patch_notif`
--
ALTER TABLE `patch_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `univ`
--
ALTER TABLE `univ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
