-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Mar 2021 pada 01.25
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
(30, 7, 'Baju Gamis Wanita Terbaru Gamis Polos Busui Katun Supernova 9965 (B) - Red, XL', 2, 1, 68000, 20, 'New', 'Detail:\nBahan Katun Supernova\nKancing Depan (Busui Friendly)\n\nSize L - ld 102 cm\nSize XL - ld 106 cm\nPb 135cm\n\nFoto kami semua asli dan sesuai barang, akan tetapi pasti ada perbedaan warna sekitar 10 persen bergantung dari masing masing smartphone/device customer. (Diluar kendali kami)\n\nJam kerja admin\nSenin s/d Sabtu 7.00 s/d 16.00\nMinggu & Hari Besar Libur\n\nMengapa memilih belanja di Toko kami?\n1. Jaminan barang SESUAI foto\n(Tidak ada istilah KEMIRIPAN 80-90% seperti toko online lainnya)\n\n2. Harga MURAH untuk KUALITAS terbaik\n\n3. Pengiriman CEPAT (hari sama untuk orderan masuk sebelum jam 12 Siang)\n\n4. Stok AMAN & varian produk yang LENGKAP untuk Reseller dan Dropshipper\n\nSelain reseller/dropshipper resmi, penggunaan foto untuk tujuan komersil tanpa seijin kami, akan diproses sesuai hukum yang berlaku. (Pasal 12 & Pasal 115 UU Hak Cipta No 28 tahun 2014, pidana denda Rp 500.000.000)', '2021-03-09 11:40:05', '2021-03-09 11:40:05'),
(31, 7, 'Jaket Parka Cowok - Full Black, L', 3, 3, 95000, 10, 'New', 'Real Picture 100% Asli ORIGINAL kami bisa menjamin\nYANG TIDAK ADA KETERANGAN DI KIRIM RANDOM\nWARNA: Tanya/Diskusi sebelum membeli keterangan kosong akan kami kirim random.\n1kg muat 2 pcs\n\nKETERANGAN:\n- Bahan lembut tidak panas, cocok dipakai harian\n- Model memanjang kebawah ( best seller )\n- Tali pinggang\n- Hoodie bisa dilepas\n\nCode : PARKA COWOK ORIGINAL\nMaterial : Baby Canvas Katun\nPuring : Akrilik kotak-kotak\nSize : All size L fit XL\n(Panjang 72cm, Lebar 57cm)\n\nfast respon\nhp/wa. 089.656.152.176', '2021-03-09 11:43:14', '2021-03-09 11:43:14'),
(32, 7, 'Jaket Camo BGSR / Jaket pria / Jaket Loreng / Jaket Army Pria / Jaket', 4, 3, 140000, 10, 'New', 'Halo kak selamat datang di Almondhsop\n\nJaket camo yang satu ini bahannya dari canvas premium ya kak. Gak akan luntur ketika dicuci, cara mencucinya cukup dikucek tanpa harus disikat agar tidak merubah kualitas.\n\nDETAIL PRODUK:\n- Nama: BGSR Jaket Camo\n- Matt: Canvas Premium\n- Size: L dan XL\n- Emblem Bordir\n- Terdapat Saku Dalam\n- Tidak Menerawang\n- Dilengkapi Kancing\n- 2 Saku Bagian Samping\n- 2 Saku Bagian Dada\n- Nyaman Dipakai\n- Tidak Mudah Luntur\n\nYuk segera order sekarang juga karena stock terbatas kak. Jangan sampai kehabisan ya :)', '2021-03-09 11:44:53', '2021-03-09 11:44:53'),
(33, 7, 'MARCHEL MAN BAJU KEMEJA POLOS PRIA LENGAN PENDEK KEMEJA CASUAL PRIA - Maroon, S', 2, 1, 41000, 10, 'New', 'Detail Ukuran\nLebar Dada X Panjang\nAda di Gambar\nM (50x70)\nL (5272)\nXL ( 54x74)\n.\nToleransi +- ( 1 atau 2 cm dari Yang Tertera )\nKarna Beda Merk . Beda Potongan', '2021-03-09 11:46:24', '2021-03-09 11:46:24'),
(34, 7, 'Kemeja Polos Hitam Cowok Panjang Kerja kantor Slimfit / Baju Pria - XL', 5, 1, 67500, 10, 'New', 'Detail Ukuran\nLebar Dada X Panjang\nAda di Gambar\nM (50x70)\nL (5272)\nXL ( 54x74)\n.\nToleransi +- ( 1 atau 2 cm dari Yang Tertera )\nKarna Beda Merk . Beda Potongan', '2021-03-09 11:47:58', '2021-03-09 11:47:58'),
(35, 7, 'High heels cantik / Heels strap - KREM, 36', 4, 8, 100000, 10, 'New', 'Tinggi : 9 cm dan 5 cm\nBahan : Glossy stud\nWarna :\n- HITAM ,\n- KREM,\n- SILVER,\n- PUTIH\n- MERAH\n\nliat juga ulasan yg sudah beli jd jika tetap memberikan Feedback negatif pembelian selanjutnya kita tidak layani maaf, kami hanya bisa kerjasama dgn pembeli yg\nbijaksana.\n\nsize chart :\n1. size 36 = 21 cm\n2. size 37 = 22 cm\n3. size 38 = 23 cm\n4. size 39 = 24 cm\n5. size 40 = 25 cm', '2021-03-09 11:50:10', '2021-03-09 11:50:10'),
(36, 7, ' Sepatu Sandal High Heels Wanita Hak Tahu HT60 - Hitam, 39', 3, 8, 44000, 10, 'New', 'kode HT60\nReady Hitam 36 - 40\nbahan double suede\nsize standar\nUkuran standar : 36=22cm, 37=23cm, 38=24cm, 39=24.5cm, 40=25cm\n\nMohon sertakan keterangan size dan warna saat order ya guna mempercepat proses pengiriman', '2021-03-09 11:52:06', '2021-03-09 11:52:06'),
(37, 7, 'PHM Shoes Sepatu Pria Sneakers Import Sepatu Olahraga Kasual PHM205 - Merah, 39', 3, 7, 79000, 10, 'New', 'Hello everyone. Selamat datang di PHM Official Store.\nBrand terpercaya yang menjual sepatu berkualitas dan nyaman digunakan dengan harga terjangkau. Semua model sepatu selalu kami seleksi sebelum di kirimkan ke pembeli, untuk menjaga kualitas dari produk2 kami.\n\n???? Welcome Reseller , Dropshiper & Grosiran (Tanpa Logo Tokopedia & Logo Toko)\n???? Pembelian Grosir Silahkan Hubungi Admin Langsung untuk mendapatkan harga menarik\n???? Gratis ongkir tanpa minimal belanja & bisa COD (JNT)\n???? Bisa antar Via Kurir Sesama Jakarta jika Pengambilan Dalam jumlah Besar\n\n????Jangan lupa Follow Toko & Like Produk kita Untuk mendapatkan Diskon dan Update nya.\n\nBahan Upper : Cloth [ Sangat adem & Nyaman ]\nBahan Insole : Eva Sponge [ Empuk tapi kuat ]\nBahan Outsole : TPR / Thermoplastic Rubber [ Ringan & tidak licin ]\nBerat Sepatu : Size 39 - Lebih Kurang 570 Gr\nBerat Sepatu : Size 44 - Lebih Kurang 770 Gr\nBerat Kotak : Lebih Kurang 115 GR\n\nDisarankan mengukur kaki terlebih dahulu lalu ditambah 0.5cm kemudian disamakan dengan chart size.\n\nChart size (insole) :\nSize 39 : 24.5 cm\nSize 40 : 25 cm\nSize 41 : 25.5 cm\nSize 42 : 26 cm\nSize 43 : 26.5 cm\nSize 44 : 27 cm\n\nMisal : Setelah diukur kaki Kakak panjangnya 24.5cm, tambahkan 0,5cm maka didapat panjang 25cm. Maka kami sarankan pilih ukuran 40\n\n???? ???? PERATURAN TOKO\nMohon Lakukan Video Unboxing Saat Paket Diterima ????\nProduk yang masih bisa di klik Variasi = Ready Stok, boleh langsung di order ?\nTidak bisa di Klik = Kosong ?\nTidak menerima Sisipan warna di CATATAN / VIA CHAT ??\njika ada kesalahan produk / kurang barang, harap Melampirkan video unboxing, foto produk dan Label pengiriman. ????????\n\n???????? JANGAN LUPA BACA RULES TOKO DI BANNER YA SEBELUM ORDER\n\nTerima kasih banyak sudah berkunjung PHM Official Store, Happy Shopping Dear ????', '2021-03-09 11:55:18', '2021-03-09 11:55:18'),
(38, 7, 'Jaket bomber pria zipper eksekutiv man premium - Abu-abu', 2, 3, 115000, 10, 'New', 'Jaket bomber pria EKSEKUTUV MAN premium\n.\nBrand :Sensor\nBahan :taslan waterprof\nWarna :hitam-navy-abu grey-marron\nUkuran :M-L\nDetail ukuran panjang x lebar dada :\nM.panjang 65cm x lebar dada 54cm x panjang lengan 60cm\nL.panjang 67cm x lebar dada 56cm x panjang lengan 62cm\n.\nJaket bomber eksekutuv man menggunakan resleting dan model saku di bagian kiri/kanan dan di bagian dalam ada saku nya juga\nBahan adem di pakai,nyaman,tidak berbulu,dan tidak mudah luntur\nJaket bomber juga yang lagi trending di kalangan anak muda sekarang\nJaket bomber 99% realpict sesua photo\nBest produk recomendeed\nStok masih tersedia\n.\nSelamat berbelanja di lapak kami\nHappy shoping good luckkk\n.\nSalam hormat kami play jeans ke puasan planggan adalah tujuan kami !!!', '2021-03-09 12:00:08', '2021-03-09 12:00:08'),
(39, 7, 'Kaos Baju Tshirt Premium CAMOE Original Basic Army Green / Hijau Army - S', 1, 1, 65000, 10, 'New', 'Camoe 100% Original & Authentic Guaranteed\n\nThe collection’s T-Shirt From CAMOE signature\n\nA classic design, this T-shirt will be a useful addition to every wardrobe.\nIt will be a perfect match for any outfit.\n\nCrafted in a slightly Regular fit from a mix of luxurious Cotton and Polyester Blend with a soft hand feel\n\nThe label is signed with the collection’s signature\n\nDetail Featured:\n? 100% Cotton\n? Colour : Army Green\n? Available Size : S, M L XL\n? Regular Fit\n? Come with plastic and Sticker (With Tag and Label)\n\nProduct Care:\nTo preserve the quality of this garment, we recommend you to respect the care instructions :\n? Gentle dry clean\n? Dry on a flat surface / do not hang / reshape\n? Iron inside out\n\n\nInstagram : @Camoeclothing', '2021-03-09 12:02:11', '2021-03-09 12:02:11'),
(40, 7, 'Kaos Baju Band The Offspring Kaos Musik - Karimake', 5, 1, 50000, 10, 'New', 'Selamat datang di toko Kaos KARIMAKE\n\nSetiap barang yang berada di etalase berarti READY STOCK\n\nKami menerima Dropshipper dan Reseller ya kak\n\nBahan 100% Cotton, Combed 30s\nSablon : Polyflex , kuat dan halus\n\nReady Size : S, M, L, XL, XXL\nS : 66 X 48 cm\nM : 68 X 50 cm\nL : 70 X 52 cm\nXL : 72 x 54 cm\nXXL : 74x 56 cm\n\nWarna : Hitam, Putih, Merah, Marun, Biru, Biru Navy / Dongker, Biru Turkis, Hijau, Kuning, Oranye, Pink dan Abu Misty\n\n\"Jangan lupa untuk mengukur baju yang ingin anda beli dan sesuaikan dengan ukuran dari kita, agar kaos sesuai dengan harapan kita\"\n\nSelamat Berbelanja.\n\nSalam dari Kami.', '2021-03-09 12:03:24', '2021-03-09 12:03:24'),
(41, 7, 'Celana Pendek Chino Premium Quality - Hitam, 28', 5, 2, 65000, 10, 'New', '* Warna tidak mudah luntur jika dicuci berulang kali\n* 1000% REAL PICT / sesuai dengan gambar\n* Bahan lentur / ngaret\n* Nyaman dipakai\n* Fashionnable\n* Branded\n* Jahitan kuat dan sangat rapi\n* Serat kain tidak kaku\n* Cocok untuk digunakan semua kalangan usia\nTERMURAH\nTERLARIS\n\n*berikut adalah size chart*\nSize 27 (lebar pinggang 70 cm x panjang 50 cm)\nSize 28 (lebar pinggang 72 cm x panjang 50 cm)\nSize 29 (lebar pinggang 74 cm x panjang 50 cm)\nSize 30 (lebar pinggang 76 cm x panjang 50 cm)\nSize 31 (lebar pinggang 78 cm x panjang 51 cm)\nSize 32 (lebar pinggang 80 cm x panjang 51 cm)\nSize 33 (lebar pinggang 82 cm x panjang 52 cm)\nSize 34 (lebar pinggang 84 cm x panjang 52 cm)\n\nPERHATIAN PENTING\nJika Barang nya kosong Dalam 24jam Tidak Balas Chat/Tlpn dari kami Otomatis kita Kirim Barang Yg Ready!', '2021-03-09 12:05:01', '2021-03-09 12:05:01'),
(42, 7, 'Celana Panjang Chino/Chinos/Cino Pria/Cowok - AbuMuda/Hitam/Krem/Cream - STANDAR-HITAM, L', 2, 4, 70000, 10, 'New', 'Tabel Ukuran ada juga \"Di SAMPING FOTO PRODUK\" (geser kekiri foto produknya)\n\nPERHATIAN; \"Harap Mencantumkan WARNA dan UKURAN di Keterangan PESANAN!!!\".\n\nKETERANGAN PRODUK:\nBahan : Cotton Stretch ( Bisa Melar / Ngaret)\nModel : Celana Panjang Chino Reguler Fit Pria\nWarna : Krem, Hitam, Abu-abu, Biru Navy\nUkuran : S=28, M=30, L=32, XL=34\n\nKETERANGAN UKURAN:\n(Size dalam keadaan TIDAK dipakai)\nSize S = No. 2 = LINGKAR PINGGANG 78Cm X PANJANG CELANA 98 Cm, utk BB 50 Kg\nSize M = No.30 = LINGKAR PINGGANG 82 Cm X PANJANG CELANA 99 Cm, utk BB 55 Kg\nSize L = No.32 = LINGKAR PINGGANG 85 Cm X PANJANG CELANA 100 Cm, utk BB 60 Kg\nSize XL = No 34 = LINGKAR PINGGANG 88 Cm X PANJANG CELANA 102 Cm, utk BB 65 Kg\n(bisa melar +/- 2~4 cm, sewaktu di pakai)\n\nSelamat berbelanja...', '2021-03-09 12:06:52', '2021-03-09 12:06:52'),
(43, 7, 'Celana Badminton Lotto / Celana bulutangkis - Putih, L', 3, 2, 30000, 10, 'New', 'Mohon baca deskripsi sebelum memesan ya.\n\nCelana badminton lotto ini cocok buat yg hobi badminton , untuk olahraga lain juga bisa.\n\nSpesifikasi :\n-Terdapat ban karet pinggang yg tahan lama.\n-Saku tangan kiri dan kanan\n-Resleting kualitas standar nya.\n-Logo bordir\n-Jahitan rapi.\n\ntersedia ukuran L XL XXL XXXL\nL = lingkar pinggang 66cm masih melar sampai 76cm X panjang celana 38cm.\n\nXL = lingkar pinggang 70cm masih melar sampai 80cm X panjang celana 40cm.\n\nXXL = lingkar pinggang 74cm masih melar sampai 84cm X panjang celana 42cm.\n\nXXXL=lingkar pinggang 80cm masih melar sampai 90cm X\npanjang celana 44cm\n\nUkuran di ukuran mendatar ya kak , silahkan di ukur lingkar pinggang dulu. Toleransi 1-2cm.\n\nNb. pemesanan di atas jam 16.00 akan kami proses dan kirim pada keesokan hari nya.\npengiriman setiap hari dan juga bisa bayar di tempat (COD)\n\nTerima kasih.', '2021-03-09 12:09:04', '2021-03-09 12:09:04'),
(44, 7, 'Jubah Snk Attack On Titan, Jubah Anime Cosplay Jaket Cewe,cowo - all size', 6, 3, 150000, 10, 'New', 'Jubah ini bisa dipakai untuk cewek dan cowok, dapat dipakai untuk kegiatan sehari-hari maupun Acara Event / Cosplay\n\nTersedia ukuran all size\nBahan / Material Premium Quality Distro\n- 100% Drill\n- Sablon\n- Adem\n- Halus\n- Nyaman dipakai\n\nKontak ANIME MARKET ZONE:\nWhatsApp 081394339030\nFacebook Anime Market Zone\nInstagram @animemarketzone\n\nUntuk pemesanan pembelian bisa langsung klik Beli Langsung / Beli ya', '2021-03-09 12:10:44', '2021-03-09 12:10:44'),
(45, 7, 'Celana Pendek Pria Surfing Distro Premium Renang Pantai Santai Kolor - Cream, 22', 6, 2, 29000, 10, 'New', 'DIBACA DISKIRPSI\n\nJujur celana model ini sangat keren dan nyaman banget dipakai,\nterbuat dari American drill (Terbaik dikelasnya) yang mempunyai standart kualitas import.\njadi tidak perlu diragukan lagi tentang bahan baku dari produk ini.\n\nDetail model celana :\n- Pinggang memakai karet kolor\n- Kain memakai bahan combet tebel dan halus (Great A)\n- Saku depan ada 2 (Kanan - kiri) Model samping\n- Saku belakang (Model bobok / paspol / saku dalam)\n- Size lengkap M / L / XL / XXL / 3xl / 4xl\n- Warna : Hitam / Abu-abu / Coklat / Cream / Mocca\n\n- Foto 100% Asli (dijamin)\n- Karena kita sendiri yang mengambil gambar\n\nDetail ukuran celana :\n\nsize 20 USIA 5-6\nSize 22 USIA 7-9\nSize 24 USIA 10-11\n\nDetail ukuran celana :\nM (29/30)\n- Lingkar pinggang : 75-76 cm\n- Panjang celana : 55 cm\n- Lebar kaki : 24 cm\n- Lebar paha : 30 cm\n\nL (31/32)\n- Lingkar pinggang : 79-80 cm\n- Panjang celana : 55 cm\n- Lebar kaki : 25 cm\n- Lebar paha : 32 cm\n\nXL (33/34)\n- Lingkar pinggang : 84-85 cm\n- Panjang celana : 58 cm\n- Lebar kaki : 26 cm\n- Lebar paha : 34 cm\n\nXXL (35/36)\n- Lingkar pinggang : 89-90 cm\n- Panjang celana : 59 cm\n- Lebar kaki : 28 cm\n- Lebar paha : 35 cm\n\nSPESIAL BIG SIZE\n3XL (37/38)\n- Lingkar pinggang : 94-97 cm\n- Panjang celana : 61 cm\n- Lebar kaki : 29 cm\n- Lebar paha : 36 cm\n\nNB : Pinggang melar 2-4 cm & Toleransi jahitan 1-2 cm\n\nKebijakan penjual :\n- Barang yang kita jual adalah produk sendiri\n- Kondisi baru dan barang bagus\n- Kita memakai bahan baku yang terbaik dikelasnya ya kakak\n- Transaksi aman dan terpercaya\n\nNB = NO CANCEL ORDER!!! Pastikan checkout barang sesuai dengan produk yang di inginkan, bukan tanggung jawab kami jika barang yg dikirim tidak sesuai yang di harapkan karena kesalahan Checkout, WARNA dan UKURAN wajib di cantumkan di NOTE.\n\n*** NANTI KITA GANTI DENGAN YANG BARU. ***\n\nKITA JUGA OPEN RESELLER DAN DROPSHIP YA KAKAK ...\nSemoga bisa menambah keberkahan buat teman-teman semua.\nProduk lain di toko kami.', '2021-03-09 12:12:19', '2021-03-09 12:12:19'),
(46, 7, 'Okechuku JAY Celana Chino Panjang Pria Celana Chino Pria Celana Pria - Abu, Size 28', 6, 4, 95000, 10, 'New', 'Okechuku JAY Celana Chino Panjang Pria Celana Chino Pria Celana Pria\n\nCelana chino pria model terbaru dari Okechuku, kualitas premium, terbuat dari bahan twill katun stretch. Sifat bahan halus, nyaman di kulit, dan tidak panas. Model simple, basic, dan elegan dengan kantong depan di bagian kiri, kanan dan belakang. Cocok untuk di pakai dalam acara formal maupun casual. Bisa dipakai menggunakan ikat pinggang.\n\nZipper: Auto Lock (Anti Melorot & macet)\n\nPilihan ukuran :\n\n1. size 28 :\nLingkar Pinggang : 71cm\nPanjang celana : 95cm\nLingkar paha : 56cm\nLingkar betis : 30cm\n\n2. size 30 :\nLingkar Pinggang : 73cm\nPanjang celana : 97cm\nLingkar paha : 58cm\nLingkar betis : 32cm\n\n3. size 32 :\nLingkar Pinggang : 82cm\nPanjang celana : 97cm\nLingkar paha : 60cm\nLingkar betis : 36cm\n\n4. size 34 :\nLingkar Pinggang : 88cm\nPanjang celana : 99cm\nLingkar paha : 62cm\nLingkar betis : 38cm\n\n5. size 36 :\nLingkar Pinggang : 90cm\nPanjang celana : 99cm\nLingkar paha : 64cm\nLingkar betis : 40cm\n\nPilihan warna :\n1. Hitam\n2. Coklat\n3. Abu\n4. Navy\n5. Kopi\n6. Beige\n\nFoto produk 100 persen adalah foto asli yang di foto di studio foto, namun demikian ada kemungkinan perbedaan warna sedikit di karenakan efek resolusi layar dan pencahayaan.\n\nPembeli harap memperhatikan dan mempertimbangkan detail ukuran di atas sebelum membeli.\n\nJam kerja :\nSenin - Sabtu\n08.00 - 16.00 WIB\nFast respon pada jam kerja, pemesanan dan pertanyaan di luar jam kerja akan diproses keesokan harinya.\n\nBUDAYAKAN MEMBACA SEBELUM MEMBELI\n*) Pemilihan warna&ukuran hanya melalui kolom \"KETERANGAN\" saat order, bukan melalui CHAT & DISKUSI, Jika tidak di tulis maka akan di kirim secara acak.\n*) Juga Harap TULIS warna CADANGAN, jika warna utama tidak tersedia.\n*) Wajib mendokumentasikan saat membuka paket dalam bentuk video untuk berjaga-jaga jika ada barang yang tidak sesuai /rusak/cacat sebagai syarat retur di toko kami.\n*) Jika anda memutuskan untuk MEMBELI maka kami anggap anda SETUJU dengan aturan di atas.', '2021-03-09 12:18:01', '2021-03-09 12:18:01'),
(47, 7, 'Tas Selempang Slingbag Wanita Find Pingoo Korea - VONA Pixie - Merah Muda', 2, 9, 66000, 10, 'New', '- Tas Selempang / Sling Bag Wanita.\n- Bahan Kulit Sintetis Tebal.\n- 1 ruang utama dengan penutup magnet dan kaitan.\n- Ukuran : Panjang 19 x Lebar 14 x Tinggi 21 cm.\n- Tali panjang tetap/fix 100 cm. Dilengkapi juga dgn Tali Pendek.\n- Muat untuk HP, dompet, powerbank, kunci, kacamata, dll.\n- Foto produk = real picture. Deviasi warna produk = 10% (pencahayaan studio foto berbeda dengan cahaya ruangan biasa).\n- Tersedia warna Pink, Red dan Blue.\n\n=======\n\nCEK STOK\nUntuk cek ready stock, silakan klik tombol \"Beli\". Setelah itu akan muncul pilihan variasi warnanya. Untuk variasi warna yang bisa dipilih berarti stoknya ready.\n\nPENGIRIMAN\n- Berikut adalah batas waktu pengiriman pesanan setiap harinya:\n- Senin-Sabtu, order yang kami terima sebelum pukul 14.00 WIB, akan dikirim pada hari itu juga.\n- Order yang masuk setelah batas waktu pengiriman di atas, akan dikirim pada hari kerja berikutnya.\n- Hari minggu & hari libur nasional, tidak ada pengiriman.\n\nNOTE\n- Seluruh foto produk VONA adalah foto produk sesungguhnya. Namun karena pencahayaan & pengaturan layar, warna produk dapat tampak lebih gelap atau lebih terang.\n- Sehubungan dengan proses pembuatan dan pengukuran produk yang dilakukan secara manual, ukuran produk dapat bergeser kurang lebih 1 cm.\n- Pastikan alamat pengiriman sudah benar.\n- GO-SEND: Semua barang dari VONA Official Shop READY untuk dikirim via GO-SEND untuk wilayah Jabodetabek.\n\nRESELLER, DROPSHIP & GROSIR ARE WELCOMED!\nSilakan Chat kami.\n\nJangan lupa +Follow store VONA di Tokopedia & klik tanda LOVE di produk favoritmu!\nSelamat Berbelanja!', '2021-03-09 12:20:04', '2021-03-09 12:20:04'),
(48, 7, 'Tas Wanita Import New 2020 - (JHF19) Tas Selempang Wanita - Tas Cewek - Biru', 3, 9, 90000, 10, 'New', 'Tas Wanita Import 2020 (JHF19)\n\nMaterial ; Premium PU Leather\nUkuran Tas\nPanjang 21cm\nLebar 9cm\nTinggi 13cm\nTersedia Warna Silver / Biru / Hitam / Putih / Pink', '2021-03-09 12:21:06', '2021-03-09 12:21:06'),
(50, 7, 'Techdoo Sepatu Pria Olahraga Running Sepatu Sneakers Pria MR104 - Hitam Putih, 39', 3, 7, 99000, 10, 'New', 'BONUS : FREE BOX\nMohon dibaca dulu sebelum membeli : Sepatu free box sepatu cocok untuk segala acara kamu.\n\nsepatu sangat ringan dipakai sepatu dengan kualitas grade original, sepatu yg dipacking dengan box sesuai originalnya sepatu denagan kualitas unggulan dibuat menggunakan bahan lembut yang mengikuti lekuk kaki tidak keras sangat elegan dan cocok buat teman teman memberikan kesan modis casual dan trendy sangat berkualitas Sepatu sesuai dengan pic + box Perkiraan size\n\nMohon diperhatikan :\n- Bahan kanvas\n- Warna Sesuai Dengan Gambar\n- Ukuran sesuai panduan ukuran\n- Mohon dimaklumkan jika warna dan produk ada sedikit perbedaan\n\nSize 39-44\nPerincian Size\n39=24.5 cm\n40=25 cm\n41=25.5 cm\n42=26 cm\n43=26.5 cm\n44=27 cm\n\nInformasi:\n1. Kualitas import.\n2. Barang baru+box.\n3. Jam Operasional ( senin-sabtu ) jam 08:00 wib s/d 17:00 wib.\n4. Harap bersabar menunggu chat dibalas.\n5. Barang sesuai gambar. Jika ada sedikit perbedaan warna karena sebab dari pencahayaan saat memotret.\n6. Jika menerima barang yang bebeda dari pesanan, silahkan langsung chat saja ke kami dengan mengirimkan bukti foto barang yang diterima dan invoice pesanannya.\n7. Masa diperbolehkan retur adalah 2 hari setelah barang diterima.\n\nLebih detailnya bisa ditanyakan di chat ya ka. Terima kasih', '2021-03-09 12:24:27', '2021-03-09 12:24:27'),
(51, 7, 'STOUREG Sepatu Pantai Olahraga Air - 6688 [38-44] - Cokelat, 39', 3, 7, 82000, 10, 'New', 'Harap untuk membaca deskripsi produk sebelum belanja di rnc18\n\nSelamat datang di rnc18. Sebelum dibeli ada baiknya kita membaca spesifikasi produk di bawah ini :\n\nSepatu dengan desain fleksibel ini memberikan perlindungan terhadap kaki Anda pada saat bermain air dipantai, berolahraga air seperti selancar, dan lain sebagainya. Kaki tetap terlindungi namun tetap ringan seperti tidak memakai sepatu. Anda juga dapat menggunakan sepatu ini sebagai sepatu yoga ataupun olahraga ringan lainnya. Dapat dipakai oleh pria ataupun wanita.\n\nDengan memakai sepatu ini kaki Anda akan terlindungi dari kerikil kecil di pasir pantai ataupun sengatan panas matahari yang memanaskan pasir di pantai. Kaki Anda akan tetap terasa nyaman dan ringan walaupun menggunakan sepatu ini.\n\nBanyak orang enggan menggunakan alas ke pantai karena mengganggu pergerakan mereka ketika di pantai. Hal ini dapat diminimalisir ketika Anda menggunakan sepatu ini. Material perpaduan karet dan spandex membuat sepatu ini tetap ringan dan cepat kering ketika terkena air.\n\nSpesifikasi STOUREG Sepatu Pantai Olahraga Air - 6688\nMaterial : rubber + Spandex\n\nMOHON DISESUAIKAN UKURAN DENGAN GAMBAR KELIMA KARENA KEBESARAN / KEKECILAN TIDAK BISA DITUKAR\n\nno retur jika kesalahan dari customer.\n\nHappy shopping\nrnc18', '2021-03-09 12:26:26', '2021-03-09 12:26:26'),
(52, 7, 'HIGH HEELS WANITA IMPORT CM-10 BLACK - 37', 3, 8, 210000, 10, 'New', 'MERK : KOKOWAI\nWARNA : HITAM\nSIZE : 36, 37, 38, 39, 40\nHEELS : 7CM\nQUALITY : SEMI PREMIUM\nKONDISI : 100% BARU + BOX\n\nMATERIAL : SATEN\nINSOLE : DOUBLE FOAM SUPER NYAMAN\nSOL : KARET ANTI SLIP\n\nFOTO 100% REALPIC\n\nPENTING : HARAP TANYAKAN STOK SEBELUM MENGORDER\n\nSTOK DIUPDATE SETIAP HARI KARENA KAMI SUPPLY KE BERBAGAI DAERAH.\n\nYANG MINAT GABUNG MENJADI RESELLER SILAHKAN\nWA 0812.1077.6291\n\nINSOLE SIZE CHART\n36 : 23CM\n37 : 23,5CM\n38 : 24CM\n39 : 24,5CM\n40 : 25CM', '2021-03-09 12:28:12', '2021-03-09 12:28:12'),
(53, 7, 'Sepatu Sneakers Olahraga Pria Ambigo JKT27 Running Shoes - Abu-abu, 40', 3, 7, 76000, 10, 'New', 'Sepatu Sneakers Olahraga Pria Ambigo JKT27 Running Shoes\n\nSpecification:\nQuality: Import\nBahan: Canvas\nBahan Sole: Rubber\nInsole Material: Fabric ( Inject )\nModel sole: Lentur\n\nPilihan warna dan ukuran:\nHitam: 40, 41, 42, 43\nGrey: : 40, 41, 42, 43\n\nDetail Size:\n40: 24,5cm\n41: 25,5cm\n42: 26cm\n43: 27cm\n\nPackage Content:\n1 pair: Ambigo JKT27 Running Shoes Sepatu Lari Sneakers Kets Olahraga Pria\n\nMengapa harus di Jagonya Case ?\n1. Kami adalah importir case besar dari Cina\n2. Semua barang Ready Stock\n3. Respon cepat\n4. Harga MURAH kualitas WAH\n5. Menggunakan Bubble Wrap untuk menjaga kualitas barang tetap OK saat kamu terima.\n\nPesan Sekarang!', '2021-03-09 12:30:47', '2021-03-09 12:30:47'),
(54, 7, 'SANDAL HIGH HEELS WANITA KACA TALI PERMATA DY', 6, 8, 55000, 10, 'New', 'Bahan premium dengan pengerjaan oleh pengrajin terbaik serta dipadukan dengan mesin produksi kami yang terbaru sehingga menciptakan produk yang jauh lebih baik.\n\n• Bahan : PU Leather\n• Sol : Non Slip\n• Warna : SILVER DAN CREAM\n• Tinggi Heel : 7 cm\n\nPatokan Panjang Kaki dan Size :\n• 37 : 22,5 cm\n• 38 : 23 cm\n• 39 : 23,5 cm\n• 40 : 24 cm', '2021-03-09 12:32:59', '2021-03-09 12:32:59'),
(55, 7, 'Blackkelly Sepatu High Heel Casual Wanita Original Branded LRM 269 - 36', 6, 8, 138000, 10, 'New', 'Handmade asli produk Indonesia, Paris Van Java. Dibuat dengan Bahan yang nyaman digunakan. Kualitas terbaik, desain trendy dan tidak pasaran.\n\nDetail Produk\n- Bahan : PU-PVC, SOL FIBER, HAK 7 CM\n- Warna : KREM\n- Size : 36 - 40\n\nCatatan :\n*Jika Tidak Sesuai, Silahkan Ajukan Retur Ya ( Tukar / Kembalikan )\n*Foto model asli (real picture). Objek utama tidak direkayasa, kalaupun ada sedikit perbedaan antara foto dengan aslinya maksimal 5% - 10% karena pengaruh cahaya sekitar\n\nSelamat Belanja Kakak & Semoga Bermanfaat Produknya :)', '2021-03-09 12:34:10', '2021-03-09 12:34:10');

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
(34, 30, 1),
(35, 30, 4),
(36, 30, 6),
(37, 31, 2),
(38, 31, 3),
(39, 32, 3),
(40, 32, 4),
(41, 32, 5),
(42, 33, 3),
(43, 33, 5),
(44, 34, 1),
(45, 34, 3),
(46, 34, 5),
(47, 35, 1),
(48, 35, 3),
(49, 35, 5),
(50, 36, 1),
(51, 36, 2),
(52, 36, 3),
(53, 37, 3),
(54, 37, 6),
(55, 37, 7),
(56, 38, 1),
(57, 38, 5),
(58, 38, 7),
(59, 39, 1),
(60, 39, 2),
(61, 40, 1),
(62, 40, 2),
(63, 40, 4),
(64, 40, 5),
(65, 40, 6),
(66, 41, 1),
(67, 41, 2),
(68, 42, 1),
(69, 42, 2),
(70, 42, 4),
(71, 42, 5),
(72, 43, 1),
(73, 43, 5),
(74, 44, 1),
(75, 44, 2),
(76, 44, 5),
(77, 45, 1),
(78, 45, 2),
(79, 45, 5),
(80, 46, 1),
(81, 46, 5),
(82, 47, 3),
(83, 47, 7),
(84, 48, 7),
(87, 50, 1),
(88, 50, 2),
(89, 51, 1),
(90, 51, 5),
(91, 52, 1),
(92, 53, 5),
(93, 54, 5),
(94, 55, 5);

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
(65, 30, '/images/products/1615264805350-upload_images.jpg'),
(66, 30, '/images/products/1615264805357-upload_images.jpg'),
(67, 30, '/images/products/1615264805370-upload_images.jpg'),
(68, 31, '/images/products/1615264994664-upload_images.jpg'),
(69, 31, '/images/products/1615264994675-upload_images.jpg'),
(70, 32, '/images/products/1615265093646-upload_images.jpg'),
(71, 32, '/images/products/1615265093666-upload_images.jpg'),
(72, 32, '/images/products/1615265093670-upload_images.jpg'),
(73, 33, '/images/products/1615265184259-upload_images.jpg'),
(74, 33, '/images/products/1615265184268-upload_images.jpg'),
(75, 34, '/images/products/1615265278118-upload_images.jpg'),
(76, 35, '/images/products/1615265410614-upload_images.jpg'),
(77, 35, '/images/products/1615265410620-upload_images.jpg'),
(78, 35, '/images/products/1615265410625-upload_images.jpg'),
(79, 35, '/images/products/1615265410629-upload_images.jpg'),
(80, 36, '/images/products/1615265526385-upload_images.jpg'),
(81, 36, '/images/products/1615265526388-upload_images.jpg'),
(82, 36, '/images/products/1615265526397-upload_images.jpg'),
(83, 37, '/images/products/1615265718647-upload_images.png'),
(84, 37, '/images/products/1615265718671-upload_images.png'),
(85, 38, '/images/products/1615266008819-upload_images.jpg'),
(86, 38, '/images/products/1615266008827-upload_images.jpg'),
(87, 38, '/images/products/1615266008833-upload_images.jpg'),
(88, 38, '/images/products/1615266008840-upload_images.jpg'),
(89, 39, '/images/products/1615266131142-upload_images.jpg'),
(90, 39, '/images/products/1615266131148-upload_images.jpg'),
(91, 39, '/images/products/1615266131160-upload_images.jpg'),
(92, 40, '/images/products/1615266204548-upload_images.jpg'),
(93, 40, '/images/products/1615266204554-upload_images.jpg'),
(94, 40, '/images/products/1615266204557-upload_images.jpg'),
(95, 40, '/images/products/1615266204561-upload_images.jpg'),
(96, 40, '/images/products/1615266204566-upload_images.jpg'),
(97, 41, '/images/products/1615266301907-upload_images.jpg'),
(98, 41, '/images/products/1615266301911-upload_images.jpg'),
(99, 42, '/images/products/1615266412880-upload_images.jpg'),
(100, 42, '/images/products/1615266412888-upload_images.jpg'),
(101, 42, '/images/products/1615266412893-upload_images.jpg'),
(102, 42, '/images/products/1615266412896-upload_images.jpg'),
(103, 43, '/images/products/1615266544642-upload_images.jpg'),
(104, 43, '/images/products/1615266544647-upload_images.jpg'),
(105, 43, '/images/products/1615266544651-upload_images.jpg'),
(106, 44, '/images/products/1615266643992-upload_images.jpg'),
(107, 45, '/images/products/1615266739863-upload_images.jpg'),
(108, 45, '/images/products/1615266739883-upload_images.jpg'),
(109, 45, '/images/products/1615266739894-upload_images.jpg'),
(110, 46, '/images/products/1615267081496-upload_images.jpg'),
(111, 46, '/images/products/1615267081500-upload_images.jpg'),
(112, 46, '/images/products/1615267081506-upload_images.jpg'),
(113, 47, '/images/products/1615267204570-upload_images.jpg'),
(114, 47, '/images/products/1615267204574-upload_images.jpg'),
(115, 47, '/images/products/1615267204583-upload_images.jpg'),
(116, 48, '/images/products/1615267266064-upload_images.jpg'),
(117, 48, '/images/products/1615267266069-upload_images.jpg'),
(118, 48, '/images/products/1615267266073-upload_images.jpg'),
(119, 48, '/images/products/1615267266078-upload_images.jpg'),
(124, 50, '/images/products/1615267467369-upload_images.jpg'),
(125, 50, '/images/products/1615267467373-upload_images.jpg'),
(126, 50, '/images/products/1615267467376-upload_images.jpg'),
(127, 50, '/images/products/1615267467380-upload_images.jpg'),
(128, 50, '/images/products/1615267467384-upload_images.jpg'),
(129, 51, '/images/products/1615267586968-upload_images.jpg'),
(130, 51, '/images/products/1615267586974-upload_images.jpg'),
(131, 51, '/images/products/1615267586978-upload_images.jpg'),
(132, 52, '/images/products/1615267692749-upload_images.jpg'),
(133, 52, '/images/products/1615267692757-upload_images.jpg'),
(134, 53, '/images/products/1615267847794-upload_images.jpg'),
(135, 53, '/images/products/1615267847800-upload_images.jpg'),
(136, 53, '/images/products/1615267847804-upload_images.jpg'),
(137, 54, '/images/products/1615267979294-upload_images.jpg'),
(138, 54, '/images/products/1615267979306-upload_images.jpg'),
(139, 55, '/images/products/1615268050495-upload_images.jpg'),
(140, 55, '/images/products/1615268050503-upload_images.jpg'),
(141, 55, '/images/products/1615268050510-upload_images.jpg');

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
(26, 30, 3),
(27, 30, 4),
(28, 30, 5),
(29, 31, 3),
(30, 31, 4),
(31, 32, 4),
(32, 32, 5),
(33, 33, 3),
(34, 33, 4),
(35, 34, 3),
(36, 34, 4),
(37, 35, 1),
(38, 35, 4),
(39, 35, 1),
(40, 35, 5),
(41, 35, 1),
(42, 35, 6),
(43, 35, 1),
(44, 35, 7),
(45, 36, 1),
(46, 36, 4),
(47, 36, 1),
(48, 36, 5),
(49, 36, 1),
(50, 36, 6),
(51, 36, 1),
(52, 36, 7),
(53, 36, 1),
(54, 36, 8),
(55, 37, 1),
(56, 37, 7),
(57, 37, 1),
(58, 37, 8),
(59, 37, 1),
(60, 37, 9),
(61, 37, 2),
(63, 38, 3),
(64, 38, 4),
(65, 39, 2),
(66, 39, 3),
(67, 40, 2),
(68, 40, 3),
(69, 40, 4),
(70, 40, 5),
(71, 41, 2),
(72, 41, 3),
(73, 42, 2),
(74, 42, 3),
(75, 42, 4),
(76, 42, 5),
(77, 43, 4),
(78, 43, 5),
(79, 43, 6),
(80, 44, 2),
(81, 44, 3),
(82, 44, 4),
(83, 44, 5),
(84, 44, 6),
(85, 45, 3),
(86, 45, 4),
(87, 45, 5),
(88, 45, 6),
(89, 46, 8),
(90, 46, 9),
(91, 46, 1),
(93, 47, 8),
(94, 48, 8),
(103, 50, 1),
(104, 50, 7),
(105, 50, 1),
(106, 50, 8),
(107, 50, 1),
(108, 50, 9),
(109, 50, 2),
(111, 51, 1),
(112, 51, 7),
(113, 52, 1),
(114, 52, 4),
(115, 52, 1),
(116, 52, 5),
(117, 52, 1),
(118, 52, 6),
(119, 52, 1),
(120, 52, 7),
(121, 52, 1),
(122, 52, 8),
(123, 53, 1),
(124, 53, 8),
(125, 53, 1),
(126, 53, 9),
(127, 53, 2),
(129, 54, 1),
(130, 54, 5),
(131, 54, 1),
(132, 54, 6),
(133, 54, 1),
(134, 54, 7),
(135, 54, 1),
(136, 54, 8),
(137, 55, 1),
(138, 55, 4),
(139, 55, 1),
(140, 55, 5),
(141, 55, 1),
(142, 55, 6),
(143, 55, 1),
(144, 55, 7),
(145, 55, 1),
(146, 55, 8);

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
(1, 20, 30, 5, 'Barang bagus', '2021-03-10 07:14:23', '2021-03-10 00:14:23'),
(2, 11, 30, 5, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:17:54', '2021-03-10 00:17:54'),
(3, 11, 31, 3, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:20:04', '2021-03-10 00:20:04'),
(4, 11, 32, 4, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:20:12', '2021-03-10 00:20:12'),
(5, 17, 32, 5, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:20:20', '2021-03-10 00:20:20'),
(6, 11, 33, 4, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:20:45', '2021-03-10 00:20:45'),
(7, 11, 34, 3, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:20:55', '2021-03-10 00:20:55'),
(8, 11, 35, 4, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:21:21', '2021-03-10 00:21:21'),
(9, 11, 36, 4, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:21:26', '2021-03-10 00:21:26'),
(10, 20, 36, 3, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:21:34', '2021-03-10 00:21:34'),
(11, 18, 37, 5, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:21:48', '2021-03-10 00:21:48'),
(12, 18, 38, 3, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:21:56', '2021-03-10 00:21:56'),
(13, 11, 39, 4, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:22:04', '2021-03-10 00:22:04'),
(14, 11, 40, 5, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:22:25', '2021-03-10 00:22:25'),
(15, 17, 40, 5, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:22:38', '2021-03-10 00:22:38'),
(16, 19, 40, 5, 'Barang bagus. Sampai dengan selamat, cepat dan sesuai gambar.', '2021-03-10 07:22:47', '2021-03-10 00:22:47'),
(17, 11, 41, 1, 'Barang datangnya lama. Kemasannya juga rusak', '2021-03-10 07:23:51', '2021-03-10 00:23:51');

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
(80, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJTZWxsZXIiLCJ1c2VyX2VtYWlsIjoic2VsbGVyMTJAZ21haWwuY29tIiwibGV2ZWwiOiJzZWxsZXIiLCJpYXQiOjE2MTUyNjQ3NTksImV4cCI6MTYxNTMwMDc1OX0.MZD5OtNSB34VTNwy8R9Qmh27ouzzk21BGaeOv7GKNAs');

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
  MODIFY `detail_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `histories`
--
ALTER TABLE `histories`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `otp`
--
ALTER TABLE `otp`
  MODIFY `id_otp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `product_color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `product_images`
--
ALTER TABLE `product_images`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT untuk tabel `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `product_review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `product_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

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

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
