-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2021 pada 06.48
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blanja-api`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `recipient_number` varchar(15) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `address`
--

INSERT INTO `address` (`id`, `user_id`, `title`, `recipient`, `address`, `city`, `province`, `recipient_number`, `zip_code`, `country`) VALUES
(11, 11, 'New House', 'Jack', 'Jl. Kelewatan rt 008/02, tangsel', 'Tangerang ', 'Banten ', '085858855588', 8858085, 'Indonesia'),
(12, 11, 'House 1', 'Wali', 'Jl.Kelewatan block A,  RT 002/02,  Serpong,  Banten', 'Serpong', 'Banten', '0896585588', 808780, 'Germany'),
(13, 11, 'Rumah di Tangerang', 'Test', 'Test', 'Hahah', 'Huh', '08965555542', 805858, 'United State America'),
(14, 11, 'Hahaha', 'Heheheh', 'Jjxjdn', 'Jdidjn', 'Jdkjb', '8580', 880550, 'Indonesia'),
(15, 11, 'Alamat baru 123', 'Rijal', 'Jln.Kisaniin RT 09/02,  Tangerang ', 'Tangerang', 'Test', '087979789', 855985, 'Indonesia'),
(17, 17, 'Rumah di Tangerang', 'Aku bang amat', 'New alamat', 'Jhhjdk', 'Hadir', '5468', 8888, 'Indonesia'),
(18, 17, 'Hahah', 'Test', 'Jalan baru', 'Hdjh', 'Hai', '0859765', 585, 'Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Holando'),
(2, 'Apple'),
(3, 'Curl'),
(4, 'Xiaomi'),
(5, 'Swallow'),
(6, 'Bendz');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_link` varchar(255) NOT NULL,
  `category_color` varchar(20) NOT NULL,
  `category_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_link`, `category_color`, `category_image`) VALUES
