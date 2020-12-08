-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2020 at 11:09 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

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
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_color` varchar(20) NOT NULL,
  `category_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_color`, `category_image`) VALUES
(1, 'T-Shirt', '#CC0B04', 'https://s3-alpha-sig.figma.com/img/6b1b/11de/b984818831143e1889054e98377f4423?Expires=1607904000&Signature=VhgWnXbYc98-JCDEuE1a41stQZNV22Ai6b5oSc6penxiWiFg1sbbKZWh7HJtV~jORDefcqP8gCMRxIJ6hLMUMn-S6Pn3z6WYEnlsw8CFo79BDcdv~pOufo-aKvOAqOUXN1jv6T7EYX-gzWytL0-AbOv~EYwzecqaEmcJW83r9HmbjYCcjReYd3WfRAlSaF5rD-pU3Vm3ys~k~dYZhh8fT8lR8Cy4nUcri7Qd-SxfZVzRbhAM-3bPSxktmQmKktZ2NCCzSzWx68dU6Mzs-Wb-8IUFuEDT84tCBZKIa-N6O9n6kO~s6-w3PptUSA-v1kS0wP528HF9H8~dXLWmgbXVgQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
(2, 'Shorts', '#1C3391', 'https://s3-alpha-sig.figma.com/img/49a2/88f8/ad6aeec8a073aa0a657e7c7519263626?Expires=1607904000&Signature=Ktz-UMalSSlYyblQbMNCVOFNJI3FfzxSZwNBvpgsP5shD4gxs~bHmAi-vMS9FewuTe~ABVhdlYq1cmi93F2Fh~pIOiAfr4ZQdOcKGDs-hvACxVnWVWyZL~MQ7yNake~iOPKY~-5BvQoqsyd4SOnnlGQs-~p9wJ4B~WaUPrCSjKWyBuNojJK5J2z9ueDjb7zSzJ27VBREsjCWM0~g8cb0woeMl4P0raVm91TBtevFszGR1z87i~PGz35CzEdUR2yyggcIPq-8MNXZweho7uT8zLouN~f0GcVjBMMVrvxIV8PH8IiS4MPuyGaSv9WJK542vRwBEjdHy2bUM~k~XG9QTg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
(3, 'Jacket', '#F67B02', 'https://s3-alpha-sig.figma.com/img/65af/55c4/5d103020c208199aa0396789ad645df1?Expires=1607904000&Signature=Lmc5789rqrQN5z-vOh~8222F0hdNkf3aNJblDK9X6kLiZ7nhDniARnAaOiNKBVNppoH8xEl63DDi1cGiQHCbHTLPdCTAAdkos-S0jh~LxdtjrJGxqST-fBAWy56rQNdRWOYkZyaNFcje4Il63ghG2s7AP70s1XSmQ~8DDmkJol7yR6TB4Ry9VlbRPHv1Mi2Gilkr4Sh0XSzxUzo~Z35GqPuInMwPKxI~yMszBiSNkqJtg2ubV0W3YOYEsxlYbFMnsKSRT5aemB6ygyTow846-jKHW7mPmh5J4iwR7nmUF-Smk6MOs5LNHCIzcrK9OoSPJKXoqGmIPBQIbBJ04wZXVw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
(4, 'Pants', '#F31F51', 'https://s3-alpha-sig.figma.com/img/64b4/4714/896286200d422369861a2d608f35b6f4?Expires=1607904000&Signature=S5h7~WKYkNBs7qiyrRWGtlHSMrQhXv6HM2LXPUlLGOIMKDKqjht~LCOBudrebUbGn1I7q~Bufot1~R9SncYAu5ApD5GdkQ6NxorpwSFG9y426E4NbnwnD3cfLceyKsUgXSKoFhxF50nCF6CJLqcPd-uVwLUw2L99HIkc-Y65HLzk6mWrGfv60t4q3bCcNiiFiLjrvIDOuPHjPEJE9tIJVZaUblUSYcau0iSjD-i5PExBt1WvB1Oh7Qq04466wOMfisLdcCkWoPPK0M4~0RhcVx2o0AtPmknWb0DuJsBun-7r9eK2xthWsVmmSWE4hJIk~GUPG2If8Q7Ho6ECTm1zUg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
(7, 'Shoes', '#57CD9E', 'https://s3-alpha-sig.figma.com/img/fc9b/6b9b/45aad43ae695c2de7b3949ff451bd7a1?Expires=1607904000&Signature=AU~0FfPSuIp~gtH7Fi9oNAP~7YbM32SAs~aeNiYIcOS7xC9xwZeC6iC0YeVfYkCfqlfYXAmiUjYUmlbU00BIjHwRM9S9WwNqKPK4BKCMU3tr-JzHKq1KqR~k0eAAeZjt52CogXm4ySfSanM5bzoEB5RXbGWb0kaEBLViRw82vtif45UzeA3OVskayQtME6m6-T1AYhNyyeG1eOyMifwvwJwu5SGSKfbyKTLqjdfjuykg-QBo18pQTiWci9stpfNe3isi7toOEVMsaWv4KUFwpmOc7CMVdq-DTaifFe8Dla3XF1pPNfX~yEUa22t0XtzTYAF2AozF7h1gM2zDPDoTsQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
(8, 'High heels', '#5650D8', 'https://s3-alpha-sig.figma.com/img/e4ba/3e76/a9bf0f820f0f0a5c5b5c7383b26d989c?Expires=1607904000&Signature=HjMCzoiqUe9xP9FW6aMa7tWWV7APbCXDDXEO7P2vxLHANkwT9IJ8UxR5tRJHrbITbdylwBXyNioS2aMze~rSfOClWe5VhFl32VE03kc1rei7bh19EEXQS4a10Q-VaFNckVEzRMA8T3QrjZrpA0rNvJo-~WxNOmnwVWdMt7KJl9GBH9LNhYaqHxvxx3LRvI1neLnZ~e9gDtENglWVELAg1q19gFXYtP705RBM5MtekIConvrnzQhjB8oUeTNCVNjUKloXOoyUFag2H5myDT3oFPodgPceeuqfv0i2MnUN5DtuiILfJ5GsKDMoll2XWuQJStzwYSzQZ2ciZY9~6MBtxw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
(9, 'Handbag', '#50C8D8', 'https://s3-alpha-sig.figma.com/img/d554/5e85/c5a03743f4f3d8d7227b7cd1854213ac?Expires=1607904000&Signature=J2jKPwG6eczD~3KZ8wTuaeFH1HDRy99~lAFU1Jxoiv-DJV8MTGxsG98l3ZmP67trf1REUxsDiRci0iRiUWdNxLXGnFHcvbLklhhI2ScodeZgVgFRiDFlWsqGuyJWQmHqE6zzKEHCf39V4qADnVV266zjNXmwfXz64kbFqu3BxKL90TpHc-4ltOSzp5m9lhvLMCNa-MrMQ3Ift9FodLnqCq07z9GAp1AcjUITaL9DYY7RUp9JptJLqXnCbFlZwPjv4qngIN1H0QwjrP7sKBhM9lvMByRLX0iNnDpRadhlcQpPIhu0g8HQv9DOKSrD6WM~RO7LXiTKpoJ2aA7fpOTPAQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`color_id`, `color_code`) VALUES
(1, '#020202'),
(7, '#151867'),
(3, '#B82222'),
(5, '#BEA9A9'),
(6, '#E2BB8D'),
(4, '#F3F433'),
(2, '#FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `condition_id` int(11) NOT NULL,
  `condition_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`condition_id`, `condition_name`) VALUES
