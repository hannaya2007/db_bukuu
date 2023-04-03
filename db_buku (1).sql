-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Mar 2023 pada 07.04
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_buku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(15) NOT NULL,
  `nama_buku` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `nama_buku`, `pengarang`, `harga`) VALUES
(1, 'Laskar Pelangi', 'Andrea Hirata', 75000),
(2, 'Cinta Brontosaurus', 'Raditya Dika', 50000),
(3, 'SEPATU DAHLAN', 'KHRISNA PABICHARA', 20000),
(4, 'DEAR NATHAN', 'ERISCA FEBRIANTI', 30000),
(5, 'SANG PEMIMPI', 'ANDREA HIRATA', 150000),
(6, 'Cedera Kepala', 'M. Z. Arifin', 250000),
(7, 'Busines And Personal Development', 'Josua Taringan dan Swenjiadi Yenawan', 300000),
(8, 'Fur Immer Dein Ian ', 'Valerie', 65000),
(9, 'Majnun', 'Anton Kurnia', 70000),
(10, 'Where Stories Begin', 'Wacaku', 35000),
(11, 'Ayat-ayat Cinta', 'Habiburrahman El Shirazy', 95000),
(12, 'Ki Hadjar Dewantara', 'Syaiful Hermawan', 55000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(15) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `email`, `no_hp`) VALUES
(1, 'Joko', 'joko@gmail.com', '085771665388'),
(2, 'Hannaya', 'hannaya@gmail.com', '085173585388'),
(3, 'Edo', 'edo@gmail.com', '085831667955'),
(4, 'Siti', 'siti@gmail.com', '087654332098'),
(5, 'Dani Satrio', 'dani.satrio@gmail.com', '08534428976541'),
(6, 'Limin', 'limin54@gmail.com', '089567453211');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(15) NOT NULL,
  `id_pelanggan` int(15) NOT NULL,
  `id_buku` int(15) NOT NULL,
  `kuantitas` int(15) NOT NULL,
  `harga` varchar(15) NOT NULL,
  `total_harga` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_pelanggan`, `id_buku`, `kuantitas`, `harga`, `total_harga`) VALUES
(1, 1, 7, 2, '300000', '600000'),
(2, 6, 1, 4, '75000', '300000'),
(3, 5, 9, 2, '70000', '140000'),
(5, 2, 11, 1, '95000', '95000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id_buku` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`),
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
