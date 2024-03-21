-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Des 2023 pada 15.08
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fullstack`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anime`
--

CREATE TABLE `anime` (
  `anime_Id` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `release_year` int(11) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `likes` int(11) NOT NULL,
  `publisher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anime`
--

INSERT INTO `anime` (`anime_Id`, `title`, `genre`, `description`, `thumbnail`, `release_year`, `video_url`, `likes`, `publisher_id`) VALUES
(1, 'Naruto', 'Action', 'A ninjas journey', 'https://i.ibb.co/m9PLFq8/naruto-thumbnail.jpg', 2002, 'naruto_video.mp4', 21, 7),
(2, 'One Piece', 'Adventure', 'The great pirate adventure', 'https://i.ibb.co/LRJH4m5/one-piece-thumbnail.jpg', 1999, 'one_piece_video.mp4', 8, 7),
(3, 'Attack on Titan', 'Fantasy', 'Humanity vs. Titans', 'https://i.ibb.co/3vj56Gq/aot.jpg', 2013, 'aot_video.mp4', 0, 7),
(4, 'Demon Slayer', 'Action', 'Demon-slaying adventures', 'https://i.ibb.co/19JgT7d/cowboy-bebop.jpg', 2019, 'demon_slayer_video.mp4', 0, 7),
(5, 'My Hero Academia', 'Superhero', 'Heroic adventures at U.A. High School', 'https://i.ibb.co/xGwpjbC/my-hero-academia.jpg', 2016, 'my_hero_academia_video.mp4', 0, 7),
(6, 'Sword Art Online', 'Adventure', 'Virtual reality MMORPG', 'https://i.ibb.co/GpFnJrk/sa0.jpg', 2012, 'sa0_video.mp4', 0, 7),
(7, 'Death Note', 'Mystery', 'A battle of wits between Light and L', 'https://i.ibb.co/3vj56Gq/aot.jpg', 2006, 'death_note_video.mp4', 0, 7),
(8, 'Fullmetal Alchemist: Brotherhood', 'Fantasy', 'Alchemy and the Philosopher\'s Stone', 'https://i.ibb.co/824Xv5R/fmab.png', 2009, 'fmab_video.mp4', 0, 7),
(9, 'Steins;Gate', 'Science Fiction', 'Time travel experiments gone awry', 'https://i.ibb.co/tmVJGpB/steins-gate.jpg', 2011, 'steins_gate_video.mp4', 0, 7),
(10, 'Cowboy Bebop', 'Space Western', 'Bounty hunting in space', 'https://i.ibb.co/19JgT7d/cowboy-bebop.jpg', 1998, 'cowboy_bebop_video.mp4', 0, 7),
(11, '123', '123', '123', '123', 123, '123', 0, 7),
(12, 'qwe', 'qwe', 'qwe', 'qwe', 123, 'qwe', 0, 7),
(13, 'qwe', 'qwe', 'qwe', 'qwe', 123, 'qwe', 0, 8),
(14, 'iop', 'iop', 'iop', 'iop', 12, 'iop', 0, 8),
(15, 'Anime TelU', 'Comedy', 'Ini menceritakan kehidupan sehari hari di telu', '-', 2023, '-', 0, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `animeepisode`
--

CREATE TABLE `animeepisode` (
  `id` int(11) NOT NULL,
  `id_anime` int(11) DEFAULT NULL,
  `episode_number` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `animeepisode`
--

INSERT INTO `animeepisode` (`id`, `id_anime`, `episode_number`, `title`, `release_date`, `duration_minutes`, `video_url`) VALUES
(1, 1, 1, 'Awal', '2023-11-01', 24, 'google.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anime_episode`
--

CREATE TABLE `anime_episode` (
  `id` bigint(20) NOT NULL,
  `episode_title` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `anime_id` int(20) DEFAULT NULL,
  `requires_subscription` bit(1) NOT NULL,
  `episode_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anime_episode`
--

INSERT INTO `anime_episode` (`id`, `episode_title`, `video_url`, `anime_id`, `requires_subscription`, `episode_number`) VALUES
(1, 'Enter: Naruto Uzumaki!', 'https://www.youtube.com/embed/alYaVjRTrOA?si=QIU1PHYH3xThZbvi', 1, b'0', 1),
(2, 'My Name is Konohamaru!', 'https://www.youtube.com/embed/NjA4VF7cACY?si=tdXXT6M-6evo0DCg', 1, b'1', 2),
(3, 'You Failed! Kakashi\'s Final Decision', 'https://www.youtube.com/embed/J9i6TA0NDk4?si=kiNkJGjQSMZdrCrf', 1, b'1', 5),
(12, 'MABA', '-', 15, b'1', 1),
(13, '21321', '213123', 4, b'1', 213123),
(14, '123123', '213123', 4, b'1', 123123),
(15, '123123', '213213', 6, b'1', 23123123),
(16, 'Luffy Bertemu Zoro', 'https://www.youtube.com/embed/Po5Ftv1urzM?si=0niOaQVcvZUqzhQY', 2, b'0', 1231231);

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `commented_at` datetime DEFAULT NULL,
  `anime_episode_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id`, `comment`, `commented_at`, `anime_episode_id`, `user_id`) VALUES
(3, 'dawdadadawdawd', '2023-11-13 10:26:50', 1, 5),
(6, 'awdawdawda', '2023-11-13 10:43:27', 2, 5),
(8, 'Halo', '2023-11-18 20:51:55', 1, 5),
(9, 'Halo', '2023-11-18 20:52:03', 2, 5),
(10, 'Halo', '2023-11-18 20:55:01', 2, 5),
(11, 'wda', '2023-12-09 20:59:45', 1, 5),
(12, 'wda', '2023-12-09 20:59:58', 1, 5),
(13, 'wda', '2023-12-09 20:59:59', 1, 5),
(14, 'waawd', '2023-12-09 21:00:52', 1, 5),
(15, 'waawd', '2023-12-09 21:02:05', 1, 5),
(16, '', '2023-12-09 21:02:16', 1, 5),
(17, 'halo', '2023-12-09 21:02:22', 1, 5),
(18, 'halo', '2023-12-09 21:02:53', 1, 5),
(19, 'wadawdwad', '2023-12-09 21:02:59', 1, 5),
(20, 'awdawd', '2023-12-09 21:03:23', 1, 5),
(21, 'wdawdawd', '2023-12-09 21:05:23', 1, 5),
(22, 'awdawwa', '2023-12-09 21:05:26', 1, 5),
(23, 'hai bang', '2023-12-09 21:08:22', 1, 5),
(24, 'hai bang', '2023-12-09 21:08:25', 1, 5),
(25, 'haloo', '2023-12-09 21:08:38', 1, 5),
(26, 'dawdawdaw', '2023-12-09 21:09:59', 1, 5),
(27, 'wadawdwad', '2023-12-09 21:12:03', 1, 5),
(28, 'waddadawd', '2023-12-09 21:13:56', 1, 5),
(29, 'awdawdawd', '2023-12-09 21:14:13', 1, 5),
(30, 'wd', '2023-12-09 21:15:15', 1, 5),
(31, 'wdawdwd', '2023-12-09 21:16:06', 1, 5),
(32, 'wadawdawd', '2023-12-09 21:16:36', 1, 5),
(33, 'awdadawdad', '2023-12-09 21:26:57', 3, 5),
(34, 'joojojojo', '2023-12-09 21:35:41', 1, 5),
(35, 'awdawdawd', '2023-12-11 09:48:38', 1, 5),
(36, 'ippipiop', '2023-12-21 11:05:45', 1, 2),
(37, 'wqewqeqwewqe', '2023-12-21 11:07:38', 1, 2),
(38, 'Halo dek', '2023-12-25 14:46:16', 2, 2),
(39, 'naruto keren', '2023-12-25 14:46:32', 2, 2),
(40, 'ioioio', '2023-12-25 19:12:18', 3, 2),
(41, 'halo adik kecil', '2023-12-26 11:50:18', 2, 2),
(42, '', '2023-12-26 11:56:44', 1, 2),
(43, '', '2023-12-26 11:57:00', 1, 2),
(44, '', '2023-12-26 11:58:42', 1, 2),
(45, '', '2023-12-26 11:59:05', 1, 2),
(46, '', '2023-12-26 12:00:41', 1, 2),
(47, '', '2023-12-26 12:01:03', 1, 2),
(48, '', '2023-12-26 12:01:23', 1, 2),
(49, '', '2023-12-26 12:02:09', 1, 2),
(50, '', '2023-12-26 12:03:22', 1, 2),
(51, '', '2023-12-26 12:03:32', 1, 2),
(52, '', '2023-12-26 12:03:36', 1, 2),
(53, '', '2023-12-26 12:03:45', 1, 2),
(54, 'adawdawdawdawd', '2023-12-26 12:08:44', 1, 2),
(55, '1321313123123', '2023-12-26 12:09:17', 1, 2),
(56, '', '2023-12-26 12:15:43', 1, 2),
(57, '', '2023-12-26 12:15:47', 1, 2),
(58, '', '2023-12-26 12:15:47', 1, 2),
(59, '', '2023-12-26 12:15:49', 1, 2),
(60, '', '2023-12-26 12:15:49', 1, 2),
(61, '', '2023-12-26 12:16:04', 1, 2),
(62, 'wadawdad', '2023-12-26 12:16:18', 1, 2),
(63, 'Halo ngab', '2023-12-26 12:17:06', 1, 56),
(64, '123', '2023-12-26 12:31:43', 1, 2),
(65, 'ngawi', '2023-12-26 13:54:44', 1, 56);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fk_admin`
--

CREATE TABLE `fk_admin` (
  `id` int(20) NOT NULL,
  `log` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fk_admin`
--

INSERT INTO `fk_admin` (`id`, `log`, `nama`, `pesan`) VALUES
(19, '-', 'Anjay2', NULL),
(20, '-', '2', NULL),
(21, '-', 's', NULL),
(22, '-', 'adasd', NULL),
(23, '-', 'asdasdasd', NULL),
(24, '-', 'asdadasd', NULL),
(25, '-', 'asdadasd', NULL),
(26, '-', '123123', NULL),
(27, '-', 'asdadsd', NULL),
(28, '-', '12313', NULL),
(29, '-', '123123', NULL),
(30, '-', '123qwe', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fk_customer`
--

CREATE TABLE `fk_customer` (
  `id` int(11) NOT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `nama_customer` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fk_customer`
--

INSERT INTO `fk_customer` (`id`, `jenis_kelamin`, `nama_customer`, `payment_id`, `pesan`) VALUES
(3, NULL, 'Mr/Ms. s', NULL, NULL),
(4, NULL, 'Mr/Ms. s', NULL, NULL),
(5, 'Laki-laki', 'Mr/Ms. zxc', NULL, 'Minimal Bayar dek'),
(6, NULL, 'Mr/Ms. 12', NULL, 'Minimal Bayar dek'),
(7, NULL, 'Mr/Ms. 456', NULL, NULL),
(8, NULL, 'Mr/Ms. 123123', NULL, NULL),
(9, NULL, 'Mr/Ms. weqwewe', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fk_publisher`
--

CREATE TABLE `fk_publisher` (
  `id` int(11) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `tahun_didirikan` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fk_publisher`
--

INSERT INTO `fk_publisher` (`id`, `alamat`, `deskripsi`, `tahun_didirikan`, `nama_perusahaan`, `pesan`, `nama`) VALUES
(7, 'Aniplex', NULL, NULL, 'PT. Aniplex', NULL, 'Aniplex'),
(8, NULL, NULL, NULL, 'PT. Ufotable', NULL, 'Ufotable'),
(9, NULL, NULL, NULL, 'PT. asdasd', NULL, 'asdasd'),
(10, NULL, NULL, NULL, 'PT. ddsad', NULL, 'ddsad');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(64);

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL,
  `anime_episode_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `likes`
--

INSERT INTO `likes` (`id`, `anime_episode_id`, `user_id`) VALUES
(127, 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment_id` bigint(20) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` bit(1) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_date`, `payment_method`, `payment_status`, `user_id`) VALUES
(1, '2023-12-26 13:27:42', 'awdad', b'1', 2),
(2, '2023-12-26 13:32:15', 'creditCard', b'1', 2),
(3, '2023-12-26 13:32:26', 'bankTransfer', b'1', 2),
(4, '2023-12-26 13:38:09', 'creditCard', b'1', 2),
(5, '2023-12-26 13:43:31', 'bankTransfer', b'1', 2),
(6, '2023-12-26 14:04:09', 'bankTransfer', b'1', 56),
(7, '2023-12-26 19:31:56', 'creditCard', b'1', 2),
(8, '2023-12-26 20:11:04', 'creditCard', b'1', 2),
(9, '2023-12-28 14:14:34', 'creditCard', b'1', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `student`
--

INSERT INTO `student` (`id`, `address`, `name`) VALUES
(1, '1', '1'),
(2, '2', '2'),
(3, '3', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe`
--

CREATE TABLE `subscribe` (
  `subscribe_id` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `subscribe`
--

INSERT INTO `subscribe` (`subscribe_id`, `duration`, `user_id`) VALUES
(25, 999999999, 5),
(26, 999999999, 55),
(27, 999999999, 54),
(29, 6, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(31) NOT NULL,
  `adminchmod_id` int(11) DEFAULT NULL,
  `publisherchmod_id` int(11) DEFAULT NULL,
  `customerchmod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `user_type`, `adminchmod_id`, `publisherchmod_id`, `customerchmod_id`) VALUES
(2, '123', '123', '123', 'CUSTOMER', NULL, NULL, 3),
(5, 'contoh.user@example.com11', 'Anjay1', 'contoh_kata_sandi1', 'ADMIN', NULL, NULL, NULL),
(12, 'Anjay112313@gmail.com', 'Anjay112313', '123', 'CUSTOMER', NULL, NULL, 4),
(42, 'Anjay2', 'Anjay2', 'Anjay2', 'ADMIN', 19, NULL, NULL),
(48, 's', 's', 's', 'ADMIN', 21, NULL, NULL),
(51, 'asdasd', 'adasd', 'asdasd', 'ADMIN', 22, NULL, NULL),
(54, 'Aniplex', 'Aniplex', 'Aniplex', 'PUBLISHER', NULL, 7, NULL),
(55, 'Ufotable', 'Ufotable', 'Ufotable', 'PUBLISHER', NULL, 8, NULL),
(56, '456', '456', '456', 'CUSTOMER', NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_history`
--

CREATE TABLE `user_history` (
  `id` bigint(20) NOT NULL,
  `watched_at` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `anime_episode_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_history`
--

INSERT INTO `user_history` (`id`, `watched_at`, `user_id`, `anime_episode_id`) VALUES
(209, '2023-12-12 18:38:56', 5, 1),
(210, '2023-12-12 18:39:45', 5, 2),
(211, '2023-12-12 18:39:47', 5, 1),
(212, '2023-12-12 18:39:48', 5, 1),
(213, '2023-12-12 18:39:49', 5, 1),
(214, '2023-12-12 18:39:58', 5, 2),
(215, '2023-12-12 18:47:12', 5, 2),
(216, '2023-12-12 18:47:27', 5, 2),
(217, '2023-12-12 18:47:39', 5, 2),
(218, '2023-12-12 18:47:47', 5, 1),
(219, '2023-12-12 18:57:18', 5, 1),
(220, '2023-12-18 14:40:07', 2, 1),
(221, '2023-12-21 11:05:38', 2, 1),
(222, '2023-12-21 11:05:47', 2, 1),
(223, '2023-12-21 11:06:07', 2, 1),
(224, '2023-12-21 11:07:42', 2, 1),
(225, '2023-12-21 11:10:03', 2, 1),
(226, '2023-12-21 11:10:21', 2, 2),
(227, '2023-12-21 14:06:42', 2, 2),
(228, '2023-12-21 14:07:07', 2, 1),
(229, '2023-12-21 14:30:41', 2, 1),
(230, '2023-12-22 08:47:56', 2, 1),
(231, '2023-12-25 00:54:21', 2, 1),
(232, '2023-12-25 14:30:31', 5, 1),
(233, '2023-12-25 14:36:04', 5, 2),
(234, '2023-12-25 14:36:05', 5, 3),
(235, '2023-12-25 14:36:07', 5, 2),
(236, '2023-12-25 14:46:07', 2, 2),
(237, '2023-12-25 14:46:19', 2, 2),
(238, '2023-12-25 14:46:38', 2, 2),
(239, '2023-12-25 14:47:10', 2, 2),
(240, '2023-12-25 14:55:49', 2, 2),
(241, '2023-12-25 15:05:46', 5, 1),
(242, '2023-12-25 15:05:48', 5, 2),
(244, '2023-12-25 17:48:44', 54, 1),
(245, '2023-12-25 17:50:40', 54, 1),
(248, '2023-12-25 18:48:42', 5, 1),
(249, '2023-12-25 18:48:46', 5, 1),
(250, '2023-12-25 18:54:08', 5, 1),
(251, '2023-12-25 19:06:05', 5, 1),
(252, '2023-12-25 19:07:25', 2, 1),
(253, '2023-12-25 19:10:42', 2, 2),
(254, '2023-12-25 19:11:09', 2, 1),
(255, '2023-12-25 19:11:17', 2, 1),
(256, '2023-12-25 19:11:24', 2, 1),
(257, '2023-12-25 19:11:32', 2, 2),
(258, '2023-12-25 19:11:35', 2, 3),
(259, '2023-12-25 19:11:50', 2, 3),
(260, '2023-12-25 19:12:00', 2, 1),
(261, '2023-12-25 19:12:05', 2, 2),
(262, '2023-12-25 19:12:12', 2, 1),
(263, '2023-12-25 19:12:15', 2, 3),
(264, '2023-12-25 19:12:20', 2, 3),
(265, '2023-12-25 19:12:30', 2, 3),
(266, '2023-12-25 19:12:35', 2, 3),
(267, '2023-12-25 19:12:40', 2, 2),
(268, '2023-12-25 19:12:45', 2, 2),
(269, '2023-12-25 19:12:48', 2, 2),
(270, '2023-12-25 19:25:53', 2, 1),
(271, '2023-12-26 11:46:12', 2, 1),
(272, '2023-12-26 11:47:07', 2, 1),
(273, '2023-12-26 11:49:46', 2, 2),
(274, '2023-12-26 11:51:56', 2, 2),
(277, '2023-12-26 11:55:40', 2, 1),
(278, '2023-12-26 11:56:02', 2, 1),
(279, '2023-12-26 11:56:09', 2, 1),
(280, '2023-12-26 11:56:42', 2, 1),
(281, '2023-12-26 11:56:59', 2, 1),
(282, '2023-12-26 11:57:57', 2, 1),
(283, '2023-12-26 11:58:39', 2, 1),
(284, '2023-12-26 12:04:35', 2, 1),
(285, '2023-12-26 12:04:54', 2, 3),
(286, '2023-12-26 12:04:59', 2, 3),
(287, '2023-12-26 12:05:01', 2, 1),
(288, '2023-12-26 12:05:21', 2, 1),
(289, '2023-12-26 12:05:33', 2, 1),
(290, '2023-12-26 12:05:50', 2, 1),
(291, '2023-12-26 12:05:57', 2, 1),
(292, '2023-12-26 12:06:49', 2, 1),
(293, '2023-12-26 12:07:10', 2, 1),
(294, '2023-12-26 12:07:17', 2, 1),
(295, '2023-12-26 12:07:30', 2, 1),
(296, '2023-12-26 12:07:49', 2, 1),
(297, '2023-12-26 12:07:51', 2, 1),
(298, '2023-12-26 12:07:59', 2, 1),
(299, '2023-12-26 12:08:00', 2, 1),
(300, '2023-12-26 12:08:11', 2, 2),
(301, '2023-12-26 12:08:13', 2, 2),
(302, '2023-12-26 12:08:25', 2, 1),
(303, '2023-12-26 12:08:35', 2, 1),
(304, '2023-12-26 12:08:39', 2, 1),
(305, '2023-12-26 12:08:46', 2, 1),
(306, '2023-12-26 12:09:19', 2, 1),
(307, '2023-12-26 12:09:37', 2, 1),
(308, '2023-12-26 12:09:39', 2, 1),
(309, '2023-12-26 12:10:34', 2, 1),
(310, '2023-12-26 12:10:36', 2, 1),
(311, '2023-12-26 12:10:48', 2, 1),
(312, '2023-12-26 12:11:08', 2, 1),
(313, '2023-12-26 12:11:11', 2, 1),
(314, '2023-12-26 12:14:11', 2, 1),
(315, '2023-12-26 12:14:21', 2, 1),
(316, '2023-12-26 12:14:32', 2, 1),
(317, '2023-12-26 12:14:33', 2, 1),
(318, '2023-12-26 12:14:57', 2, 1),
(319, '2023-12-26 12:15:42', 2, 1),
(320, '2023-12-26 12:15:43', 2, 1),
(321, '2023-12-26 12:15:47', 2, 1),
(322, '2023-12-26 12:15:47', 2, 1),
(323, '2023-12-26 12:15:49', 2, 1),
(324, '2023-12-26 12:15:49', 2, 1),
(325, '2023-12-26 12:15:52', 2, 1),
(326, '2023-12-26 12:15:53', 2, 1),
(327, '2023-12-26 12:16:03', 2, 1),
(328, '2023-12-26 12:16:04', 2, 1),
(329, '2023-12-26 12:16:15', 2, 1),
(330, '2023-12-26 12:16:22', 2, 1),
(331, '2023-12-26 12:17:01', 56, 1),
(332, '2023-12-26 12:17:08', 56, 1),
(333, '2023-12-26 12:19:32', 56, 1),
(334, '2023-12-26 12:20:42', 56, 1),
(335, '2023-12-26 12:20:43', 56, 1),
(336, '2023-12-26 12:20:44', 56, 1),
(337, '2023-12-26 12:20:44', 56, 1),
(338, '2023-12-26 12:20:45', 56, 1),
(339, '2023-12-26 12:21:13', 56, 1),
(340, '2023-12-26 12:21:13', 56, 1),
(341, '2023-12-26 12:21:14', 56, 1),
(342, '2023-12-26 12:21:14', 56, 1),
(343, '2023-12-26 12:21:21', 56, 1),
(344, '2023-12-26 12:21:23', 56, 1),
(345, '2023-12-26 12:21:41', 56, 1),
(346, '2023-12-26 12:21:51', 56, 1),
(347, '2023-12-26 12:25:59', 2, 1),
(348, '2023-12-26 12:26:08', 2, 1),
(349, '2023-12-26 12:27:20', 2, 1),
(350, '2023-12-26 12:27:35', 2, 1),
(351, '2023-12-26 12:28:02', 2, 1),
(352, '2023-12-26 12:31:07', 2, 1),
(353, '2023-12-26 12:31:44', 2, 1),
(354, '2023-12-26 12:33:04', 2, 1),
(355, '2023-12-26 12:34:33', 2, 3),
(356, '2023-12-26 12:35:16', 2, 1),
(357, '2023-12-26 12:35:36', 2, 1),
(358, '2023-12-26 12:35:51', 2, 2),
(359, '2023-12-26 12:35:59', 2, 1),
(362, '2023-12-26 12:46:21', 2, 1),
(363, '2023-12-26 12:46:53', 2, 1),
(364, '2023-12-26 12:47:01', 2, 1),
(365, '2023-12-26 13:54:37', 56, 1),
(366, '2023-12-26 13:54:46', 56, 1),
(367, '2023-12-26 14:03:13', 56, 1),
(368, '2023-12-26 14:04:15', 56, 2),
(369, '2023-12-26 19:30:44', 2, 1),
(370, '2023-12-26 19:31:28', 2, 1),
(371, '2023-12-26 20:07:55', 5, 2),
(372, '2023-12-27 22:20:01', 54, 12),
(373, '2023-12-27 22:20:54', 54, 12),
(374, '2023-12-28 13:15:05', 54, 16),
(375, '2023-12-28 14:01:02', 2, 1),
(376, '2023-12-28 14:01:05', 2, 2),
(377, '2023-12-28 14:10:01', 5, 2),
(378, '2023-12-28 14:10:12', 5, 3),
(379, '2023-12-28 14:11:10', 2, 1),
(380, '2023-12-28 14:15:08', 2, 2),
(381, '2023-12-28 14:15:15', 2, 3),
(382, '2023-12-28 15:06:54', 2, 1),
(383, '2023-12-28 15:07:01', 2, 3),
(384, '2023-12-28 15:07:05', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`anime_Id`),
  ADD KEY `FKto1hbnyxyy2k403dvpjcap82l` (`publisher_id`);

--
-- Indeks untuk tabel `animeepisode`
--
ALTER TABLE `animeepisode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eps-anime` (`id_anime`);

--
-- Indeks untuk tabel `anime_episode`
--
ALTER TABLE `anime_episode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eps-anime` (`anime_id`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKls5dk492ff4iloy9lfhxnx5ri` (`anime_episode_id`),
  ADD KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`);

--
-- Indeks untuk tabel `fk_admin`
--
ALTER TABLE `fk_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fk_customer`
--
ALTER TABLE `fk_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fk_publisher`
--
ALTER TABLE `fk_publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5t9e6wsndb5xjsx8cjb6no2fi` (`anime_episode_id`),
  ADD KEY `FKi2wo4dyk4rok7v4kak8sgkwx0` (`user_id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FK4spfnm9si9dowsatcqs5or42i` (`user_id`);

--
-- Indeks untuk tabel `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`subscribe_id`),
  ADD KEY `FK31lkjb2x51cw4bljtmswtj6r` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin-fk` (`adminchmod_id`),
  ADD KEY `customer-fk` (`customerchmod_id`),
  ADD KEY `publisher-fk` (`publisherchmod_id`);

--
-- Indeks untuk tabel `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaa6ilb6iqih95bntoeyysb2pc` (`user_id`),
  ADD KEY `epsanime-history` (`anime_episode_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anime`
--
ALTER TABLE `anime`
  MODIFY `anime_Id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `animeepisode`
--
ALTER TABLE `animeepisode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `anime_episode`
--
ALTER TABLE `anime_episode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `fk_admin`
--
ALTER TABLE `fk_admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `fk_customer`
--
ALTER TABLE `fk_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `fk_publisher`
--
ALTER TABLE `fk_publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `subscribe_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `user_history`
--
ALTER TABLE `user_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anime`
--
ALTER TABLE `anime`
  ADD CONSTRAINT `FKto1hbnyxyy2k403dvpjcap82l` FOREIGN KEY (`publisher_id`) REFERENCES `fk_publisher` (`id`);

--
-- Ketidakleluasaan untuk tabel `anime_episode`
--
ALTER TABLE `anime_episode`
  ADD CONSTRAINT `eps-anime` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`anime_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKls5dk492ff4iloy9lfhxnx5ri` FOREIGN KEY (`anime_episode_id`) REFERENCES `anime_episode` (`id`);

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FK5t9e6wsndb5xjsx8cjb6no2fi` FOREIGN KEY (`anime_episode_id`) REFERENCES `anime_episode` (`id`),
  ADD CONSTRAINT `FKi2wo4dyk4rok7v4kak8sgkwx0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK4spfnm9si9dowsatcqs5or42i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `FK31lkjb2x51cw4bljtmswtj6r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `admin-fk` FOREIGN KEY (`adminchmod_id`) REFERENCES `fk_admin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customer-fk` FOREIGN KEY (`customerchmod_id`) REFERENCES `fk_customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `publisher-fk` FOREIGN KEY (`publisherchmod_id`) REFERENCES `fk_publisher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `FKaa6ilb6iqih95bntoeyysb2pc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `epsanime-history` FOREIGN KEY (`anime_episode_id`) REFERENCES `anime_episode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
