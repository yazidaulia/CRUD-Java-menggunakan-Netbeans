-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2020 at 09:44 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sparepart_mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(6) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `jenis_barang`, `harga`, `stok`) VALUES
('FMB001', 'DENSO Air Filter', 'Filter Mobil', 41000, 98),
('FMB004', 'ASPIRA Saringan Oli', 'Filter Mobil', 14000, 100),
('REM001', 'Akebonno Kampas RD', 'Rem, Perlengkapan', 190000, 100),
('REM002', 'Akebonno Kampas RB', 'Rem, Perlengkapan', 364000, 100),
('REM003', 'Lpr Brake Pad', 'Rem, Perlengkapan', 180000, 100),
('REM004', 'Monotaro Brake Pad TYT', 'Rem, Perlengkapan', 190000, 100),
('SPP001', 'Piston Ring Compressor', 'Spare Part', 39000, 100),
('SPP002', 'Sparex Piston n Ring Set', 'Spare Part', 3630000, 99),
('SPP003', 'DNY Head Lamp Right', 'Spare Part', 363000, 100),
('SPP004', 'DNY Fog Lamp', 'Spare Part', 81400, 100),
('WPM001', 'BOSCH Wiper Advantage', 'Wiper Mobil', 34100, 100),
('WPM002', 'DENSO Wiper DDP Premium', 'Wiper Mobil', 140000, 97);

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` varchar(6) NOT NULL,
  `nama_kurir` varchar(30) NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_transaksi` varchar(6) NOT NULL,
  `kode_barang` varchar(6) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_transaksi`, `kode_barang`, `jumlah`, `sub_total`) VALUES
('TRS000', 'null', 0, 0),
('TRS002', 'FMB002', 1, 12000),
('TRS004', 'FMB002', 1, 41000),
('TRS004', 'FMB002', 1, 41000),
('TRS004', 'FMB001', 2, 82000),
('TRS004', 'WPM002', 3, 420000),
('TRS004', 'SPP002', 1, 3630000);

-- --------------------------------------------------------

--
-- Table structure for table `penjual`
--

CREATE TABLE `penjual` (
  `id_penjual` varchar(7) NOT NULL,
  `nama_penjual` varchar(30) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjual`
--

INSERT INTO `penjual` (`id_penjual`, `nama_penjual`, `telp`, `alamat`, `password`) VALUES
('admin', 'Auli Rahmad Nurkholis', '14044', 'Jakarta', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(6) NOT NULL,
  `id_penjual` varchar(6) NOT NULL,
  `tgl_jual` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uang_bayar` int(11) NOT NULL,
  `uang_kembali` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_penjual`, `tgl_jual`, `uang_bayar`, `uang_kembali`, `total`) VALUES
('TRS000', 'null', '2020-06-12 07:25:48', 0, 0, 0),
('TRS001', 'admin', '2020-06-12 16:10:15', 150000, 27000, 123000),
('TRS001', 'admin', '2020-06-12 19:00:19', 350000, 28000, 322000),
('TRS002', 'admin', '2020-06-12 19:00:24', 350000, 28000, 322000),
('TRS003', 'admin', '2020-06-12 19:08:13', 130000, 6000, 124000),
('TRS004', 'admin', '2020-06-12 19:29:45', 5000000, 868000, 4132000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`id_penjual`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
