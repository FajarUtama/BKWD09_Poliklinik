-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 08:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik_bk`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED NOT NULL,
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `status_periksa` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(1, 1, 2, 'Bentar lagi meninggal', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(1, 1, 2),
(2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(1, 'aku', '89ccfac87d8d06db06bf3211cb2d69ed', 'Jl. Jalan', '081234567890', 2),
(2, 'kamu', '48ec8af8df4bf4347d9b1de4ee7bb092', 'Jl. Kenangan', '089876543210', 3),
(4, 'dia', '465b1f70b50166b6d05397fca8d600b0', 'Jl. Siratalmustakim', '081222333444', 5);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `status`) VALUES
(2, 2, 'Kamis', '12:00:00', '14:00:00', 1),
(3, 4, 'Senin', '13:00:00', '14:00:00', 1),
(7, 1, 'Senin', '23:59:00', '00:00:00', 1),
(8, 1, 'Kamis', '00:00:00', '00:01:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Sucralfate', 'Ktk 10 btl @ 10 ml', 25000),
(2, 'Paracetamol', 'Tablet', 10000),
(3, 'Omeprazole', 'ktk 10 x 10 tablet', 118000),
(4, 'Amodipine', 'ktk 10 x 10 table', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(1, 'Mariyadi', 'f0729003033d083d576a460278bd0055', 'Hogward', '332816042002', '082222333444', '202312-001'),
(2, 'Bagus', '17b38fc02fd7e92f3edeb6318e3066d8', 'Pekalongan', '332823062002', '083333444555', '202312-002'),
(3, 'Solikin', '29f43cb1f97a300effb25881bf201ebc', 'Pemalang', '332816052002', '085555666777', '202312-003');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 1, '2024-01-05 20:29:00', 'Iya Bentar lagi Meninggal, Terusin aja', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Klinik Akupuntur', 'Klinik akupuntur adalah fasilitas kesehatan yang menyediakan layanan terapi akupuntur. Akupuntur merupakan suatu metode pengobatan tradisional yang berasal dari Tiongkok, di mana jarum-tipis dimasukkan ke dalam titik-titik tertentu pada tubuh untuk merangsang energi vital atau \"qi\" guna memulihkan keseimbangan tubuh dan mengatasi berbagai masalah kesehatan.'),
(2, 'Klinik Anak', 'Klinik anak adalah pusat pelayanan kesehatan yang khusus menangani masalah kesehatan anak-anak. Para dokter dan perawat di klinik anak memiliki keahlian dalam merawat dan mengobati berbagai kondisi medis yang biasanya terkait dengan perkembangan dan pertumbuhan anak-anak, mulai dari bayi hingga remaja.'),
(3, 'Klinik Bedah', 'Klinik bedah adalah fasilitas medis di mana prosedur bedah dilakukan. Ini bisa mencakup berbagai jenis operasi, mulai dari tindakan minor seperti pengangkatan kista hingga prosedur bedah mayor seperti pembedahan organ internal. Tim medis di klinik bedah terdiri dari ahli bedah, perawat bedah, dan personel pendukung lainnya.'),
(4, 'Klinik Bedah Saraf', 'Klinik bedah saraf adalah unit spesialis dalam bidang bedah yang fokus pada sistem saraf. Di sini, dokter bedah saraf menangani berbagai gangguan saraf, seperti tumor otak, cedera saraf tulang belakang, atau gangguan saraf perifer. Pelayanan di klinik ini mencakup diagnosis, pengobatan, dan pemulihan pasien dengan masalah neurologis.'),
(5, 'Klinik Gigi', 'Klinik gigi adalah fasilitas pelayanan kesehatan oral yang menyediakan perawatan gigi dan mulut. Dokter gigi di klinik ini menangani berbagai masalah mulai dari pencegahan, perawatan gigi berlubang, hingga prosedur kosmetik seperti pemutihan gigi dan pemasangan kawat gigi. Klinik gigi juga dapat memberikan edukasi mengenai kebersihan gigi dan perawatan rutin.'),
(6, 'Klinik Forensik', 'Klinik Forensik adalah fasilitas kesehatan yang khusus menyediakan pelayanan medis terkait dengan bidang forensik atau ilmu hukum. Klinik ini berfokus pada penerapan pengetahuan medis untuk membantu proses penyelidikan hukum dan peradilan. Pelayanan klinik forensik mencakup pemeriksaan medis terhadap korban kejahatan atau orang yang meninggal secara tiba-tiba, penilaian cedera, identifikasi mayat, pengumpulan bukti medis, serta memberikan kesaksian ahli di pengadilan. Klinik forensik berperan penting dalam mendukung sistem peradilan dan menyediakan informasi medis yang kritis untuk penyelidikan hukum.'),
(7, 'Klinik Olahraga', 'Klinik Olahraga adalah fasilitas kesehatan yang secara khusus menyediakan pelayanan medis dan rehabilitasi untuk atlet dan individu yang terlibat dalam aktivitas fisik intensif atau olahraga. Klinik ini memiliki tim profesional yang terlatih dalam merawat cedera olahraga, memberikan perawatan fisioterapi, melibatkan program latihan khusus, serta memberikan saran untuk meningkatkan kinerja atlet.'),
(9, 'Klinik Saraf', 'Klinik Saraf adalah fasilitas pelayanan kesehatan yang secara khusus fokus pada diagnosis, pengobatan, dan manajemen berbagai gangguan dan penyakit yang berkaitan dengan sistem saraf. ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarPoli_jadwal` (`id_jadwal`),
  ADD KEY `fk_daftarPoli_pasien` (`id_pasien`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailPeriksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailPeriksa_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarPoli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftarPoli_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftarPoli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailPeriksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailPeriksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwal_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarPoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
