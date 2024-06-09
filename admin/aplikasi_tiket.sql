-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 10:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_tiket`
--

-- --------------------------------------------------------

--
-- Table structure for table `armada`
--

CREATE TABLE `armada` (
  `idarmada` int(11) NOT NULL,
  `jenis_armada` varchar(45) DEFAULT NULL,
  `nama_armada` varchar(45) DEFAULT NULL,
  `kapasitas` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `armada`
--

INSERT INTO `armada` (`idarmada`, `jenis_armada`, `nama_armada`, `kapasitas`) VALUES
(1, 'Bus', 'Darat', '50'),
(2, 'Kapal', 'Laut', '200'),
(3, 'Pesawat', 'Udara', '150'),
(4, 'Kereta', 'Darat', '120');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `idjadwal` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_sampai` time DEFAULT NULL,
  `jam_berangkat` time DEFAULT NULL,
  `rute_idrute` int(11) NOT NULL,
  `armada_idarmada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`idjadwal`, `tanggal`, `jam_sampai`, `jam_berangkat`, `rute_idrute`, `armada_idarmada`) VALUES
(1, '2023-10-25', '08:00:00', '10:30:00', 1, 1),
(2, '2023-10-26', '14:00:00', '16:30:00', 2, 3),
(3, '2023-10-27', '10:00:00', '12:30:00', 3, 4),
(4, '2023-10-28', '09:00:00', '11:30:00', 4, 4),
(5, '2023-10-29', '16:00:00', '18:30:00', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tiket`
--

CREATE TABLE `jenis_tiket` (
  `id_jenisTiket` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `max_kapasitas_bawaan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jenis_tiket`
--

INSERT INTO `jenis_tiket` (`id_jenisTiket`, `nama`, `max_kapasitas_bawaan`) VALUES
(1, 'Ekonomi', '10'),
(2, 'Bisnis', '20'),
(3, 'Eksekutif', '30'),
(4, 'First Class', '40'),
(5, 'VIP', '50');

-- --------------------------------------------------------

--
-- Table structure for table `penumpang`
--

CREATE TABLE `penumpang` (
  `id` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `no_telepon` varchar(32) DEFAULT NULL,
  `berat_bawaan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `penumpang`
--

INSERT INTO `penumpang` (`id`, `Nama`, `gender`, `no_telepon`, `berat_bawaan`) VALUES
(1, 'John Doe', 'Laki-', '08123456789', '10'),
(2, 'Jane Smith', 'Perem', '08567891234', '12'),
(3, 'Michael Johnson', 'Laki-', '08123456700', '11'),
(4, 'Emily Davis', 'Perem', '08765432100', '20'),
(5, 'David Brown', 'Laki-', '08987654321', '25');

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `idrute` int(11) NOT NULL,
  `kode` varchar(45) DEFAULT NULL,
  `kota_asal` varchar(45) DEFAULT NULL,
  `kota_tujuan` varchar(45) DEFAULT NULL,
  `jarak` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`idrute`, `kode`, `kota_asal`, `kota_tujuan`, `jarak`) VALUES
(1, 'R001', 'Surabaya', 'Malang', '100'),
(2, 'R002', 'Surabaya', 'Semarang', '350'),
(3, 'R003', 'Surabaya', 'Solo', '200'),
(4, 'R004', 'Surabaya', 'probolinggo', '120'),
(5, 'R005', 'Surabaya', 'Madiun', '180');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` int(11) NOT NULL,
  `harga` varchar(45) DEFAULT NULL,
  `total_tiket` varchar(45) DEFAULT NULL,
  `totalharga` varchar(45) DEFAULT NULL,
  `penumpang_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `Jenis_Tiket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`idtransaksi`, `harga`, `total_tiket`, `totalharga`, `penumpang_id`, `jadwal_id`, `Jenis_Tiket_id`) VALUES
(1, '100000', '1', '100000', 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `armada`
--
ALTER TABLE `armada`
  ADD PRIMARY KEY (`idarmada`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`idjadwal`),
  ADD KEY `fk_jadwal_rute_idx` (`rute_idrute`),
  ADD KEY `fk_jadwal_armada1_idx` (`armada_idarmada`);

--
-- Indexes for table `jenis_tiket`
--
ALTER TABLE `jenis_tiket`
  ADD PRIMARY KEY (`id_jenisTiket`);

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`idrute`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`,`jadwal_id`),
  ADD KEY `fk_transaksi_penumpang1_idx` (`penumpang_id`),
  ADD KEY `fk_transaksi_jadwal1_idx` (`jadwal_id`),
  ADD KEY `fk_transaksi_Jenis Tiket1_idx` (`Jenis_Tiket_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `armada`
--
ALTER TABLE `armada`
  MODIFY `idarmada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `idjadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jenis_tiket`
--
ALTER TABLE `jenis_tiket`
  MODIFY `id_jenisTiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penumpang`
--
ALTER TABLE `penumpang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `idrute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_jadwal_armada1` FOREIGN KEY (`armada_idarmada`) REFERENCES `armada` (`idarmada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jadwal_rute` FOREIGN KEY (`rute_idrute`) REFERENCES `rute` (`idrute`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_Jenis Tiket1` FOREIGN KEY (`Jenis_Tiket_id`) REFERENCES `jenis_tiket` (`id_jenisTiket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaksi_jadwal1` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`idjadwal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaksi_penumpang1` FOREIGN KEY (`penumpang_id`) REFERENCES `penumpang` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
