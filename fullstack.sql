-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Des 2023 pada 05.59
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
  `anime_id` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `release_year` int(11) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anime`
--

INSERT INTO `anime` (`anime_id`, `title`, `genre`, `description`, `publisher`, `thumbnail`, `release_year`, `video_url`, `likes`) VALUES
(1, 'Naruto', 'Action', 'A ninjas journey', 'Aniplex', 'https://i.ibb.co/m9PLFq8/naruto-thumbnail.jpg', 2002, 'naruto_video.mp4', 21),
(2, 'One Piece', 'Adventure', 'The great pirate adventure', 'Aniplex', 'https://i.ibb.co/LRJH4m5/one-piece-thumbnail.jpg', 1999, 'one_piece_video.mp4', 8),
(3, 'Attack on Titan', 'Fantasy', 'Humanity vs. Titans', 'Mappa', 'https://i.ibb.co/3vj56Gq/aot.jpg', 2013, 'aot_video.mp4', 0),
(4, 'Demon Slayer', 'Action', 'Demon-slaying adventures', 'Ufotable', 'https://i.ibb.co/19JgT7d/cowboy-bebop.jpg', 2019, 'demon_slayer_video.mp4', 0),
(5, 'My Hero Academia', 'Superhero', 'Heroic adventures at U.A. High School', 'Aniplex', 'https://i.ibb.co/xGwpjbC/my-hero-academia.jpg', 2016, 'my_hero_academia_video.mp4', 0),
(6, 'Sword Art Online', 'Adventure', 'Virtual reality MMORPG', 'Aniplex', 'https://i.ibb.co/GpFnJrk/sa0.jpg', 2012, 'sa0_video.mp4', 0),
(7, 'Death Note', 'Mystery', 'A battle of wits between Light and L', 'Aniplex', 'https://i.ibb.co/3vj56Gq/aot.jpg', 2006, 'death_note_video.mp4', 0),
(8, 'Fullmetal Alchemist: Brotherhood', 'Fantasy', 'Alchemy and the Philosopher\'s Stone', 'Aniplex', 'https://i.ibb.co/824Xv5R/fmab.png', 2009, 'fmab_video.mp4', 0),
(9, 'Steins;Gate', 'Science Fiction', 'Time travel experiments gone awry', 'Aniplex', 'https://i.ibb.co/tmVJGpB/steins-gate.jpg', 2011, 'steins_gate_video.mp4', 0),
(10, 'Cowboy Bebop', 'Space Western', 'Bounty hunting in space', 'Mappa', 'https://i.ibb.co/19JgT7d/cowboy-bebop.jpg', 1998, 'cowboy_bebop_video.mp4', 0);

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
  `anime_id` int(20) NOT NULL,
  `requires_subscription` bit(1) NOT NULL,
  `episode_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anime_episode`
--

INSERT INTO `anime_episode` (`id`, `episode_title`, `video_url`, `anime_id`, `requires_subscription`, `episode_number`) VALUES
(1, '1', 'https://www.youtube.com/embed/alYaVjRTrOA?si=QIU1PHYH3xThZbvi', 1, b'0', 1),
(2, '2', 'https://www.youtube.com/embed/NjA4VF7cACY?si=tdXXT6M-6evo0DCg', 1, b'1', 2),
(3, '1', 'https://www.youtube.com/embed/J9i6TA0NDk4?si=kiNkJGjQSMZdrCrf', 1, b'1', 5);

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
(35, 'awdawdawd', '2023-12-11 09:48:38', 1, 5);

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
(13);

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
(53, 2, 5),
(57, 2, 5),
(58, 3, 5),
(59, 3, 5),
(60, 3, 5),
(61, 3, 5),
(62, 3, 5),
(65, 1, 5),
(66, 2, 5),
(67, 3, 5),
(68, 2, 5),
(69, 2, 5),
(70, 2, 5),
(71, 2, 5),
(72, 2, 5);

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
  `user_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `subscribe`
--

INSERT INTO `subscribe` (`subscribe_id`, `duration`, `user_id`, `customer_id`) VALUES
(1, 2, 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(31) NOT NULL,
  `adminchmod` int(11) DEFAULT NULL,
  `customerchmod` int(11) DEFAULT NULL,
  `publisherchmod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `username`, `password`, `user_type`, `adminchmod`, `customerchmod`, `publisherchmod`) VALUES
(2, '123', '123', '123', '123', 'CUSTOMER', NULL, 123, NULL),
(5, 'contoh.user@example.com11', 'Anjay1', 'Anjay1', 'contoh_kata_sandi1', 'ADMIN', 0, 0, 0),
(12, 'Anjay112313@gmail.com', NULL, 'Anjay112313', '123', 'CUSTOMER', NULL, 0, NULL);

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
(219, '2023-12-12 18:57:18', 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`anime_id`);

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
  ADD KEY `FKcjtl7t3c3v6yfjolkbgxvtg58` (`anime_id`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKls5dk492ff4iloy9lfhxnx5ri` (`anime_episode_id`),
  ADD KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5t9e6wsndb5xjsx8cjb6no2fi` (`anime_episode_id`),
  ADD KEY `FKi2wo4dyk4rok7v4kak8sgkwx0` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT untuk tabel `animeepisode`
--
ALTER TABLE `animeepisode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `anime_episode`
--
ALTER TABLE `anime_episode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `subscribe_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_history`
--
ALTER TABLE `user_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anime_episode`
--
ALTER TABLE `anime_episode`
  ADD CONSTRAINT `FKcjtl7t3c3v6yfjolkbgxvtg58` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`anime_id`);

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
-- Ketidakleluasaan untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `FK31lkjb2x51cw4bljtmswtj6r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `FKaa6ilb6iqih95bntoeyysb2pc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `epsanime-history` FOREIGN KEY (`anime_episode_id`) REFERENCES `anime_episode` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
