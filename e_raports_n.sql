-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2025 at 03:01 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_raports_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `idguru` int NOT NULL,
  `nip` varchar(25) DEFAULT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `tmp_lhr` varchar(128) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`idguru`, `nip`, `nama`, `tmp_lhr`, `tgl_lhr`, `jk`, `alamat`) VALUES
(7, '92060112710970001', 'Eka Saputra, S.Pd.', 'Pati', '1984-07-26', 'L', 'Jl. Merdeka '),
(8, '92060112710970002', 'Bagus Prihandoko, S.Pd.', 'Pati', '1989-08-30', 'L', 'Jl. Penjawi'),
(9, '92060112710970003', 'Silvani Violita, S.Pd.', 'Pati', '1997-10-29', 'P', 'Jl. Ratu Kalinyamat'),
(10, '92060112710970004', 'Dwi Agus Salim, S.Pd.', 'Pati', '1998-01-07', 'L', 'Jl. Merdeka'),
(12, '92060112710970005', 'Zahra Amelia, S.Pd.', 'Pati', '1995-07-13', 'L', 'Jl. Kaliurang'),
(13, '92060112710970006', 'Putri Yulia Sari, S.Pd.', 'Pati', '1998-08-20', 'P', 'Jl. Kaliurang'),
(14, '92060112710970007', 'Hafidzah, S.Pd.', 'Pati', '1995-12-28', 'P', 'Jl. Pandawa'),
(15, '92060112710970008', 'Lina Noor Afifah, S.Pd.', 'Pati', '1999-06-24', 'P', 'Jl. Gunungsari'),
(16, '92060112710970009', 'Intan Erviatun, S.H.', 'Pati', '1999-06-16', 'P', 'Jl. Ratu Kalinyamat'),
(17, '92060112710970010', 'Reza Alfiana, S.E.', 'Pati', '1999-08-20', 'P', 'Jl. Ratu Kalinyamat'),
(18, '92060112710970011', 'Muhammad Adam, S.Kom.', 'Pati', '1998-11-04', 'L', 'Jl. Merdeka Barat'),
(19, '92060112710970012', 'Risa Yunianti, S.Pd.', 'Pati', '1998-07-23', 'P', 'Jl. Ratu Kalinyamat'),
(20, '92060112710970013', 'Nur Wahyudha, S.Pd.', 'Pati', '1999-12-02', 'L', 'Jl. Ratu Kalinyamat');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `idkelas` int NOT NULL,
  `kelas_kd` varchar(10) DEFAULT NULL,
  `kelas_nama` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `kitab`
--

CREATE TABLE `kitab` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_mapel` int NOT NULL,
  `id_tahun_akademik` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `idmapel` int NOT NULL,
  `mapel_kd` varchar(10) DEFAULT NULL,
  `mapel_nama` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mengajar`
--

