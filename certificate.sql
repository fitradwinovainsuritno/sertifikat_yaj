-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Mar 2024 pada 08.17
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `certificate`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `certificates`
--

CREATE TABLE `certificates` (
  `certificate_id` int(11) NOT NULL,
  `participant_name` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `certificate_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `certificates`
--

INSERT INTO `certificates` (`certificate_id`, `participant_name`, `event_name`, `event_date`, `certificate_text`, `created_at`) VALUES
(1, 'Rizla Azcha Fahrezi', 'Praktik Kerja Lapangan (PKL)- rizla', '2022-10-03', 'Telah menyelesaikan Program Pendidikan Sistem Ganda melalui Praktik Kerja Lapangan (PKL) yang dilaksanakan di :', '2024-03-03 14:07:38'),
(2, 'fsrgdtyfjguhil', 'Praktik Kerja Lapangan (PKL)-ajbskadjsd', '2022-10-03', 'Telah menyelesaikan Program Pendidikan Sistem Ganda melalui Praktik Kerja Lapangan (PKL) yang dilaksanakan di :', '2024-03-03 14:07:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `certificate_assignments`
--

CREATE TABLE `certificate_assignments` (
  `assignment_id` int(11) NOT NULL,
  `certificate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `certificate_assignments`
--

INSERT INTO `certificate_assignments` (`assignment_id`, `certificate_id`, `user_id`, `event_id`, `assigned_at`) VALUES
(1, 1, 1, 1, '2024-03-03 14:22:03'),
(2, 1, 2, 2, '2024-03-04 04:56:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_date`, `location`, `organizer`, `created_at`) VALUES
(1, 'Praktik Kerja Lapangan (PKL)', '2022-10-03', 'PT. Konekthing Benda Pintar', 'SMK YAJ DEPOK', '2024-03-03 13:30:47'),
(2, 'Praktik Kerja Lapangan (PKL)', '2022-10-03', 'PT. Konekthing Benda Pintar', 'SMK YAJ DEPOK', '2024-03-03 13:30:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `created_at`, `level`) VALUES
(0, 'admin', '$2y$10$NacgI41gJwVjMxd9hB.5quMm.28aVc57SOwXwim4B7de1kbnPJo/W', 'admin', 'admin@gmail.com', '2024-02-28 02:06:27', 'admin'),
(1, 'Rizla Azc', '$2y$10$r8rwGWK.ZjDUKnKBj8iIlO2gqRW0PVY4ay1ids/d1ed2d9icjWSVS', 'Rizla Azcha Fahrezi', 'azchafahrezi@gmail.com', '2024-03-03 13:36:33', 'user'),
(2, 'fsrgdtyfjguhil', '$2y$10$SyNeWZO0u0KJR/ItvrxPIO5pypSTsnhsbZyvd8agZe4HdCSps3wOi', 'sgdhgfjhgkjhkjk', 'wtytyukghij@gmail.com', '2024-03-04 04:52:16', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`certificate_id`);

--
-- Indeks untuk tabel `certificate_assignments`
--
ALTER TABLE `certificate_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `cerƟficate_id` (`certificate_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `certificates`
--
ALTER TABLE `certificates`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `certificate_assignments`
--
ALTER TABLE `certificate_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `certificate_assignments`
--
ALTER TABLE `certificate_assignments`
  ADD CONSTRAINT `certificate_assignments_ibfk_1` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`certificate_id`),
  ADD CONSTRAINT `certificate_assignments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `certificate_assignments_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