(3, 'Broken'),
(1, 'New'),
(2, 'Used');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`user_id`, `user_name`, `user_email`, `user_password`, `created_at`, `updated_at`) VALUES
(1, 'usman', 'usman231@gmail.com', '$2b$10$315E19f1tAnHw/Do3.8ncunGMunodTgRPIeX09Fj1lgcTh6wRfY9S', '2020-12-07 12:19:06', '2020-12-07 12:19:06'),
(2, 'usman', 'usman231@gmail.com', '$2b$10$rULxnb5EkXSXpyKKIo9MKe7xNvpwFjbqwPbiwgZuxKfrp8E6H3eAe', '2020-12-07 12:19:26', '2020-12-07 12:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `detail_histories`
--

CREATE TABLE `detail_histories` (
  `detail_history_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) NOT NULL,
  `product_size_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `history_code` varchar(255) NOT NULL,
  `history_subtotal` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`history_id`, `user_id`, `history_code`, `history_subtotal`, `created_at`) VALUES
(26, 2, 'uksykm6nfkccuc9geijxqr', 80000, '2020-12-03 15:01:56'),
(27, 1, 'p7k02eb6che9q0188t5uvt', 180000, '2020-12-03 15:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `image_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `image_link`) VALUES
(1, 'adefsefsef');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
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
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `brand_id`, `category_id`, `product_price`, `product_qty`, `product_condition`, `product_description`, `created_at`, `updated_at`) VALUES
(16, 'KAOS PRIA / KAOS POLOS / T-SHIRT OVERSIZED OVERSIZE PREMIUM hitam - Hitam, M', 1, 1, 75000, 10, 'New', 'Deskripsi KAOS PRIA / KAOS POLOS / T-SHIRT OVERSIZED OVERSIZE PREMIUM hitam - Hitam, M\r\nVariation : BLACK, WHITE, NAVY BLUE, YELLOW, GREEN ARMY, GREEN BOTTLE, GREEN LIME, BEIGE CREAM, YELLOW ROTTEN, MISTY GREY\r\n\r\nSize chart (P x L)\r\n\r\nS (71 x 51)\r\nM (72 x 54)\r\nL (75 x 56\r\nXL (78 x 61)\r\n\r\nModel tinggi 168 berat 55 size S\r\n\r\nHallo\r\nSamwells Project ngeluarin kaos polos oversize pertama di TOKOPEDIA !!\r\n\r\ndengan bahan cotton Premium terbaik saat digunakan terasa nyaman dan tidak gerah, cocok dipakai sehari-hari.\r\n\r\n\r\nFabric : 100% Cotton Premium\r\nProfessional Cutting\r\n\r\n1000000% FOTO ASLI MODEL MENGGUNAKAN SIZE S ( Tinggi 168 cm )\r\n\r\nJIKA KALIAN BINGUNG MENENTUKAN UKURAN SILAHKAN TANYAKAN DI KOLOM DISKUSI DENGAN MENCANTUMKAN BERAT DAN TINGGI BADAN KALIAN YAA\r\n\r\nMOHON TANYAKAN STOK TERLEBIH DAHULU DI KOLOM DISKUSI AGAR TIDAK SALAH KIRIM\r\n\r\n\r\nUntuk stok tanyakan terlebih dahulu yaa\r\n\r\n#kaospria #kaosoversize #kaospolos #bajupolos', '2020-12-03 05:57:24', '2020-12-03 05:57:24'),
(17, 'BAJU KAOS PRIA COTTON COMBED 30,s FASHION CASUAL BAJU DISTRO htm', 2, 1, 59900, 15, 'New', 'Deskripsi BAJU KAOS PRIA COTTON COMBED 30,s FASHION CASUAL BAJU DISTRO htm\r\nCantumkan ukuran (size) diketerangan\r\n\r\nPerhatikan size chart dan warna bahan sebelum order\r\n\r\n**MATERIAL YANG KAMI GUNAKAN**\r\n\r\n-KAOS/T SHIRT\r\nKatun combat 30\'s\r\ndengan kerapihan jahitan yg sempurna,halus dan lembut, tdk panas saat di kenakan dan mudah menyerap keringat\r\n\r\n=-SABLON-=\r\nflock-polyflex\r\nhasil sablon yg sangat luar biasa sempurna,tdk pecah,tdk berkerut dan awet ketika telah menempel di material.\r\n\r\n*--SIZE CHART--*(Lokal/Asia)\r\n(Lebar dada x Panjang badan)\r\n\r\nKAOS/T SHIRT\r\nM ~:49x69\r\nL ~ :52x73\r\nXL~:54x75\r\n\r\nCek toko mandala projec untuk model lainnya.\r\nHappy Shopping~', '2020-12-03 06:11:51', '2020-12-03 06:29:48'),
(18, 'kaos pria sweater lengan panjang cowok babyterry baju SIMPLE THINGS - Merah, M', 2, 1, 59900, 5, 'New', 'Deskripsi kaos pria sweater lengan panjang cowok babyterry baju SIMPLE THINGS - Merah, M\r\nBaju Fashion Pria\r\nBahan babyterry premium\r\nLengan panjang\r\n\r\nTersedia 3 ukuran:\r\nM\r\nUkuran LD: 98cm, PB: 64cm.\r\nhttps://tokopedia.link/FojyE2EAJ5\r\n\r\nL\r\nUkuran LD: 106cm, PB: 69cm.\r\nhttps://tokopedia.link/n14rOfIAJ5\r\n\r\nXL\r\nUkuran LD: 114cm, PB: 74cm.\r\nhttps://tokopedia.link/vcky5rLAJ5\r\n\r\nWarna:\r\n- maroon\r\n- hitam\r\n- abu-abu\r\n- biru\r\n- putih\r\n- merah\r\n- navy\r\n- kuning\r\n\r\n- WAJIB TANYAKAN STOCK TERLEBIH DAHULU SEBELUM ORDER.\r\n- CANTUMKAN WARNA YANG DIINGINKAN KETIKA PESAN.\r\n\r\nMinat?\r\nSilakan langsung di order saja.\r\nREADY STOCK.\r\n\r\n(Setiap produk memiliki toleransi jahitan 2 - 4 cm, pastikan membeli produk untuk mengukur terlebih dahulu).\r\n\r\nWELCOME RESELLER & DROPSHIPPER.', '2020-12-03 06:17:59', '2020-12-03 06:17:59'),
(19, 'T-Shirt Slugs / Baju Kaos Distro Pria & Wanita / Cotton 30s', 2, 1, 32900, 15, 'New', 'Deskripsi T-Shirt Slugs / Baju Kaos Distro Pria & Wanita / Cotton 30s\r\nHARAP BACA SEBELUM ORDER YAH\r\n\r\nEstimasi ukuran :\r\nALLSIZE FIT M - L\r\nQuality Import\r\nJahitan Double Stick dan Rapih\r\nDada 98CM-100CM*Barang Sesuai Dengan Foto Tanpa Edit\r\nLebar 50cm panjang 70cm\r\nBahan Cotton Combed 30S (Nyaman dan tidak panas)\r\n\r\nPertanyaan yang sering ditanyakan :\r\n1. Q : ada warna lain ?\r\nA : 1 warna yah setiap model, sesuai Foto\r\n\r\n2. Q : Bisa beli lebih dari 1 ?\r\nA : Bisa yah, caranya masukan item 1 per 1 ke keranjang atau kasi deskripsi\r\n\r\nCek toko Revenge Eleven untuk model lainnya.\r\nHappy Shopping~', '2020-12-03 06:25:10', '2020-12-03 06:29:42'),
(20, 'LD 204 ( FREE SIZE FIT TO 4XL ) Baju atasan batwing SANGAT BESAR helen - Hitam', 1, 1, 69300, 10, 'New', 'Deskripsi LD 204 ( FREE SIZE FIT TO 4XL ) Baju atasan batwing SANGAT BESAR helen - Hitam\r\nORIGINAL merek STAYL ( Stanleyandyuly ) ada label dan handtag\r\n\r\nBAHAN KIRANA SPANDEX,\r\n\r\nBahan Produk : Kirana Spandex\r\n\r\nUkuran Produk:\r\n- Lingkar Dada : 204 cm\r\n- Lebar Bahu : 73 cm\r\n- Lingkar Ketiak : 38 cm\r\n- Panjang Lengan : 19 cm\r\n- Panjang Depan : 68 cm\r\n- Panjang Belakang : 79 cm\r\n\r\nKeterangan Produk:\r\n- Lengan Batwing / Dolman / Kelelawar\r\n- Leher O\r\n- Belahan Samping Kanan Kiri, Good Quality\r\n\r\n\r\n1. Semua product ready dan siap kirim\r\n\r\n2. Order anda sangat berharga bagi kami dan kami selalu mempertahankan pelayanan toko, semua product yang akan dikirim akan dicek dulu satu per satu, jika anda menerima product yg salah / reject ini bukan hal yang kami sengaja, silakan menghubungi admin jika ada kendala\r\n\r\n3. Jadwal Pengiriman di Coco Claire Fashion :\r\n\r\n- Buka setiap hari SENIN-JUMAT jam 8 pagi s/d jam 4 sore + SABTU s/d jam 1 siang.\r\n\r\n- SLOW Respon apabila diluar jam buka toko, tapi akan tetap kami balas CHAT nya ketika ada kesempatan.\r\n\r\nTransaksi yang selesai SEBELUM jam\r\n- 14.30 (Gosend + Grab)\r\n- 3 sore (Ekspedisi Reguler)\r\n- SABTU semua ekspedisi sebelum jam 11 siang akan dikirim di hari yang sama.\r\n\r\nMINGGU + CUTI Bersama + LIBUR Nasional selalu tutup (tidak ada pengiriman)\r\n\r\n4. Tidak menerima ganti warna / ukuran via chat... semua akan dikirim sesuai pesanan\r\n\r\n5. Terima kasih ????', '2020-12-03 06:30:49', '2020-12-03 06:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `product_color_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_value` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`product_color_id`, `product_id`, `product_attr_value`) VALUES
(3, 16, '#020202'),
(4, 17, '#020202'),
(5, 18, '#B82222'),
(6, 18, '#020202'),
(7, 19, '#151867'),
(8, 20, '#BEA9A9'),
(9, 20, '#151867');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`product_image_id`, `product_id`, `product_attr_value`) VALUES
(2, 16, 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/9/17/72490828/72490828_da91b83b-df53-49d6-9111-4545afa75015_1737_1737'),
(3, 16, 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/9/17/72490828/72490828_ee06ef4f-b726-4980-be3d-0ae279e09269_1559_1559'),
(4, 16, 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/9/17/72490828/72490828_8db7ea12-824c-4cee-869c-a9ddc7cf6049_1765_1765'),
(5, 16, 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/9/17/72490828/72490828_e534f33e-020f-4660-8277-5abe645486c9_1833_1833'),
(6, 16, 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/9/19/72490828/72490828_c05aeaf8-95f1-4ae9-b503-d2b610c4e86f_1080_1080'),
(7, 17, 'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/7/22/2d211d55-8f9e-46e8-b418-2010e06899e7.jpg'),
(8, 17, 'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/6/20/cf68785d-0bd0-4634-a170-89361a21eee7.jpg'),
(9, 17, 'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/6/20/99c4bb94-4186-43c1-850c-f5240e90bfd5.jpg'),
(10, 17, 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/6/27/955428238/955428238_768393dd-28bb-4c25-8bbf-05ada2b53758_960_960.jpg'),
(11, 17, 'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/6/28/dc7a3548-d7f2-4fc4-b0f3-95d28f645f26.jpg'),
(12, 18, 'https://ecs7.tokopedia.net/img/cache/900/product-1/2020/8/7/12657115/12657115_7ad72513-b434-4b9a-94b8-0caea4bc8d32_1084_1084'),
(13, 18, 'https://ecs7.tokopedia.net/img/cache/900/VqbcmM/2020/8/3/eaee8a73-4c6c-4ddc-b54f-c1bb1d7effbe.png'),
(14, 19, 'https://ecs7.tokopedia.net/img/cache/900/product-1/2020/4/28/4797930/4797930_083b6525-dd36-4b2a-b2f8-3e01a851e46e_1080_1080.jpg'),
(15, 20, 'https://ecs7.tokopedia.net/img/cache/900/product-1/2019/2/26/43555772/43555772_5f63538e-0e1d-40b7-81c4-72a354db13d8_1080_1080.jpg'),
(16, 20, 'https://ecs7.tokopedia.net/img/cache/900/product-1/2019/2/26/43555772/43555772_3d3f3e94-c401-414d-ba45-cabbeec7ad91_2048_2730.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `product_review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `product_size_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`product_size_id`, `product_id`, `product_attr_value`) VALUES
(11, 16, 's'),
(12, 16, 'm'),
(13, 16, 'l'),
(14, 16, 'xl'),
(15, 17, 'm'),
(16, 17, 'l'),
(17, 17, 'xl'),
(18, 18, 'm'),
(19, 18, 'l'),
(20, 18, 'xl'),
(21, 19, 'm'),
(22, 19, 'l'),
(23, 20, 'm'),
(24, 20, 'l');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `product_tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
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

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL,
  `size_value` varchar(10) NOT NULL,
  `is_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sizes`
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
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'Jeans'),
(2, 'Men');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`),
  ADD KEY `color_code` (`color_code`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`condition_id`),
  ADD KEY `condition_name` (`condition_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `detail_histories`
--
ALTER TABLE `detail_histories`
  ADD PRIMARY KEY (`detail_history_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_color_id` (`product_color_id`),
  ADD KEY `product_size_id` (`product_size_id`),
  ADD KEY `history_id` (`history_id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`history_id`),
  ADD UNIQUE KEY `history_code` (`history_code`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_condition` (`product_condition`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`product_color_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_attr_value` (`product_attr_value`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`product_review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`product_size_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_attr_value` (`product_attr_value`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`product_tag_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_user` (`user_id`),
  ADD KEY `review_product` (`product_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`),
  ADD KEY `size_value` (`size_value`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `condition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_histories`
--
ALTER TABLE `detail_histories`
  MODIFY `detail_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `product_color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `product_review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `product_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `product_tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_histories`
--
ALTER TABLE `detail_histories`
  ADD CONSTRAINT `detail_histories_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `histories` (`history_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_colors_ibfk_2` FOREIGN KEY (`product_attr_value`) REFERENCES `colors` (`color_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sizes_ibfk_2` FOREIGN KEY (`product_attr_value`) REFERENCES `sizes` (`size_value`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