CREATE TABLE `mengajar` (
  `idmengajar` int NOT NULL,
  `idtahun_akademik` int NOT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `idguru` int NOT NULL,
  `idmapel` int NOT NULL,
  `idkelas` int NOT NULL,
  `kkm` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `idnilai` int NOT NULL,
  `idtahun_akademik` int NOT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `idkelas` int NOT NULL,
  `idmapel` int NOT NULL,
  `idsiswa` int NOT NULL,
  `nilai_tp1` int DEFAULT NULL,
  `nilai_tp2` int DEFAULT NULL,
  `nilai_tp3` int DEFAULT NULL,
  `nilai_tp4` int DEFAULT NULL,
  `nilai_tp5` int DEFAULT NULL,
  `nilai_tp6` int DEFAULT NULL,
  `nilai_tp7` int DEFAULT NULL,
  `rata_tp` int DEFAULT NULL,
  `nilai_uh1` int DEFAULT NULL,
  `nilai_uh2` int DEFAULT NULL,
  `nilai_uh3` int DEFAULT NULL,
  `nilai_uh4` int DEFAULT NULL,
  `nilai_uh5` int DEFAULT NULL,
  `nilai_uh6` int DEFAULT NULL,
  `nilai_uh7` int DEFAULT NULL,
  `rata_uh` int DEFAULT NULL,
  `nilai_pts` int DEFAULT NULL,
  `nilai_uas` int DEFAULT NULL,
  `nilai_akhir` int DEFAULT NULL,
  `nilai_huruf` enum('A','B','C','D','E') DEFAULT NULL,
  `deskripsi` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `profil_sekolah`
--

CREATE TABLE `profil_sekolah` (
  `idprofil_sekolah` int NOT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `status` enum('Negeri','Swasta') DEFAULT NULL,
  `nama_kepsek` varchar(128) DEFAULT NULL,
  `nip_kepsek` varchar(25) DEFAULT NULL,
  `akreditasi` enum('kosong','A','B','C') DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `provinsi` varchar(128) DEFAULT NULL,
  `kabupaten` varchar(128) DEFAULT NULL,
  `kecamatan` varchar(128) DEFAULT NULL,
  `kelurahan` varchar(128) DEFAULT NULL,
  `dusun` varchar(128) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `alamat` varchar(256) DEFAULT NULL,
  `kodepos` varchar(10) DEFAULT NULL,
  `lintang` varchar(15) DEFAULT NULL,
  `bujur` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `profil_sekolah`
--

INSERT INTO `profil_sekolah` (`idprofil_sekolah`, `nama`, `npsn`, `status`, `nama_kepsek`, `nip_kepsek`, `akreditasi`, `logo`, `provinsi`, `kabupaten`, `kecamatan`, `kelurahan`, `dusun`, `rt`, `rw`, `alamat`, `kodepos`, `lintang`, `bujur`) VALUES
(1, 'YAYASAN YANURIS SRIMAJU', '60401524', 'Swasta', 'Muhammad Amiruddin, S.Ag', '-', 'A', 'logo-sekolah.png', 'Sumatera Selatan', 'Musi Banyuasin', 'Kec. Bayung Lencir', 'Bayung Lencir', '', '', '', 'Jl. Palembang - Jambi', '30578', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `idrombel` int NOT NULL,
  `idwali_kelas` int NOT NULL,
  `idsiswa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int NOT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `nis` varchar(5) DEFAULT NULL,
  `nisn` varchar(15) DEFAULT NULL,
  `nik` varchar(25) DEFAULT NULL,
  `nama` varchar(128) DEFAULT NULL,
  `tmp_lhr` varchar(128) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `hobi` varchar(128) DEFAULT NULL,
  `citacita` varchar(128) DEFAULT NULL,
  `sts_anak` enum('Anak Kandung','Anak Tiri','Anak Angkat') DEFAULT NULL,
  `jml_sdr` int DEFAULT NULL,
  `anak_ke` int DEFAULT NULL,
  `alamat` text,
  `nik_ayah` varchar(25) DEFAULT NULL,
  `nama_ayah` varchar(128) DEFAULT NULL,
  `pend_ayah` varchar(50) DEFAULT NULL,
  `pekr_ayah` varchar(50) DEFAULT NULL,
  `nik_ibu` varchar(25) DEFAULT NULL,
  `nama_ibu` varchar(128) DEFAULT NULL,
  `pend_ibu` varchar(50) DEFAULT NULL,
  `pekr_ibu` varchar(50) DEFAULT NULL,
  `alamat_ortu` text,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `status` enum('Aktif','Nonaktif','Pindah','Keluar','Alumni') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `idtahun_akademik` int NOT NULL,
  `tahun_akademik` varchar(10) DEFAULT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `semester_aktif` tinyint DEFAULT NULL,
  `tempat` varchar(128) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int NOT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `user_password` varchar(128) DEFAULT NULL,
  `user_fullname` varchar(128) DEFAULT NULL,
  `user_type` enum('super_user','guru','siswa') DEFAULT NULL,
  `is_block` tinyint(1) DEFAULT NULL,
  `create_at` int DEFAULT NULL,
  `update_at` int DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idusers`, `user_name`, `user_password`, `user_fullname`, `user_type`, `is_block`, `create_at`, `update_at`, `create_by`, `update_by`) VALUES
(1, 'admin', '$2y$18$dVHGwYdAl6iEIVuET03xYOni3n/8/ekfUpHFBNXFzO/6vAsyIUVoG', 'Madin Nurul Islam', 'super_user', 0, 1556509343, 1586934959, 1, 1),
(18, 'guru', '$2y$10$k6jo/S9Bme1fUCLFMrzWvOGdKpz5N5e96LaAMBuzAx/4NwCFjyjZK', 'guru', 'guru', 0, 1586150893, 1660960218, 1, 1),
(29, 'guru1', '$2y$10$hTwF1b8UKv66utTJfA9t8O92VJFqp/1nUhWuS37TUCVEvR8Opa2Zi', 'guru1', 'guru', 0, 1586151104, NULL, 1, NULL),
(30, 'guru2', '$2y$10$e79TkCEI2gBpSzb06eaGIOE4UDQXPUzU0944QdSBp/Ir1rYzT/qWa', 'guru2', 'guru', 0, 1586151104, NULL, 1, NULL),
(31, 'guru3', '$2y$10$K7wLEa5sjGF.DpvNL1pkPek3Fc5iGzNzLiogwW.4LDt/8IfUr9fe.', 'guru3', 'guru', 0, 1586151104, NULL, 1, NULL),
(32, 'guru4', '$2y$10$3v47kVI.v0DDxM.lkDV.ruFB5RKrCOCAxcrQNomvOCkJwJVj77WPa', 'guru4', 'guru', 0, 1586151104, NULL, 1, NULL),
(33, 'siswa', '$2y$10$CXBNfEgUwvQjtdtF3uPWxu84wz1dzsUk9cA.ZWPEu3MhUU6NJHIPi', 'Siswa', 'siswa', 0, 1586151396, 1660960885, 1, 1),
(38, '92060112710970006', '$2y$10$eFStSKpabDiXeVNwSGElt.G32otg/iIBMyoJkXX9fJ/D.y.BKYgqi', 'Putri Yulia Sari, S.Pd.', 'guru', 0, 1660958133, NULL, 1, NULL),
(39, '92060112710970007', '$2y$10$05YwUdblVOyPLwgYAX6MWuOUt/gGRgNbmwtj9XaCvhtbhYOZzQ6L6', 'Hafidzah, S.Pd.', 'guru', 0, 1660958386, NULL, 1, NULL),
(40, '92060112710970008', '$2y$10$GmFfKNLJHhzuJ2K6wSTbiufeEGKFYGfFx7wFJffErUDgiCLQlR1Zi', 'Lina Noor Afifah, S.Pd.', 'guru', 0, 1660958389, NULL, 1, NULL),
(41, '92060112710970009', '$2y$10$xiXV5IHUCtUbGdnF4v7D8OQCszRwqWgmwmB2e/gJQ9eG6uTti5s9y', 'Intan Erviatun, S.H.', 'guru', 0, 1660958457, NULL, 1, NULL),
(42, '92060112710970010', '$2y$10$Grp6TvB.FEuz/PAc06A/be93oc7H9cz.i.lQGQyDwW2uTIvRatJH.', 'Reza Alfiana, S.E.', 'guru', 0, 1660958521, NULL, 1, NULL),
(43, '92060112710970011', '$2y$10$Sbc7XroehO6UfiLV35BRfOj1dL3FTKlHFUfXDEsCXaWzCXOpWafGi', 'Muhammad Adam, S.Kom.', 'guru', 0, 1660958754, NULL, 1, NULL),
(44, '92060112710970012', '$2y$10$EVzphBpmeOiaxjKBPg4h6OwU/2vLQ8fYQ0.Xm3qtzTG/oIgVzNksG', 'Risa Yunianti, S.Pd.', 'guru', 0, 1660958759, NULL, 1, NULL),
(45, '92060112710970013', '$2y$10$PZqbkLBFKGpn5bPR8kOYYuWGPaT7rEvRyd7LZaSc/DRR/dxX0jO6O', 'Nur Wahyudha, S.Pd.', 'guru', 0, 1660958760, NULL, 1, NULL),
(46, '92060112710970001', '$2y$10$0wgO41WCumbzibUlTUys.eIq7WpDlFVFh8a1VYSdrW9RGRElAPJyy', 'Eka Saputra, S.Pd.', 'guru', 0, 1660961250, NULL, 1, NULL),
(47, '92060112710970002', '$2y$10$5DJBQXxqSac43DpgWf2Gg.7NSko7vNp2Es3DwN7yrLIzlrSznn9UC', 'Bagus Prihandoko, S.Pd.', 'guru', 0, 1660961251, NULL, 1, NULL),
(48, '92060112710970004', '$2y$10$cHjGcQQfuzJg/Cj3y0ag3ugP/J5srCVJ140XVXFtgWBb5ueLRxxyi', 'Dwi Agus Salim, S.Pd.', 'guru', 0, 1660961253, NULL, 1, NULL),
(49, '92060112710970003', '$2y$10$2gVdYiBLig7a3p19cpVUm.UC3ddUo7OPpzfr489OeuQ8zxslINsPi', 'Silvani Violita, S.Pd.', 'guru', 0, 1660961255, NULL, 1, NULL),
(50, '92060112710970005', '$2y$10$KuEW62nWA5WHQPHwJyvvkOcl7KTZMwpslzr6hVQx3Se32nAKB5UXi', 'Zahra Amelia, S.Pd.', 'guru', 0, 1660961257, NULL, 1, NULL),
(51, '1234', '$2y$10$UyBKCEhTZQbwhlCYTbx4YOG4KxjL882Ci7/yjIFMUgeZCv1WQPIa2', 'Eka Saputra', 'siswa', 0, 1660961278, NULL, 1, NULL),
(52, '1235', '$2y$10$xDT.YbBSEXgUTbLGphCpyOaZ7oUwBnPQ82cQ6Hz/jDk3eXWqaYZgC', 'Bagus Saputra', 'siswa', 0, 1660961278, NULL, 1, NULL),
(53, '1236', '$2y$10$b.syT/0bYZF/A.D4/P6e4uFf2a.7b6b38AAbWw/xEeHT87Jf0aBRW', 'Ahmad Saputra', 'siswa', 0, 1660961278, NULL, 1, NULL),
(54, '1237', '$2y$10$iJ0JJWiOe.IsbXTmM9Ua7O916qd8MOvt367CSP9dNcrYmaebtAhAi', 'Mega Purnama', 'siswa', 0, 1660961278, NULL, 1, NULL),
(55, '1238', '$2y$10$tiLH91WKkJuvrRFUF2680.yhiq88905vkToqKLvfIgM7sD5nvturO', 'Mualifatul Ulya', 'siswa', 0, 1660961278, NULL, 1, NULL),
(56, '44444', '$2y$10$cNDknKbGZg6aY9b4.4TN9uunfyor27qHnuG7cJWNOKUTb0NpjorWS', 'zaki', 'siswa', 0, 1735524763, NULL, 1, NULL),
(57, '53534', '$2y$10$R6PeoLdoe4mkiTZLn2R3F.Csbv0infaW6YRk3jVxko.Jas/4swlTS', 'sada', 'siswa', 0, 1735524818, NULL, 1, NULL),
(58, '989', '$2y$10$lk1qdVWXa4g0EcVSzghVA.jHvjuIkqvoTfarMRaHvMjtCwLN60P.i', 'RAHMAT', 'siswa', 0, 1735536983, NULL, 1, NULL),
(59, '43242', '$2y$10$vVeN6YaOgPQ1RNwaZnixIuTmcAXTHg2yChhxWsWZP1v2V10VpdEz2', 'ggggggggg', 'siswa', 0, 1750152777, NULL, 1, NULL),
(60, '1212', '$2y$10$qnwO3I78Cy5/kGQlQRmMnOkTq4xPCjV.lm.QhM47wXwoiuAmYHb9u', 'DFDSDF', 'siswa', 0, 1750259109, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `idwali_kelas` int NOT NULL,
  `idtahun_akademik` int NOT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `idkelas` int NOT NULL,
  `idguru` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('45qipj9o5liurpn8hv0lqsqbtucg21j8', '::1', 1750257482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303235373438303b6d73677c733a3139343a223c64697620636c6173733d22616c65727420616c6572742d64616e67657220616c6572742d6469736d69737369626c65223e3c627574746f6e20747970653d22627574746f6e2220636c6173733d22636c6f73652220646174612d6469736d6973733d22616c6572742220617269612d68696464656e3d2274727565223e2674696d65733b3c2f627574746f6e3e3c6920636c6173733d2266612066612d62616e223e3c2f693e2050617373776f726420616e64612073616c61682e3c2f6469763e223b5f5f63695f766172737c613a313a7b733a333a226d7367223b733a333a226e6577223b7d),
('6gem2q0gnjfg71f3nqk1lv0hrmjfbvdg', '127.0.0.1', 1754323088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735343332333037303b6d73677c733a3139343a223c64697620636c6173733d22616c65727420616c6572742d64616e67657220616c6572742d6469736d69737369626c65223e3c627574746f6e20747970653d22627574746f6e2220636c6173733d22636c6f73652220646174612d6469736d6973733d22616c6572742220617269612d68696464656e3d2274727565223e2674696d65733b3c2f627574746f6e3e3c6920636c6173733d2266612066612d62616e223e3c2f693e2050617373776f726420616e64612073616c61682e3c2f6469763e223b5f5f63695f766172737c613a313a7b733a333a226d7367223b733a333a226f6c64223b7d69647c733a313a2231223b757365726e616d657c733a353a2261646d696e223b6163636573737c733a31303a2273757065725f75736572223b),
('809gtkhjagagmn1jeef3icbc0mer3lhc', '127.0.0.1', 1753927818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735333932373830313b6d73677c733a3139343a223c64697620636c6173733d22616c65727420616c6572742d64616e67657220616c6572742d6469736d69737369626c65223e3c627574746f6e20747970653d22627574746f6e2220636c6173733d22636c6f73652220646174612d6469736d6973733d22616c6572742220617269612d68696464656e3d2274727565223e2674696d65733b3c2f627574746f6e3e3c6920636c6173733d2266612066612d62616e223e3c2f693e2050617373776f726420616e64612073616c61682e3c2f6469763e223b5f5f63695f766172737c613a313a7b733a333a226d7367223b733a333a226f6c64223b7d69647c733a313a2231223b757365726e616d657c733a353a2261646d696e223b6163636573737c733a31303a2273757065725f75736572223b),
('cd5pcor6l8b3vgdsop4hd7bk4331k2v8', '127.0.0.1', 1750260084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303235393839323b69647c733a313a2231223b757365726e616d657c733a353a2261646d696e223b6163636573737c733a31303a2273757065725f75736572223b737563636573737c733a31383a2250657275626168616e20626572686173696c223b5f5f63695f766172737c613a323a7b733a373a2273756363657373223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d6572726f727c733a3135333a224461746120746964616b2074657273696d70616e2e204b656d756e676b696e616e207465726a616469206475706c696b61736920646174612c2070656e6761747572616e2077616c69206b656c61732062656c756d206469617475722c206174617520736572766572206265726d6173616c61682c2073696c61686b616e20706572696b7361206b656d62616c69206461746120416e64612e223b);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`idkelas`);

--
-- Indexes for table `kitab`
--
ALTER TABLE `kitab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_tahun_akademik` (`id_tahun_akademik`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`idmapel`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`idmengajar`,`idtahun_akademik`,`idguru`,`idmapel`,`idkelas`),
  ADD KEY `fk_guru_has_mapel_mapel1_idx` (`idmapel`),
  ADD KEY `fk_guru_has_mapel_guru1_idx` (`idguru`),
  ADD KEY `fk_mengajar_tahun_akademik1_idx` (`idtahun_akademik`),
  ADD KEY `fk_mengajar_kelas1_idx` (`idkelas`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`idnilai`,`idtahun_akademik`,`idkelas`,`idmapel`,`idsiswa`),
  ADD KEY `fk_mapel_has_siswa_siswa1_idx` (`idsiswa`),
  ADD KEY `fk_mapel_has_siswa_mapel1_idx` (`idmapel`),
  ADD KEY `fk_nilai_tahun_akademik1_idx` (`idtahun_akademik`),
  ADD KEY `fk_nilai_kelas1_idx` (`idkelas`);

--
-- Indexes for table `profil_sekolah`
--
ALTER TABLE `profil_sekolah`
  ADD PRIMARY KEY (`idprofil_sekolah`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`idrombel`,`idwali_kelas`,`idsiswa`),
  ADD KEY `fk_rombel_siswa1_idx` (`idsiswa`),
  ADD KEY `fk_rombel_wali_kelas1_idx` (`idwali_kelas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`);

--
-- Indexes for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`idtahun_akademik`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- Indexes for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`idwali_kelas`,`idtahun_akademik`,`idkelas`,`idguru`),
  ADD KEY `fk_rombel_has_guru_guru1_idx` (`idguru`),
  ADD KEY `fk_wali_kelas_kelas1_idx` (`idkelas`),
  ADD KEY `fk_tahun_akademik_tahun_akademik1_idx` (`idtahun_akademik`);

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `idguru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `idkelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kitab`
--
ALTER TABLE `kitab`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `idmapel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mengajar`
--
ALTER TABLE `mengajar`
  MODIFY `idmengajar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `idnilai` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `profil_sekolah`
--
ALTER TABLE `profil_sekolah`
  MODIFY `idprofil_sekolah` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rombel`
--
ALTER TABLE `rombel`
  MODIFY `idrombel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `idtahun_akademik` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `idwali_kelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kitab`
--
ALTER TABLE `kitab`
  ADD CONSTRAINT `kitab_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`idmapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kitab_ibfk_2` FOREIGN KEY (`id_tahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD CONSTRAINT `fk_guru_has_mapel_guru1` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`),
  ADD CONSTRAINT `fk_guru_has_mapel_mapel1` FOREIGN KEY (`idmapel`) REFERENCES `mapel` (`idmapel`),
  ADD CONSTRAINT `fk_mengajar_kelas1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`),
  ADD CONSTRAINT `fk_mengajar_tahun_akademik1` FOREIGN KEY (`idtahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `fk_mapel_has_siswa_mapel1` FOREIGN KEY (`idmapel`) REFERENCES `mapel` (`idmapel`),
  ADD CONSTRAINT `fk_mapel_has_siswa_siswa1` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`),
  ADD CONSTRAINT `fk_nilai_kelas1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`),
  ADD CONSTRAINT `fk_nilai_tahun_akademik1` FOREIGN KEY (`idtahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`);

--
-- Constraints for table `rombel`
--
ALTER TABLE `rombel`
  ADD CONSTRAINT `fk_rombel_siswa1` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`),
  ADD CONSTRAINT `fk_rombel_wali_kelas1` FOREIGN KEY (`idwali_kelas`) REFERENCES `wali_kelas` (`idwali_kelas`);

--
-- Constraints for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD CONSTRAINT `fk_rombel_has_guru_guru1` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`),
  ADD CONSTRAINT `fk_tahun_akademik_tahun_akademik1` FOREIGN KEY (`idtahun_akademik`) REFERENCES `tahun_akademik` (`idtahun_akademik`),
  ADD CONSTRAINT `fk_wali_kelas_kelas1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