(1, 'T-Shirt', 't-shirt', '#CC0B04', '/images/category/t-shirt.png'),
(2, 'Shorts', 'shorts', '#1C3391', '/images/category/shorts.png'),
(3, 'Jacket', 'jacket', '#F67B02', '/images/category/jacket.png'),
(4, 'Pants', 'pants', '#F31F51', '/images/category/pants.png'),
(7, 'Shoes', 'shoes', '#57CD9E', '/images/category/shoes.png'),
(8, 'High heels', 'high-heels', '#5650D8', '/images/category/high-heels.png'),
(9, 'Handbag', 'handbag', '#50C8D8', '/images/category/handbag.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color_code` varchar(25) NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `colors`
--

INSERT INTO `colors` (`color_id`, `color_code`, `color_name`) VALUES
(1, '#020202', 'Hitam'),
(2, '#FFFFFF', 'Putih'),
(3, '#B82222', 'Merah'),
(4, '#F3F433', 'Kuning'),
(5, '#BEA9A9', 'Abu-abu'),
(6, '#E2BB8D', 'Orange'),
(7, '#151867', 'Biru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `conditions`
--

CREATE TABLE `conditions` (
  `condition_id` int(11) NOT NULL,
  `condition_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `conditions`
--

INSERT INTO `conditions` (`condition_id`, `condition_name`) VALUES
(3, 'Broken'),
(1, 'New'),
(2, 'Used');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `id_address` int(11) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT '/images/profile/user.png',
  `user_phone` int(11) NOT NULL,
  `user_gender` enum('Laki-laki','Perempuan') NOT NULL,
  `user_date_birth` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`user_id`, `user_name`, `user_email`, `user_password`, `id_address`, `user_image`, `user_phone`, `user_gender`, `user_date_birth`, `created_at`, `updated_at`) VALUES
(11, 'user13', 'user13@gmail.com ', '$2b$10$4gF7CQeUAltsImBmER09lOcCnzIsiHzsZiefuQPFLc7wFsb3K8z1C', 15, '/images/profile/user.png', 0, 'Laki-laki', '0000-00-00 00:00:00', '2021-01-08 15:18:23', '2021-01-08 15:18:23'),
(17, 'Elwandy Tirtana Deriansyah', 'elwanditirtana1945a@gmail.com ', '$2b$10$xH9jqzBIoi087XHQcf5MEOL5BPqatZMCwd./4LYJrcaW.NhfpB9X2', 18, '/images/profile/1614281250435-photo.jpg', 0, 'Laki-laki', '0000-00-00 00:00:00', '2021-01-09 10:51:53', '2021-01-09 10:51:53'),
(18, 'user15', 'user15@gmail.com', '$2b$10$yfaGgBpTVuNpYRfqX86xD..BEMX7j4dDbaBz0W93HxCw0m76SLxH.', 0, '/images/profile/user.png', 0, 'Laki-laki', '0000-00-00 00:00:00', '2021-02-02 03:16:40', '2021-02-02 03:16:40'),
(19, 'Test', 'Test@gmail.com', '$2b$10$6Ozty9a8wJfGVAHkJZ6bGeB2BAEoU7KZlXyuQYhZ3vn7BMgZHwlpm', 0, '/images/profile/user.png', 0, 'Laki-laki', '0000-00-00 00:00:00', '2021-02-02 13:40:33', '2021-02-02 13:40:33'),
(20, 'Apung', 'apung@gmail.com', '$2b$10$7UVPGdb2WJ0dBJbg8QKhzuylxrmxGCwSSIA.tKwiRFgzeIuo0orjy', 0, '/images/profile/user.png', 0, 'Laki-laki', '0000-00-00 00:00:00', '2021-02-11 13:46:51', '2021-02-11 13:46:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_histories`
--

CREATE TABLE `detail_histories` (
  `detail_history_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `product_color` varchar(255) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_histories`
--

INSERT INTO `detail_histories` (`detail_history_id`, `history_id`, `product_id`, `product_title`, `brand_name`, `product_image`, `product_color`, `product_size`, `product_qty`, `product_subtotal`) VALUES
(39, 49, 19, 'Baju muslim sepasang cowok dan cewek ukuran XL', 'Bendz', '/images/products/1614059835205-upload_images.jpg', 'Hitam', 'xl', 2, 450000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `histories`
--

CREATE TABLE `histories` (
  `history_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `history_code` varchar(255) NOT NULL,
  `history_address` text NOT NULL,
  `history_method` varchar(255) NOT NULL,
  `history_subtotal` int(11) NOT NULL,
  `coupon` varchar(10) NOT NULL,
  `status` enum('packaging','delivering','completed') NOT NULL DEFAULT 'packaging',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `histories`
--

INSERT INTO `histories` (`history_id`, `seller_id`, `user_id`, `history_code`, `history_address`, `history_method`, `history_subtotal`, `coupon`, `status`, `created_at`) VALUES
(49, 5, 17, 'iquxd2pyb9h', 'Jalan baru', 'GoPay', 450000, 'Jihh', 'packaging', '2021-02-26 08:22:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `otp`
--

CREATE TABLE `otp` (
  `id_otp` int(11) NOT NULL,
  `otp` char(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `removed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `otp`
--

INSERT INTO `otp` (`id_otp`, `otp`, `created_at`, `removed_at`) VALUES
(6, 'eQUmn2', '2021-01-09 08:29:32', '2021-01-10 08:29:32'),
(7, 'gylt3Z', '2021-01-09 08:31:26', '2021-01-10 08:31:26'),
(8, 'hn9m9J', '2021-01-09 08:33:05', '2021-01-10 08:33:05'),
(9, 'H70XvB', '2021-01-09 10:55:46', '2021-01-10 10:55:46'),
(11, 'bbFiNl', '2021-02-10 05:43:50', '2021-02-11 05:43:50'),
(12, 'iHU4EM', '2021-02-10 05:48:39', '2021-02-11 05:48:39'),
(13, '8ICVrF', '2021-02-10 05:52:29', '2021-02-11 05:52:29'),
(14, '4NaIv0', '2021-02-10 05:55:19', '2021-02-11 05:55:19'),
(16, '1ifHEl', '2021-02-11 02:05:28', '2021-02-12 02:05:28'),
(20, 'qNP94u', '2021-02-11 03:26:44', '2021-02-12 03:26:44'),
(22, 'hv5tt7', '2021-02-11 03:35:58', '2021-02-12 03:35:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_condition` varchar(50) NOT NULL,
  `product_description` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `product_title`, `brand_id`, `category_id`, `product_price`, `product_qty`, `product_condition`, `product_description`, `created_at`, `updated_at`) VALUES
(1, 5, 'Products 1', 5, 2, 65000, 25, 'Used', 'Celana dengan bahan lentur, lembut dan serap air. Sering dipakai Difilm', '2020-12-21 08:47:35', '2021-01-07 14:59:11'),
(2, 5, 'Products 2', 4, 3, 69999, 23, 'New', 'Test Product Description', '2020-12-21 09:07:15', '2021-01-07 14:59:27'),
(3, 5, 'Inner Landes', 4, 7, 23000, 12, 'New', 'TEst Product 2 deskripsi', '2020-12-21 10:02:14', '2021-01-07 14:59:52'),
(4, 6, 'Sepatu Eagle homiped style blink-blink biru', 2, 7, 47000, 29, 'Used', 'Sepatu merek bingo yang tidak, seperti sepatu lain yg seperti itu yang sebelumnya tidak sama dengan itu', '2021-01-01 11:08:06', '2021-01-21 00:12:31'),
(5, 6, 'Sepatu tanpa alas dengan design elegant', 3, 7, 45000, 20, 'New', 'Sebuah sepatu yang sama aja dengan sepatu lain', '2021-01-21 03:19:38', '2021-01-21 03:19:38'),
(6, 6, 'High heel abri, design ramping', 5, 8, 68000, 12, 'New', 'Sebuah high heel yg sangat cocok untuk bermain dan mendaki', '2021-01-21 03:48:15', '2021-01-21 03:48:15'),
(7, 6, 'Celana macan tutul', 3, 4, 47000, 16, 'Used', 'Celana dari bahan bakar minyak ', '2021-01-21 03:52:14', '2021-01-21 03:52:14'),
(8, 6, 'Test 1', 5, 1, 75000, 12, 'Used', 'Test product ', '2021-01-21 13:15:46', '2021-01-21 13:15:46'),
(10, 6, 'Baju test 1', 2, 1, 24000, 22, 'New', 'Test', '2021-01-21 13:20:51', '2021-01-21 13:20:51'),
(11, 6, 'Baju test 2', 1, 1, 12358, 22, 'New', 'Test', '2021-01-21 13:23:03', '2021-01-21 13:23:03'),
(14, 6, 'Barang baru', 1, 7, 20000, 22, 'New', 'Deskripsi barang', '2021-01-21 18:03:13', '2021-01-21 18:03:13'),
(15, 6, 'Sepatu baru', 4, 7, 47000, 87, 'New', 'Test', '2021-02-02 13:32:41', '2021-02-02 13:32:41'),
(16, 7, 'Baju baru bahan asli', 3, 1, 45000, 20, 'New', 'Baju baru untuk testing', '2021-02-18 08:23:34', '2021-02-18 08:23:34'),
(17, 5, 'Hahah', 1, 7, 5555, 21, 'New', 'New shoes', '2021-02-22 09:20:33', '2021-02-22 09:20:33'),
(18, 5, 'Sendal baru', 4, 7, 85800, 5, 'New', 'Sendal', '2021-02-22 09:24:23', '2021-02-22 09:24:23'),
(19, 5, 'Baju muslim sepasang cowok dan cewek ukuran XL', 6, 1, 225000, 5, 'New', 'Baju muslim sepasang warna abu-abu dan ukuran xl', '2021-02-23 12:57:15', '2021-02-23 12:57:15'),
(20, 5, 'Baju Arema cowok warna Hitam/Biru ukuran L/XL', 3, 1, 80000, 12, 'New', 'Baju aremania', '2021-02-23 13:02:05', '2021-02-23 13:02:05'),
(23, 8, 'Baju', 4, 1, 20000, 2, 'New', 'Test', '2021-02-26 08:50:35', '2021-02-26 08:50:35'),
(24, 8, 'Baju kokoh', 1, 1, 50000, 20, 'New', 'Baju kokoh baru', '2021-02-26 08:53:44', '2021-02-26 08:53:44'),
(28, 8, 'Baju 1', 6, 1, 35000, 25, 'New', 'Test', '2021-02-26 10:17:16', '2021-02-26 10:17:16'),
(29, 8, 'Tas pinki baru versi 12', 1, 1, 125000, 10, 'New', 'Tas baru yang disuka wanita 1111', '2021-02-26 10:26:22', '2021-02-26 11:31:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_colors`
--

CREATE TABLE `product_colors` (
  `product_color_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_colors`
--

INSERT INTO `product_colors` (`product_color_id`, `product_id`, `color_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 7),
(4, 3, 6),
(5, 3, 4),
(6, 4, 3),
(7, 4, 1),
(8, 4, 5),
(9, 16, 1),
(10, 16, 4),
(11, 16, 5),
(12, 16, 6),
(13, 18, 1),
(14, 18, 3),
(15, 19, 1),
(16, 19, 5),
(17, 20, 7),
(18, 20, 1),
(23, 23, 3),
(24, 24, 2),
(30, 28, 5),
(31, 28, 2),
(32, 29, 2),
(33, 29, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_images`
--

CREATE TABLE `product_images` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_images`
--

INSERT INTO `product_images` (`product_image_id`, `product_id`, `image_path`) VALUES
(1, 1, '/images/products/1608515255058-upload_images.jpg'),
(2, 1, '/images/products/1608515255078-upload_images.jpg'),
(3, 1, '/images/products/1608515255085-upload_images.jpg'),
(4, 2, '/images/products/1608516435293-upload_images.jpg'),
(5, 2, '/images/products/1608516435298-upload_images.jpg'),
(6, 2, '/images/products/1608516435323-upload_images.jpg'),
(7, 2, '/images/products/1608516435331-upload_images.jpg'),
(8, 2, '/images/products/1608516435355-upload_images.png'),
(9, 3, '/images/products/1608519734830-upload_images.jpg'),
(10, 3, '/images/products/1608519734838-upload_images.jpg'),
(11, 4, '/images/products/1609474086495-upload_images.jpg'),
(12, 4, '/images/products/1609474086512-upload_images.jpg'),
(13, 4, '/images/products/1609474086562-upload_images.jpg'),
(14, 4, '/images/products/1609474086568-upload_images.jpg'),
(15, 5, '/images/products/1611173978575-upload_images.jpg'),
(16, 5, '/images/products/1611173978602-upload_images.jpg'),
(17, 5, '/images/products/1611173978647-upload_images.jpg'),
(18, 5, '/images/products/1611173978654-upload_images.jpg'),
(19, 6, '/images/products/1611175695356-upload_images.jpg'),
(20, 6, '/images/products/1611175695457-upload_images.jpeg'),
(21, 6, '/images/products/1611175695590-upload_images.jpeg'),
(22, 7, '/images/products/1611175934043-upload_images.jpeg'),
(23, 7, '/images/products/1611175934146-upload_images.jpeg'),
(24, 7, '/images/products/1611175934282-upload_images.jpeg'),
(25, 8, '/images/products/1611209745889-upload_images.jpg'),
(26, 8, '/images/products/1611209746504-upload_images.jpg'),
(27, 8, '/images/products/1611209746539-upload_images.jpg'),
(31, 10, '/images/products/1611210051524-upload_images.jpg'),
(32, 10, '/images/products/1611210051530-upload_images.jpeg'),
(33, 11, '/images/products/1611210183002-upload_images.jpg'),
(34, 11, '/images/products/1611210183075-upload_images.jpg'),
(35, 11, '/images/products/1611210183079-upload_images.jpg'),
(42, 14, '/images/products/1611226993427-upload_images.jpg'),
(43, 14, '/images/products/1611226993436-upload_images.jpg'),
(44, 14, '/images/products/1611226993463-upload_images.jpeg'),
(45, 15, '/images/products/1612247560458-upload_images.jpg'),
(46, 15, '/images/products/1612247560531-upload_images.jpg'),
(47, 15, '/images/products/1612247561066-upload_images.jpg'),
(48, 15, '/images/products/1612247561073-upload_images.jpeg'),
(49, 16, '/images/products/1613611414866-upload_images.jpg'),
(50, 16, '/images/products/1613611414886-upload_images.jpg'),
(51, 17, '/images/products/1613960433425-upload_images.jpeg'),
(52, 18, '/images/products/1613960663923-upload_images.jpeg'),
(53, 19, '/images/products/1614059835205-upload_images.jpg'),
(54, 20, '/images/products/1614060125424-upload_images.png'),
(56, 23, '/images/products/1614304235103-upload_images.jpg'),
(57, 24, '/images/products/1614304424012-upload_images.jpg'),
(61, 28, '/images/products/1614309436679-upload_images.jpg'),
(62, 29, '/images/products/1614309982014-upload_images.jpeg'),
(63, 29, '/images/products/1614309982110-upload_images.jpeg'),
(64, 29, '/images/products/1614309982240-upload_images.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_reviews`
--

CREATE TABLE `product_reviews` (
  `product_review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_sizes`
--

CREATE TABLE `product_sizes` (
  `product_size_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_sizes`
--

INSERT INTO `product_sizes` (`product_size_id`, `product_id`, `size_id`) VALUES
(8, 1, 3),
(9, 1, 4),
(10, 2, 5),
(11, 3, 2),
(12, 3, 5),
(13, 4, 5),
(14, 4, 7),
(15, 16, 3),
(16, 16, 4),
(17, 16, 5),
(18, 18, 3),
(19, 19, 5),
(20, 23, 3),
(21, 28, 4),
(22, 28, 2),
(23, 28, 1),
(24, 29, 5),
(25, 29, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_rating` int(11) NOT NULL,
  `review_comment` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `review_rating`, `review_comment`, `created_at`, `updated_at`) VALUES
(11, 17, 1, 5, '', '2020-12-17 17:03:11', '2021-02-25 10:25:39'),
(12, 2, 2, 5, '', '2020-12-17 17:03:11', '2021-01-07 07:23:20'),
(13, 1, 3, 3, 'se', '2020-12-17 17:03:11', '2021-01-07 07:23:24'),
(14, 4, 4, 2, '', '2020-12-17 17:03:11', '2021-01-07 07:23:28'),
(15, 6, 2, 5, 'text', '2021-01-07 14:24:01', '2021-01-07 17:02:21'),
(16, 7, 3, 4, 'sef', '2021-01-07 14:24:01', '2021-01-07 07:24:01'),
(17, 20, 1, 2, 'se', '2021-01-07 14:26:53', '2021-02-25 10:25:48'),
(18, 11, 1, 5, '', '2021-01-07 14:26:53', '2021-02-25 10:25:33'),
(19, 17, 10, 5, 'Barang bagus', '2021-02-11 11:12:31', '2021-02-11 04:12:31'),
(20, 17, 19, 5, 'Baju bagus, barang sampai dengan aman', '2021-02-23 13:07:22', '2021-02-23 06:07:22'),
(21, 11, 19, 4, 'Bagus sekali', '2021-02-23 13:07:22', '2021-02-23 06:07:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sellers`
--

CREATE TABLE `sellers` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_store` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT '/images/profile/user.png',
  `user_phone` varchar(25) NOT NULL,
  `user_store_desc` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sellers`
--

INSERT INTO `sellers` (`user_id`, `user_name`, `user_email`, `user_password`, `user_store`, `user_image`, `user_phone`, `user_store_desc`, `created_at`, `updated_at`) VALUES
(5, 'seller', 'seller@gmail.com', '$2b$10$Pwc3fbZ/4gMA/OZb0WUZaunJ7niBSowjIlJIIqddEtrfMszgjx8GO', 'User Sells', '/images/profile/user.png', '098534523544', '', '2020-12-19 00:28:48', '2020-12-19 00:28:48'),
(6, 'seller1', 'seller1@gmail.com', '$2b$10$8DmgeO4i6uEUMis/0yz4SePquHfA5lqn4qHWDeopq8HrgHGEeAO5G', 'Store best', '/images/profile/user.png', '085565755585', '', '2021-01-20 16:28:44', '2021-01-20 16:28:44'),
(7, 'Seller', 'seller12@gmail.com', '$2b$10$NvGHf143MLUALGeLSNS3w.4Ubr0RFKqMMxnTZyyhb5K2Ri2DfW6z6', 'New Seller', '/images/profile/user.png', '085885885880', '', '2021-01-21 14:38:52', '2021-01-21 14:38:52'),
(8, 'Bang El', 'elwanditirtana1945a@gmail.com', '$2b$10$AX78mbI9PA97BkVIrrZnHeIBQDK.Xj3gBkjGKKo2.Vmcn3bPTeU6S', 'Skuy Skraplkp', '/images/profile/1614310210752-photo.jpg', '8085809799', '', '2021-02-26 02:32:20', '2021-02-26 02:32:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL,
  `size_value` varchar(10) NOT NULL,
  `is_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_value`, `is_type`) VALUES
(1, 'xs', 1),
(2, 's', 1),
(3, 'm', 1),
(4, 'l', 1),
(5, 'xl', 1),
(6, 'xll', 1),
(7, 'xxl', 1),
(8, '30', 0),
(9, '31', 0),
(10, '32', 0),
(11, '33', 0),
(12, '34', 0),
(13, '35', 0),
(14, '36', 0),
(15, '37', 0),
(16, '38', 0),
(17, '39', 0),
(18, '40', 0),
(19, '41', 0),
(20, '42', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `token_whitelist`
--

CREATE TABLE `token_whitelist` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `token_whitelist`
--

INSERT INTO `token_whitelist` (`id`, `token`) VALUES
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyIiwidXNlcl9lbWFpbCI6InVzZXJAZ21haWwuY29tIiwibGV2ZWwiOiJjdXN0b21lciIsImlhdCI6MTYwODMxMzUyNCwiZXhwIjoxNjA4MzQ5NTI0fQ.DVbSON9MoCrm-yaEhyfw0RC-dR2Wlk2gybsgODyRY-w'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJzZWxsZXIiLCJ1c2VyX2VtYWlsIjoic2VsbGVyQGdtYWlsLmNvbSIsImxldmVsIjoic2VsbGVyIiwiaWF0IjoxNjA5NDczOTA4LCJleHAiOjE2MDk1MDk5MDh9.lVs3zrFxVy6dyls7w6OMWPyfzoXeMarO0fJJvP8OxkI'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSAiLCJsZXZlbCI6ImN1c3RvbWVyIiwiaWF0IjoxNjEwMTAzNjI4LCJleHAiOjE2MTAxMzk2Mjh9.uerzbNKePTiyt8RS1EV-CYZH6Di6pzBVs6dt2LsFzJU'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSAiLCJsZXZlbCI6ImN1c3RvbWVyIiwiaWF0IjoxNjEwMTAzODAwLCJleHAiOjE2MTAxMzk4MDB9.jXBTMsFQiK63LZZButn4kO70dVu2hYHbD1Ip-HN7o5E'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSIsImxldmVsIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTAxNTc1NTEsImV4cCI6MTYxMDE5MzU1MX0.lyxrpFJ7Ns_vEbvuyn3PRT_tH0uCEnKh9qllcaGprzY'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSIsImxldmVsIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTAxNTc1NzgsImV4cCI6MTYxMDE5MzU3OH0.Dul-XwsFw1fWEDx50E9ccFV0kD4i_XWryORE7Zr5HEs'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSIsImxldmVsIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTAxNTc2MDAsImV4cCI6MTYxMDE5MzYwMH0.ybvHJ1cklkAfJeRW9gbzM9ytRclWP7L_V_4jscCIf-A'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSAiLCJsZXZlbCI6ImN1c3RvbWVyIiwiaWF0IjoxNjExMjExMTg3LCJleHAiOjE2MTEyNDcxODd9.JpVsekYBPNK__68nn2yBvyG74XztCW8qEWE0S6bvZ9M'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSAiLCJsZXZlbCI6ImN1c3RvbWVyIiwiaWF0IjoxNjExMjE1Mzg2LCJleHAiOjE2MTEyNTEzODZ9.eTQv4S6iA_rVuxdPqoP2D7GrxB08emBCgEJlTlnEz-c'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyMTMiLCJ1c2VyX2VtYWlsIjoidXNlcjEzQGdtYWlsLmNvbSIsImxldmVsIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTEyMTk2NjYsImV4cCI6MTYxMTI1NTY2Nn0.h4PBikz0dkF5KvCw2AsL0-HZPrSZLnrYqS3EY3jlFkk'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJzZWxsZXIxIiwidXNlcl9lbWFpbCI6InNlbGxlcjFAZ21haWwuY29tIiwibGV2ZWwiOiJzZWxsZXIiLCJpYXQiOjE2MTIyNDMxMDIsImV4cCI6MTYxMjI3OTEwMn0.Mfjh39N2o8xa2pBRGB1ENSQw0U1ulZEg0WDOZhztbio'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJTZWxsZXIiLCJ1c2VyX2VtYWlsIjoic2VsbGVyMTJAZ21haWwuY29tIiwibGV2ZWwiOiJzZWxsZXIiLCJpYXQiOjE2MTM2MTEyNzcsImV4cCI6MTYxMzY0NzI3N30._AjFeJP7uFcwSSVz6OvcAd5hZJiowCXJZ9whrH7evnI'),
(79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJFbHdhbmR5IFRpcnRhbmEgRGVyaWFuc3lhaCIsInVzZXJfZW1haWwiOiJlbHdhbmRpdGlydGFuYTE5NDVhQGdtYWlsLmNvbSIsImxldmVsIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTQyOTQ4ODgsImV4cCI6MTYxNDMzMDg4OH0.QYgadLYTKYBbdeMc_luQ5vxR_IrGjoljpavYvTK3pVY');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`),
  ADD KEY `color_code` (`color_code`),
  ADD KEY `color_name` (`color_name`);

--
-- Indeks untuk tabel `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`condition_id`),
  ADD KEY `condition_name` (`condition_name`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `detail_histories`
--
ALTER TABLE `detail_histories`
  ADD PRIMARY KEY (`detail_history_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_color_id` (`product_color`),
  ADD KEY `product_size_id` (`product_size`),
  ADD KEY `history_id` (`history_id`);

--
-- Indeks untuk tabel `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`history_id`),
  ADD UNIQUE KEY `history_code` (`history_code`);

--
-- Indeks untuk tabel `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id_otp`),
  ADD UNIQUE KEY `otp` (`otp`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_condition` (`product_condition`),
  ADD KEY `seller_id` (`user_id`);

--
-- Indeks untuk tabel `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`product_color_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id_2` (`color_id`);

--
-- Indeks untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`product_review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indeks untuk tabel `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`product_size_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_attr_value` (`size_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_user` (`user_id`),
  ADD KEY `review_product` (`product_id`);

--
-- Indeks untuk tabel `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`),
  ADD KEY `size_value` (`size_value`);

--
-- Indeks untuk tabel `token_whitelist`
--
ALTER TABLE `token_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `conditions`
--
ALTER TABLE `conditions`
  MODIFY `condition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `detail_histories`
--
ALTER TABLE `detail_histories`
  MODIFY `detail_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `histories`
--
ALTER TABLE `histories`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `otp`
--
ALTER TABLE `otp`
  MODIFY `id_otp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `product_color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `product_images`
--
ALTER TABLE `product_images`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `product_review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `product_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `sellers`
--
ALTER TABLE `sellers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `token_whitelist`
--
ALTER TABLE `token_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_histories`
--
ALTER TABLE `detail_histories`
  ADD CONSTRAINT `detail_histories_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `histories` (`history_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sellers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_colors_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors` (`color_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sizes_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`size_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
